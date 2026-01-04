---
layout: project
title: "RARE Spec v2 — Rapid Autonomic Reinforcement Engine (Quadruped)"
slug: rare-spec-v2
guilds:
  - complex-futures
summary: >-
  A safety-constrained online learning layer that continuously tunes gait + stabilization parameters from proprioceptive/IMU reward signals.
---

# RARE Spec v2 — Rapid Autonomic Reinforcement Engine (Quadruped)

**Parent Project:** [Flying Robots](../)

## 0) Definitions

* **RARE (Rapid Autonomic Reinforcement Engine):** A safety-constrained online learning layer that continuously tunes gait + stabilization parameters from proprioceptive/IMU reward signals. It sits between reflex control (hard safety) and high-level behavior (navigation/teleop), improving stability and efficiency in minutes without requiring simulation.

* **L0 Reflex Kernel:** Deterministic stabilization + guardrails. Enforces invariants and executes panic primitives.

* **L1 Autonomic Reinforcement:** Fast adaptation. Selects micro-actions and parameter deltas; learns online; stores context-keyed presets.

* **L2 Behavior:** Slow intent (go there, turn, pose). Can be scripted, teleop, planner, or learned.

* **Feline Balance Manifold:** A learned proprioceptive “balance space” representing cat-like smoothness and stability from IMU dynamics + command history + actuator constraints.

* **Body-SLAM:** Self-centric state estimation + model correction (what the body is doing AND what the body can do right now), analogous in spirit to vehicle SLAM but applied to the robot’s body.

---

## 1) Why this architecture (reflection of what we discussed)

You’re not trying to train “walking from scratch.” You’re building a layered nervous system:

* **Body protects itself first** (don’t fall, don’t snap joints, don’t overheat).
* **Rapid learning** happens in a tiny action space with short-horizon credit assignment.
* **Calibration + wear** are treated as normal operating conditions.
* **Smoothness under surprise** is the goal: keep moving gracefully even when the world or hardware deviates (obstacles, slip, servo degradation, partial failure).

---

## 2) Control stack (timing + responsibilities)

### L0 — Reflex Kernel (target 200–500 Hz; 100 Hz acceptable)

Responsibilities:

* Executes joint PD / impedance (or leg-level virtual springs).
* Enforces invariants:

  * joint limits (pos/vel/acc)
  * saturation shaping (PWM bounds)
  * overtemp/overcurrent/brownout protection
  * “safe pose” fallback
* Owns **panic primitives**:

  * brace / freeze
  * controlled crouch / sit
  * stance splay
  * step-back / abort gait cycle

Outputs:

* Final joint targets (or safe deltas) to the actuator layer.

### L1 — Autonomic Reinforcement (25–100 Hz)

Responsibilities:

* Reads a summarized state snapshot.
* Chooses from a small set of actions:

  * parameter deltas (stance width, COM shift, step height)
  * gait timing offsets (phase, duty factor)
  * gain profile selection (soft/normal/stiff)
  * recovery primitive selection (none/brace/crouch/step-back/splay)
* Updates a lightweight learner (bandit / tiny actor-critic / hill-climb) under **safe exploration limits**.

Outputs:

* Parameter deltas and/or recovery primitive requests (never raw joint angles).

### L2 — Behavior (1–10 Hz)

Responsibilities:

* Sets intent: velocity vector, heading, target posture, gait mode.
* Teleop/planner/behavior tree/learned policy all allowed.
* L0/L1 may reshape/refuse destabilizing intent.

---

## 3) Sensors and the “feline balance” signal

### Why two IMUs are a big deal

One IMU tells you “I’m tipping.” Two IMUs let you infer:

* **relative flex / twist** between body segments
* **phase lag** (front vs back oscillation precursor to faceplant)
* **impact location hints** (front spike precedes rear spike)

Recommended placements:

* **IMU A:** torso (primary orientation)
* **IMU B:** pelvis (rear reference) OR shoulder girdle/head (front reference)

### Observations (works even without joint encoders)

* IMU A: accel/gyro + derived orientation
* IMU B: accel/gyro + derived orientation
* Relative orientation and relative angular velocity: A vs B
* Commanded gait phase + step schedule
* Actuator health proxies:

  * saturation flags (PWM near rails)
  * battery sag / voltage
  * temperature if available
* Optional upgrades:

  * foot contact sensors
  * motor current estimates
  * joint encoders

---

## 4) Proprioceptive vector space (the manifold)

### Goal

Create a latent vector **z** that represents “how stable / coordinated / cat-like I am right now.”

### Encoder inputs → latent z

Typical input window (e.g., 0.2–0.8s):

* IMU A time-series
* IMU B time-series
* derived features: tilt, angular rates, jerk, relative phase
* commanded gait phase + desired velocity
* PWM saturation metrics + battery sag

### Self-supervised training objectives

(choose one or combine):

* **Predict-next-window:** predict IMU signals over the next short horizon
* **Reconstruction:** compress and reconstruct IMU windows
* **Contrastive consistency:** nearby-in-time windows should have nearby embeddings; instability events should separate

### Anomaly score

Use prediction/reconstruction error as:

* “something changed” indicator (obstacle, slip, servo failure)
* a trigger for panic/recovery
* a context key for memory (see below)

---

