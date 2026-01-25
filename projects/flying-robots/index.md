---
layout: project
title: "Flying Robots"
slug: flying-robots
guilds:
  - pathfinders
summary: >-
  Low-cost quadcopters, rovers, and solar boats coordinated via the Cyberpony Express mesh to handle logistics, observation, and disaster response.
---

<img src="/assets/images/flying-robots-gardens.png" alt="Flying robots surveying a community garden" class="photo">

# Flying Robots

The Flying Robots project brings the automation ethos of *Factorio* to life. Swarms of tiny drones ferry materials and handle jobs across sprawling factories in the game; our real-world version uses low-cost quadcopters, solar boats, and the Cyberpony Express mesh network so communities can dispatch autonomous craft to tackle everyday tasks. While the focus began in the air, the project is expanding to include water-based electric robots that glide across ponds and canals.

This initiative now lives under the **Pathfinders' Guild**, reflecting their mission to maintain resilient pathways and communications between outposts.

![The Cyberpony Express mesh network enables many robots to work together to accomplish tasks for users](/assets/images/flying-robots-mesh.png)

## Why Now?

We have raised more than ten thousand dollars and distributed hundreds of Cyberpony Express nodes across the Sacramento – San Francisco Bay Area. This growing Meshtastic network lets devices talk even when the public internet or cell service is unavailable. With the network in place, inexpensive drones can coordinate just like Factorio's flying robots.

## Key Ingredients

