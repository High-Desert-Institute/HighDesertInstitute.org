---
layout: project
title: "Community Weather Observatory"
slug: community-weather-observatory
guilds:
  - complex-futures
summary: >-
  Community Weather Observatory is a community-owned environmental intelligence initiative that combines:
---

## Project definition

Community Weather Observatory is a community-owned environmental intelligence initiative that combines:

1. Weather satellite downlinks (NOAA + international sources),
2. Local weather and pollution sensing networks,
3. Mesh-native alert distribution,
4. Hyper-local model refinement,

into one open, replicable toolkit for neighborhood-scale forecasting and emergency-relevant awareness.

The goal is to move from coarse regional outputs toward adaptive, local precision ("foveated/chombo-like" refinement where people actually live).

---

## Why this exists

Regional models are useful but often too coarse for block-level conditions, especially across microclimates and diverse geographies. Communities need:

* Better local visibility,
* Faster detection of significant changes,
* Reliable alerting paths when internet/cell connectivity is weak,
* Open infrastructure they can inspect, operate, and replicate.

---

## Current pipeline (working draft)

### Pipeline overview

**Data Sources → Analysis → Forecasts**

### 1) Data Sources

* **Satellite links (primary downlink ingest)**

  * **NOAA GOES** ([reference](https://en.wikipedia.org/wiki/Geostationary_Operational_Environmental_Satellite))
  * **Meteosat** ([reference](https://en.wikipedia.org/wiki/Meteosat))
  * **MetOp** ([reference](https://en.wikipedia.org/wiki/MetOp))
  * **Elektro–L** ([reference](https://en.wikipedia.org/wiki/Elektro%E2%80%93L))
  * Additional international weather satellite products over time
* **Weather station networks**

  * Used to fine-tune forecasts in smaller areas using historic and real-time station data
* **Environmental monitoring feeds**

  * Air quality / pollution datasets
  * Additional public and partner environmental indicators
* **HDI mesh weather/environmental sensor networks**

  * Hyper-local observations from community-deployed nodes
* **Community-contributed observations (future expansion)**

  * Structured local reports to improve interpretation and model validation

### 2) Analysis (community-extendable)

* Unified ingest, normalization, and quality-control pipeline
* Spatiotemporal feature engineering across satellite + station + sensor inputs
* **Ensemble approaches**

  * Random forest regression
  * Other ensemble methods (as tested and validated)
* **Multivariate regression techniques**
* **Other experimental architectures**

  * Hybrid and exploratory model designs contributed by the community
* Model comparison, backtesting, and continuous error tracking
* Uncertainty/confidence scoring attached to all forecast outputs

### 2.5) Foveated Chombo Concept (working design)

**Proposed name:** **Foveated Neighborhood AMR (FN-AMR)**
(*AMR = adaptive mesh refinement, inspired by Chombo-style nested grids*)

Goal: keep regional context from coarse models while automatically increasing resolution only where local risk/complexity is high (neighborhoods, microclimates, corridors, valleys, heat islands, smoke paths).

#### Core idea

Use a multi-resolution tile stack:

* **L0 (regional base):** coarse grid for full-area continuity
* **L1 (city/subregion):** medium refinement in populated or hazard-prone zones
* **L2 (neighborhood):** high-resolution patches activated by triggers
* **L3 (micro-zones, optional):** very high resolution in short-lived hotspots

Each finer level inherits boundary conditions from the parent and adds local sensor constraints.

#### Trigger map for refinement ("foveation score")

At each update step, compute a refinement score per tile using:

* Forecast error residuals
* Sensor density and recent variance
* Terrain/urban complexity proxy
* Hazard intensity (wind shift, heat spike, PM jump, etc.)
* Community reports / validated observations

Example scoring form:
`R(x,t) = w1*error + w2*variance + w3*hazard + w4*terrain + w5*community_signal`

If `R(x,t)` crosses threshold T1/T2/T3, the tile is promoted to L1/L2/L3.

#### Data assimilation by level

* **L0:** satellite-heavy blending + station priors
* **L1/L2:** stronger weighting of local stations and mesh sensors
* **L3:** short-horizon nowcast emphasis with rapid refresh cadence

#### Model stack by level (practical path)

* **Baseline backbone:** multivariate regression + persistence/climatology baselines
* **Ensemble layer:** random forest regression + additional lightweight ensemble candidates
* **Residual correction:** per-neighborhood correction model to reduce local bias
* **Uncertainty model:** quantile outputs / confidence intervals per tile

#### Forecast products

* Dynamic-resolution map (not one fixed grid)
* Neighborhood forecast tiles with confidence labels
* Event objects with severity, confidence, and suggested action window
* Mesh-ready alert payloads prioritized by local impact

#### Operational constraints

* Set a **compute budget** and cap number of L2/L3 patches per cycle
* Use **decay rules** so patches downshift when conditions stabilize
* Maintain minimum sensor QA threshold before promoting tiles

#### Community contribution hooks

* Public plugin interface for candidate models
* Shared benchmark datasets + backtesting harness
* Leaderboard based on calibrated error + alert usefulness
* Governance gate before production promotion

#### Evaluation metrics for FN-AMR

* Improvement vs fixed-grid baseline (MAE/RMSE per hazard type)
* Alert lead-time gain in refined zones
* False alarm / miss rate by zone level
* Compute cost per additional precision gain
* Coverage equity: refined performance in underserved neighborhoods

### 3) Forecasts

* Hyper-local nowcasts and short-horizon forecasts at neighborhood scale

  * Answers questions like:

    * "Will it be warm enough at the park between 4–6 PM?"
    * "Is air quality likely to worsen near my neighborhood tonight?"
    * "Which nearby area will be coolest and cleanest for outdoor activity this afternoon?"
    * "Will strong winds pick up on my block before midnight?"
    * "Is smoke likely to move into our area in the next few hours?"
    * "Should our event move indoors based on heat and PM forecasts?"
    * "Are conditions near the school route safer now than an hour ago?"
    * "Is this a short spike or the start of a sustained weather shift?"
* Adaptive refinement outputs ("foveated/chombo-like" precision in priority areas)
* Forecast products for weather and environmental risk signals
* Event detection layer for significant local shifts

  * Rapid wind changes
  * Heat spikes
  * PM/air-quality surges
  * Severe-weather indicators
* Dissemination outputs

  * Operations dashboard and data products
  * Meshtastic + Meshtastic-LLM alert messages
  * Source-labeled advisories (official relay / community observation / model advisory)
* Feedback loop from outcomes + local reports back into analysis and model tuning

---

## Workstreams (modular HDI project structure)

### 1) Satellite Ground Segment Kit

* Ground station upgrades
* RF chain hardening and uptime monitoring
* Standardized ingest workflows

### 2) Sensor Mesh Kit

* Weather + air-quality node deployment
* Calibration and QA procedures
* Solar/off-grid friendly node designs

### 3) Hyperlocal Model Lab Kit

* Data fusion and feature engineering
* Neighborhood forecast products
* Uncertainty-aware outputs

### 4) Bellwatch Mesh Alerts Kit

* Event thresholds and message templates
* Mesh channel architecture
* Multilingual-ready concise alerting

### 5) Replication & Training Kit

* Open docs + CAD + scripts
* Operator curriculum
* Pilot replication support

---

## Architecture snapshot

Satellite streams + local stations + mesh sensors
→ ingest + normalization + QA
→ fused feature pipeline + model services
→ neighborhood forecast products + event detector
→ Meshtastic alerting + operations dashboard
→ open toolkit releases + training + replication

---

## Funding Goals

Things we already have funding for:

* CJ is donating all necessary compute and storage for the data analysis pipeline.
* We already have several satellite uplinks but they wont work for all of these sources so we will need to build several more.

**Target: $1,500**

* Satellite ground station upgrades

  * We need to build at least three more robotic tracking stations to collect all the needed data.
  * These will need to be sourced and rebuilt with new LNA/Filters/SDRs and SBCs to handle the tracking and capture work.

Stretch goals:

* $2,500 Integrate geiger counter network and forecasting
* >$2,500: replication kits + partner micro-grants

---

## If this works well, what it does for people

### 1) Better daily decisions at neighborhood scale

People get useful, local answers instead of generic regional averages:

* When to safely work, exercise, or commute outdoors
* Which nearby areas are cooler/cleaner right now
* Whether conditions are improving or getting worse in the next few hours

### 2) Earlier warning for local hazards

The system can detect meaningful local shifts faster (heat spikes, smoke/PM surges, wind changes, severe-weather signals) and turn those into concise, actionable alerts with confidence labels.

### 3) More resilient communication during disruptions

Mesh-native alerts reduce dependency on internet/cell availability. Communities keep a local information path during outages, overload, or disaster conditions.

### 4) Improved public health protection

Finer-grained weather + air-quality awareness helps people reduce exposure and adjust behavior sooner, especially for vulnerable groups (children, elders, people with asthma, outdoor workers).

### 5) Greater equity in forecasting quality

Foveated refinement can prioritize underserved neighborhoods and microclimates that are often underrepresented by coarse models, improving coverage where blind spots are largest.

### 6) Practical value for community operations

Neighborhood organizations, mutual-aid teams, schools, and local services gain a shared operating picture for planning and response.

### 7) Community ownership, trust, and skill-building

Because the stack is open and replicable, people can inspect methods, contribute improvements, and train local operators instead of depending only on opaque external systems.

### 8) A reusable toolkit for other regions

Success in one pilot area becomes a template others can deploy: ground station patterns, sensor mesh practices, model methods, alerting runbooks, and training materials.

### Human-centered north-star outcomes

If successful, this initiative should produce measurable real-world benefits such as:

* More lead time before high-impact local conditions
* Fewer missed local hazard events
* Lower false-alert fatigue through better confidence labeling
* Better forecast performance in underserved neighborhoods
* Higher local preparedness and faster community response

## Draft public positioning

**One-liner:** Community-owned weather intelligence from satellite-to-street, with neighborhood-level micro-forecasting and resilient mesh alerts.

**Campaign framing:** Build open infrastructure that helps communities forecast local weather and environmental data, detect changes earlier, and communicate faster.

---

## Open items for next workshop

1. Finalize public subtitle and short tagline.
2. Lock first pilot geography and hazard priorities.
3. Finalize alert taxonomy and channel policy.
4. Choose first replication partner profile.
5. Define first 30-day campaign content calendar.




## Upcoming workshops (draft)

### Workshop 1 — Project Kickoff and System Map

**Purpose:** Align everyone on mission, pipeline, and people-first outcomes.
**Format:** 2 hours (hybrid)
**Who should attend:** Core team, volunteers, partner orgs, community responders
**Agenda:**

* Why this project matters for neighborhoods
* Full pipeline walkthrough (Data Sources → Analysis → Forecasts)
* Roles, governance, and safety guardrails
* Pilot geography and hazard priorities

**Outputs:**

* Shared system map v1
* Draft role matrix
* Pilot area shortlist

### Workshop 2 — Satellite Ground Segment Build Day

**Purpose:** Build and standardize additional robotic tracking/downlink stations.
**Format:** 3–4 hour hands-on lab
**Who should attend:** RF builders, SDR users, hardware volunteers
**Agenda:**

* Hardware architecture for new stations (LNA/filter/SDR/SBC)
* Station setup checklist and QA tests
* Data ingest validation and uptime monitoring

**Outputs:**

* Ground-station build checklist
* QA acceptance tests
* First station commissioning report

### Workshop 3 — Sensor Mesh Deployment and Calibration

**Purpose:** Expand local weather/environmental sensing with reproducible calibration workflows.
**Format:** 3 hours (field + bench)
**Who should attend:** Sensor builders, field teams, neighborhood partners
**Agenda:**

* Node deployment patterns and siting principles
* Calibration and drift checks
* Data quality tags and maintenance intervals

**Outputs:**

* Sensor deployment SOP
* Calibration log template
* Priority deployment map

### Workshop 4 — Foveated Chombo Modeling Lab (FN-AMR)

**Purpose:** Turn the FN-AMR concept into an implementable model roadmap.
**Format:** 2.5 hours (technical design session)
**Who should attend:** Data scientists, model contributors, analysis team
**Agenda:**

* L0/L1/L2/L3 resolution strategy
* Refinement score design and thresholds (T1/T2/T3)
* Baseline models + ensemble plan + uncertainty outputs
* Compute budget and decay rules

**Outputs:**

* FN-AMR spec v1
* Backtesting plan
* Metrics dashboard requirements

### Workshop 5 — Community Data + Model Contributions

**Purpose:** Create a clear path for community-contributed observations and experimental models.
**Format:** 2 hours (participatory design)
**Who should attend:** Community observers, civic tech contributors, researchers
**Agenda:**

* Observation schema and validation workflow
* Plugin interface for model experiments
* Governance gate for production promotion

**Outputs:**

* Contribution guide v1
* Observation intake form
* Review and promotion rubric

### Workshop 6 — Community Mesh Alerts Operations

**Purpose:** Design actionable alert messages and operational policy for mesh dissemination.
**Format:** 2.5 hours (ops simulation)
**Who should attend:** Meshtastic operators, mutual-aid groups, communications leads
**Agenda:**

* Alert taxonomy (official relay / community observation / model advisory)
* Message templates, confidence labels, and priority levels
* Escalation logic and rate limits
* Tabletop scenario drills

**Outputs:**

* Alert policy v1
* Message template library
* Drill after-action report

### Workshop 7 — Public Dashboard and Human-Centered UX

**Purpose:** Ensure outputs are understandable and useful for real people making real decisions.
**Format:** 2 hours (design + user testing)
**Who should attend:** Designers, operators, community testers
**Agenda:**

* Forecast tile UX and confidence communication
* "Question-first" view (park, school route, event safety, etc.)
* Accessibility and multilingual considerations

**Outputs:**

* Dashboard wireframes
* UX test findings
* Prioritized improvements list

### Workshop 8 — Replication Toolkit and Trainer Prep

**Purpose:** Package the system so other communities can deploy it reliably.
**Format:** 2 hours (documentation sprint)
**Who should attend:** Documentation team, trainers, partner org leads
**Agenda:**

* Outpost-in-a-box structure
* Core playbooks, BOMs, scripts, and CAD package list
* Training curriculum and support model

**Outputs:**

* Replication kit outline v1
* Trainer guide draft
* Partner onboarding checklist

### Suggested workshop cadence

* **Weeks 1–2:** Workshops 1–2
* **Weeks 3–4:** Workshops 3–4
* **Weeks 5–6:** Workshops 5–6
* **Weeks 7–8:** Workshops 7–8

### Cross-workshop deliverables

By the end of this series, the project should have:

* A validated pilot implementation plan
* Commissioned ingest + sensor workflows
* FN-AMR modeling spec and evaluation plan
* Alert operations policy and templates
* Replication-ready toolkit skeleton