## 5) Adaptable kinematics model (hybrid: analytic + learned residual)

### Why hybrid

* Analytic kinematics gives structure and controllability.
* A learned residual compensates for:

  * imperfect calibration
  * compliance/backlash
  * surface differences
  * damage/failure modes

### Nominal model

* Standard IK/FK per leg
* Gait generator (phase, duty factor, step height)

### Learned residual

A tiny model produces corrections, conditioned on **z** and recent history:

* COM shift corrections (x/y)
* stance width adjustments
* step height adjustments
* phase offsets per leg
* per-leg “effective length/compliance” factors

Hard rule:

* Residual outputs **parameter deltas** only.
* L0 always enforces safety invariants.

---

## 6) Reinforcement (what actually learns fast on real hardware)

### Keep action space small

Example L1 action set:

* Δstance_width ∈ {−, 0, +}
* ΔCOM_x, ΔCOM_y ∈ {−, 0, +}
* Δstep_height ∈ {−, 0, +}
* gain_profile ∈ {soft, normal, stiff}
* recovery ∈ {none, brace, crouch, step-back, splay}

### Reward: “smooth under surprise”

Build reward mostly from proprioception:

* **stability:** penalize tilt magnitude + angular velocity spikes
* **smoothness:** penalize jerk / rapid accel changes
* **settling time:** penalize jerk / rapid accel changes
* **effort:** penalize sustained saturation / high actuation
* **coherence:** penalize excessive divergence between IMU A and B beyond expected flex band
* **safety events:** big negative when L0 triggers panic

Note:

* Goal progress belongs mainly to L2.
* L1’s job is grace and survival.

### Learning methods that fit Pi-class compute

* Contextual bandits (fast, stable)
* Tiny actor-critic with very small network
* Evolutionary hill-climb on parameter vector

### Safe exploration constraints

* cap max delta per second on each parameter
* disallow exploration in known-danger contexts
* require “cooldown” after panic event

---

## 7) Autonomic memory (the feature that makes it feel alive)

Store “good presets” keyed by context:

* surface proxy (vibration signature + slip/anomaly patterns)
* battery voltage range / sag behavior
* payload/mass proxy (effort to stand)
* temperature state
* detected fault mode (persistent anomaly signature)

Memory entry contains:

* gain profile
* gait parameters
* COM shift baseline
* stance width baseline
* preferred recovery primitive

Behavior:

* if context matches, recall preset immediately
* continue refining locally within safe bounds

---

## 8) SLAM analogy: how it maps to your self-driving visualization concept

Self-driving SLAM is world-centric. Here the first win is **body-centric SLAM**:

* **State estimation:** what is my body doing (stability state, oscillation mode, contact plausibility)
* **Model correction:** what can my body do right now (effective compliance, leg strength, actuator health)

Then optionally add world mapping:

* simple obstacle cues from proprioception (unexpected decel/pitch + anomaly spike)
* add ToF/depth/ultrasonic later if desired

---

## 9) Modules (drop-in architecture)

1. **StateBus**

* timestamped ring buffer of sensor + command snapshots

2. **ReflexKernel (L0)**

* limiters + guardrails
* panic primitives
* outputs safe actuator commands

3. **ManifoldEncoder**

* produces latent z + anomaly score

4. **RewardEstimator**

* computes decomposed reward terms and scalar reward

5. **AutonomicPolicy (L1)**

* action selection in tiny action space
* consults AutonomicMemory

6. **AutonomicTrainer**

* online updates under safe exploration

7. **Telemetry + Replay**

* log everything needed to replay panic events and learn offline

---

## 10) Implementation path (phased, practical)

### Phase 1 — Logging + baseline reflex

* stable L0 with robust panic primitives
* high-quality time sync for IMUs
* logging pipeline + replay tools

### Phase 2 — Proprioceptive manifold

* train encoder self-supervised (predict-next-window or reconstruction)
* compute anomaly score
* use anomaly to trigger recovery and context keys

### Phase 3 — Residual adaptation (tiny action RL)

* enable L1 to adjust a few parameters
* bandit/actor-critic/hill-climb
* confirm improvement in minutes on new surfaces

### Phase 4 — Robustness: obstacles + damage modes

* treat persistent anomalies as fault modes
* memory recall for known modes
* optional: add contact sensors/current proxies

---

## 11) Visualization concept (self-driving style, but “cat nervous system”)

A dashboard that looks like autonomy UI, split into two layers:

### Layer A — Body manifold

* latent z trajectory over time (2D projection)
* stability envelope / risk score
* per-leg confidence bars
* anomaly heatmap per leg/segment
* gait phase wheel + timing offsets

### Layer B — Local terrain sketch (optional)

* slip likelihood timeline
* inferred obstacle/contact events
* “safe stepping” confidence over last N seconds

---

## 12) Success criteria

* Learns usable stability improvements within **minutes** on a new surface.
* Recovers gracefully from common perturbations without human retuning.
* Maintains function under degraded actuators by shifting stance/COM/timing.
* Provides interpretable logs: you can replay and see why it panicked.

---

## 13) Hard constraints (non-negotiables)

* L1 never bypasses L0.
* Exploration is bounded.
* Panic primitives are deterministic and always available.
* Calibration drift and servo inconsistency are assumed normal.