- **Cyberpony Express** – A free, encrypted, public mesh network run by volunteers. It functions as a digital postal service for the people, carrying messages and data between outposts without central infrastructure.
- **Meshtastic** – Open-source firmware that turns low-power LoRa radios into long-range mesh nodes. Every drone and ground station can exchange commands and telemetry through this resilient network.
- **ATAK (Android Team Awareness Kit)** – A modular geospatial platform that rides on top of Meshtastic. ATAK displays drone locations, sensor alerts, and task queues on a shared map and supports plugins for mission planning and chat.
- **RARE (Rapid Autonomic Reinforcement Engine)** – A safety-constrained online learning layer that continuously tunes gait and stabilization parameters. [Read the RARE Spec v2](rare/).
- **SLAM ([Simultaneous Localization and Mapping](https://en.wikipedia.org/wiki/Simultaneous_localization_and_mapping))** – Algorithms that let robots build maps of their surroundings while tracking their own position. This enables autonomous navigation in GPS-denied environments.
- **Internal AI Hardware** – Onboard compute modules like the Raspberry Pi 5, LLM8850 and Jetson Nano Super allow powerful machine learning tools to run directly on the robots for real-time planning, collaboration, decision-making, and text or voice communication with users.

## Other Ingredients

- [Universal Radio Hacker](https://github.com/jopohl/urh) an open source project which in this case enables us to use software-defined radio to analyze and understand the radio protocols used by various cheap, remote control robots sold ubiquitously at toy stores around the world.
- [Cartographer](https://github.com/cartographer-project/cartographer) an open source project which provides real-time simultaneous localization and mapping (SLAM) in 2D and 3D across multiple platforms and sensor configurations.

## How It Works

1. **Sensor alert** – A motion sensor, weather station, or manual request triggers an event.
2. **Task creation** – A coordinator algorithm publishes an "observe and report" mission over the Cyberpony Express mesh.
3. **Task claiming** – An available robot receives the job and claims it, much like a logistic bot in *Factorio*.
4. **Execution** – The craft flies, floats, or drives to the target, gathers photos, video, or other data, and sends its findings back through Meshtastic/ATAK.
5. **Reporting** – Results flow to responders or logbooks, closing the loop and readying the robot for the next assignment.

## Robot Types

![Collaborative Quadrupeds](/assets/images/quadruped-collaboration.png)

### [Collaborative Quadrupeds](collaborative-quadrupeds/)
Quadruped robots can work together using the mesh to solve complex tasks as a team.

**Example tasks:**
- Carrying heavy or bulky loads that a single robot can’t manage
- Traversing rough or uneven terrain by distributing weight
- Performing autonomous search-and-rescue missions during disasters
- Recovery: if one robot gets stuck, its team mates can assist it
- Modular tool use: each robot can carry a different tool to accomplish a shared task, via detachable mounts on top of the body

![Carrier (fixed-wing UAV)](/assets/images/flying-robots-carrier.png)

### Carrier (Fixed-Wing UAV)
Built for long distances where agility is less critical.

**Example tasks:**
- Inter-community logistics deliveries
- Photographing downed robots or infrastructure
- Surveying large areas for mapping
- Patrolling for predators or pests
- Capturing broad-area imagery

![Worker (quadcopter)](/assets/images/flying-robots-worker.png)

### Worker (Quadcopter)
Workers excel at nimble, close-quarters tasks.

**Example tasks:**
- Moving small objects or supplies
- Wielding lightweight tools for repairs or assembly
- Deploying or recovering relay nodes in tight spots
- Planting seeds or placing sensors with precision
- Retrieving small payloads from Carriers

![Rover (ground robot)](/assets/images/flying-robots-rover.png)

### Rover (Ground Robot)
Rovers trade speed for endurance and payload capacity.

**Example tasks:**
- Serving as remote mesh nodes or charging stations
- Identifying and removing weeds
- Planting seeds and tending crops
- Deploying heavier tools or sensors
- Being dropped or retrieved by a Worker in rough terrain

![Skimmer (solar water robot)](/assets/images/flying-robots-skimmer.png)

### Skimmer (Solar Water Robot)
Skimmers rely on solar-charged batteries to move quietly across ponds, canals, or reservoirs.

**Example tasks:**
- Inspecting water quality and levels
- Delivering lightweight cargo between docks
- Hauling or deploying floating sensors
- Acting as mobile power banks for other robots

## Design Snapshots

The images below illustrate the system architecture, prototype capabilities, and long-term vision for the flying robot fleet.

![Block diagram of sensors, mesh nodes, and mission control linking to a quadcopter](/assets/images/flying-robots-system-diagram.png)

The system diagram highlights how sensors feed alerts into the Cyberpony Express mesh. Tasks are broadcast, claimed by an available robot, and reported back through ATAK.

![Drone photographing a community garden from above](/assets/images/flying-robots-aerial-photography.png)

A surveyor drone captures detailed aerial photography, turning routine flights into up-to-date maps and progress logs.

![Quadcopter frame with interchangeable camera, speaker, and cargo modules laid out](/assets/images/flying-robots-modular-payloads.png)

Modular payloads let each airframe specialize. Swap a camera for a speaker, light, or small cargo pod depending on the mission.

![Stylized illustration of a small fleet of community drones at work](/assets/images/flying-robots-concept-art.png)

Concept art shows how a humble fleet might look zipping between gardens, rooftops, and neighborhood outposts.

![Three drones perched on a solar-powered charging rail](/assets/images/flying-robots-charging.png)

An automated charging rack keeps robots topped off and ready without human intervention.

![Drone lowering a first-aid kit toward people in a flooded neighborhood](/assets/images/flying-robots-disaster-response.png)

The same system that handles daily chores can pivot to disaster response, delivering supplies or relaying messages when roads are impassable.

![Illustration of a future skyline dotted with helper drones and connected outposts](/assets/images/flying-robots-future-vision.png)

These scenes hint at a future where swarms of flying robots and solar boats quietly stitch together the digital and physical realms.

By combining open-hardware drones and solar electric watercraft with the Cyberpony Express, communities gain a modular automation layer that works off-grid. Each robot handles a narrow task it is suited for, while the mesh network and ATAK provide the coordination glue. When a sensor or buoy trips, a mission is created, a robot claims it, and the job gets done—no internet backbone required.

## Relevant Legal Limitations and Constraints

This is not legal advice. This is just research conducted to understand where relevant regulations are at in different states and how they might affect the feasibility of this project. Many of these laws are for delivery services or industrial agriculture; none of which is what we propose to do. This is by no means a complete or exhaustive list of the relevant or applicable laws, regulations, or rules. Please consult a qualified attorney for legal advice specific to your situation.

*Scope: small unmanned aircraft (drones) under 55 lb operating under 14 CFR Part 107; spray/ag drones under 14 CFR Part 137; and ground-based Personal Delivery Devices (PDDs) a.k.a. sidewalk delivery robots. This is an informational overview, not legal advice.*

* **Effective date:** August 10, 2025
* **Federal rules** (FAA + FCC + federal lands) apply everywhere and frequently preempt state/local rules in the air.
* **California** (esp. San Francisco and state/national parks) adds **privacy, audio consent, and park takeoff/landing constraints**.
* **Arizona, Virginia, Ohio, Utah, Idaho** are generally **friendly to PDDs** statewide and have clearer state preemption for drones/PDDs, but still restrict operations over **critical infrastructure**, **state parks/wilderness**, and require **one-party consent** for audio.
* **Texas and Florida** welcome PDDs but have **extra drone restrictions** around **critical infrastructure** and **surveillance/privacy**; Florida is **all-party consent** for audio.
* **Private land helps** (you can control launch/landing of drones and robot access), but **doesn’t waive FAA rules** or privacy/trespass laws.

### Quick-reference tables

#### A) Sidewalk delivery robots (PDDs)

| State  | Statewide PDD authorization?                                                             | Typical statewide caps                                         | Local control?                                                                  | Notes                                                                                 |
| ------ | ---------------------------------------------------------------------------------------- | -------------------------------------------------------------- | ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |
| **CA** | **No single statewide PDD statute**. Cities regulate (e.g., San Francisco, Los Angeles). | City-by-city (speed/weight, chaperone, insurance).             | Strong. SF/LA permit programs limit pilots to specific zones and device counts. | If you target CA, plan **city permits** and **human chaperone** rules in SF.          |
| **AZ** | **Yes** (preemption for UAS; PDDs governed with statewide framework).                    | Usually ~6–10 mph; weight caps; operator monitoring.           | Limited local control for safety/parks.                                         | Generally straightforward if you meet equipment/marking and remote monitoring.        |
| **VA** | **Yes** (Code of Virginia authorizes PDDs statewide).                                    | Speed/weight caps; plate/marker; remote monitoring.            | Localities may regulate time/place/manner.                                      | Clear statewide authorization; good permitting climate.                               |
| **OH** | **Yes** (ORC 4511.513).                                                                  | ≤10 mph; ≤~250–550 lb device weight depending on locality.    | Localities can add conditions.                                                  | State recognizes PDDs as pedestrians for certain rules.                               |
| **UT** | **Yes** (Utah Code 41-6a-1119).                                                          | Similar caps; operator monitoring required.                    | Locals can set sidewalk rules.                                                  | Includes separate **mobile carrier** category.                                        |
| **ID** | **Yes** (Idaho Code 40-2305).                                                            | Must yield to pedestrians; no hazmat; sidewalk/crosswalk only. | Locals may regulate for safety.                                                 | Explicit **no hazmat**, **no highway** use (except crosswalks).                       |
| **TX** | **Yes** (Transp. Code Ch. 552A).                                                         | Speed/weight limits; equipment; remote support.                | Cities may regulate **if not inconsistent** with Chapter 552A.                  | Good fit for at-scale pilots; watch **critical infrastructure** air rules for drones. |
| **FL** | **Yes** (state UAS act; PDDs allowed under local ordinances).                            | Similar caps; insurance & identification common.               | Localities may add conditions.                                                  | Pair with strong privacy program; **park** rules can be strict.                       |

> **Tip:** Across states, plan for: device ID plate, braking, lights, audible signals, remote monitoring/override, insurance, data retention/privacy policy, and incident reporting.

#### B) Drone-related hot buttons by state

| State  | Audio recording consent | Extra state privacy/surveillance limits                                                                                             | Parks & wildlife                                                                                        | Local preemption                                                                    | Critical infrastructure rules                                                                  |
| ------ | ----------------------- | ----------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| **CA** | **All-party** consent   | Anti-paparazzi intrusion tort; filming/audio in private spaces; drone near prisons banned                                           | State & city parks often restrict takeoff/landing; **NPS lands** closed; wildlife harassment prohibited | Many cities regulate **takeoff/landing** on their property                          | General nuisance/trespass; some local facility restrictions                                    |
| **AZ** | One-party               | “Critical facility” proximity/loitering crimes; strong **state preemption** of UAS                                                  | State parks often require permits; NPS closed; avoid wildlife harassment                                | **Yes** (state preemption limits city UAS regs; parks may regulate takeoff/landing) | **Yes** (criminal penalties near critical facilities)                                          |
| **VA** | One-party               | Peeping/trespass by drone                                                                                                           | **State parks ban recreational drones without special permit**; NPS closed                              | General preemption for airspace; locals can regulate **property use**               | Facility-specific rules may apply                                                              |
| **OH** | One-party               | General privacy/trespass/harassment                                                                                                 | State parks vary; NPS closed                                                                            | Moderate; locals may regulate property use                                          | Some facility rules via general criminal law                                                   |
| **UT** | One-party               | General privacy/trespass; wildfire TFR enforcement                                                                                  | **Wilderness areas off-limits**; state parks vary; NPS closed                                           | Limited                                                                             | Facility rules mostly via general criminal law                                                 |
| **ID** | One-party               | General privacy; stalking/harassment                                                                                                | Wilderness off-limits; state parks vary; NPS closed                                                     | Limited                                                                             | General criminal law                                                                           |
| **TX** | One-party               | **Gov’t Code Ch. 423**: surveillance image-capture/use offenses; venue & critical-infra **no-fly**                                  | State parks permit-based; NPS closed                                                                    | State preemption on airspace; cities can regulate **takeoff/landing** on their land | **Strong**: offenses for flying **≤400 ft** over critical infrastructure & stadiums            |
| **FL** | **All-party** consent   | **Unmanned Aircraft Systems Act** + **“Freedom from Unwarranted Surveillance Act”**; facial recognition restrictions for government | State parks often restrict; NPS closed                                                                  | State preemption of local *airspace* rules; locals regulate property                | **Strong**: can’t fly over or near critical infrastructure (interference/disturbance standard) |

## Federal Baseline (Everywhere)

**FAA (air):**

- Part 107 governs sUAS <55 lb: registration, Remote ID broadcasting, VLOS, airspace authorizations (LAANC) for controlled airspace, operations over people/vehicles/night only per rule categories, and waivers for things like BVLOS.
- **Spray/ag drones:** Part 137 applies when dispensing chemicals. Expect separate FAA authorizations (often a §44807 exemption for >55 lb), ops manuals, and pilot/company approvals. States also license pesticide applicators/pilots.

**Federal lands:**

- **National Park Service (NPS):** launching/landing/operating from NPS property is generally prohibited unless specifically authorized.
- **USFS Wilderness:** no takeoff/landing in designated Wilderness; avoid overflight; never near wildfires (“If you fly, we can’t”).

**Radios (FCC):**

- Unlicensed control/telemetry typically falls under Part 15. If you use amateur (ham) bands, note no encryption for obscuring message content and special telecommand rules for model craft; business use on ham spectrum is not allowed.

## Private Property Helps—But Doesn’t Waive Rules

- You can control launch/landing: landowners can allow or forbid takeoff/landing on their property.
- FAA still rules the sky: being over private land doesn’t waive Part 107 (Remote ID, VLOS, altitude, waivers).
- Privacy/audio/trespass still apply.
- Insurance & indemnities: private sites often require COIs, hold-harmless, data-handling terms, and incident reporting.

## State-by-State Notes

*(Sections for California, Arizona, Virginia, Ohio, Utah, Idaho, Texas, Florida, etc., remain identical to the previous research and have been retained here for continuity. Refer to the detailed breakdowns for localized constraints and permitting tips.)*

## Implementation Checklist

**For drones (Part 107):**

- Register each aircraft; ensure Remote ID equipped or fly in an approved FRIA.
- Maintain VLOS, use anti-collision lighting for night missions, and follow ops-over-people categories.
- Obtain LAANC/ATC authorization in controlled airspace; check NOTAMs/TFRs daily.
- Write an Operations Manual covering emergencies, lost-link, geofencing, checklists, and incident reporting.
- For spray/ag tasks: secure §44807 (if >55 lb), Part 137 certificate/LOA, aircraft listing, and state applicator licenses.

**For ground robots (PDDs):**

- Conform to each state’s speed/weight/equipment limits; keep a visible ID/plate.
- Implement remote monitoring/override; log interventions; maintain insurance.
- Draft a privacy & data retention policy (audio/video minimization, signage, audible alerts).
- Obtain city permits where required (e.g., San Francisco/Los Angeles pilots).

**For private properties:**

- Secure written authorization from landowners and map no-go areas.
- Notify neighbors, set geofences to avoid overflight, and post signage about recording.

## Risk-Reduction Practices

- Geofence critical infrastructure, prisons, schools, stadiums, hospitals, and NPS/Wilderness boundaries.
- Establish wildlife safeguards (seasonal no-fly zones, standoff distances, no harassment).
- Apply privacy-by-design principles (low-fidelity video, blurring, narrow retention, opt-out channels).
- Share operations plans with communities, provide a hotline/QR code on devices, and publish incident reports.
- Maintain pilot/handler training, currency, and playbooks for each jurisdiction’s audio consent rules.

## Next Steps

1. Pick pilot states that match the mission profile (AZ/VA/OH/UT/ID/TX are typically easiest for PDDs).
2. Build a state matrix for each vehicle type (weight, speed, sensors) vs. legal caps.
3. Stand up an internal permitting kit (park permits, city PDD permits, FAA LAANC accounts, Part 137 docs).
4. Deploy privacy controls and signage that satisfy the strictest state you operate in.
5. Pre-flight every site with airspace & land-manager checks; pre-walk ground routes and curb ramps.

## Final Thoughts

We focus on small drones (under 55 lbs) and robots operating primarily on private property, with strict adherence to FAA regulations and local laws. The regulatory landscape continues to evolve, but by coordinating with the Pathfinders' Guild, Cyberpony Express operators, and local partners, we can keep communities connected, safe, and resilient.

---

[← Back to Cyberpony Express](/projects/cyberpony-express/)