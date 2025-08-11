---
layout: default
title: Flying Robots
---

## [Lorekeepers' Guild](/guilds/lorekeepers/): [Cyberpony Express](/guilds/lorekeepers/cyberpony-express/) - [Flying Robots](/guilds/lorekeepers/cyberpony-express/flying-robots/)

The "Flying Robots" project brings the automation ethos of *Factorio* to life. In the game, swarms of tiny drones ferry materials and handle jobs across sprawling factories. Our real‑world version uses low‑cost quadcopters, the Cyberpony Express mesh network, and open mapping tools so communities can dispatch small autonomous aircraft to tackle everyday tasks.


![A quadcopter drone flying over a community garden](/assets/images/flying-robots-gardens.png)

### Why Now?

To date we have raised more than ten thousand dollars and distributed hundreds of Cyberpony Express nodes across the Sacramento – San Francisco Bay Area. This growing Meshtastic network lets devices talk even when the public internet or cell service is unavailable. With the network in place, inexpensive drones can coordinate just like Factorio's flying robots.

![The Cyberpony Express mesh network enables many robots to work together to accomplish tasks for users](/assets/images/flying-robots-mesh.png)

### Key Ingredients

- **Cyberpony Express** – A free, encrypted, public mesh network run by volunteers. It functions as a digital postal service for the people, carrying messages and data between outposts without central infrastructure.
- **Meshtastic** – Open‑source firmware that turns low‑power LoRa radios into long‑range mesh nodes. Every drone and ground station can exchange commands and telemetry through this resilient network.
- **ATAK (Android Team Awareness Kit)** – A modular geospatial platform that rides on top of Meshtastic. ATAK displays drone locations, sensor alerts, and task queues on a shared map and supports plugins for mission planning and chat.

### How It Works

1. **Sensor alert** – A motion sensor, weather station, or manual request triggers an event.
2. **Task creation** – A coordinator algorithm publishes an "observe and report" mission over the Cyberpony Express mesh.
3. **Task claiming** – An available drone receives the job and claims it, much like a logistic bot in *Factorio*.
4. **Execution** – The drone flies to the target, gathers photos, video, or other data, and sends its findings back through Meshtastic/ATAK.
5. **Reporting** – Results flow to responders or logbooks, closing the loop and readying the drone for the next assignment.

### Robot Types

![Carrier (fixed-wing UAV)](/assets/images/flying-robots-carrier.png)

#### Carrier (Fixed‑Wing UAV)
Built for long distances where agility is less critical.

**Example tasks:**
- Inter‑community logistics deliveries
- Photographing downed robots or infrastructure
- Surveying large areas for mapping
- Patrolling for predators or pests
- Capturing broad‑area imagery

![Worker (quadcopter)](/assets/images/flying-robots-worker.png)

#### Worker (Quadcopter)
Workers excel at nimble, close‑quarters tasks.

**Example tasks:**
- Moving small objects or supplies
- Wielding lightweight tools for repairs or assembly
- Deploying or recovering relay nodes in tight spots
- Planting seeds or placing sensors with precision
- Retrieving small payloads from Carriers

![Rover (ground robot)](/assets/images/flying-robots-rover.png)

#### Rover (Ground Robot)
Rovers trade speed for endurance and payload capacity.

**Example tasks:**
- Serving as remote mesh nodes or charging stations
- Identifying and removing weeds
- Planting seeds and tending crops
- Deploying heavier tools or sensors
- Being dropped or retrieved by a Worker in rough terrain

### Design Snapshots

The images below illustrate the system architecture, prototype capabilities, and long‑term vision for the flying robot fleet.
  
![Block diagram of sensors, mesh nodes, and mission control linking to a quadcopter](/assets/images/flying-robots-system-diagram.png)

The system diagram highlights how sensors feed alerts into the Cyberpony Express mesh. Tasks are broadcast, claimed by an available drone, and reported back through ATAK.
  
![Drone photographing a community garden from above](/assets/images/flying-robots-aerial-photography.png)

A surveyor drone captures detailed aerial photography, turning routine flights into up‑to‑date maps and progress logs.
  
![Quadcopter frame with interchangeable camera, speaker, and cargo modules laid out](/assets/images/flying-robots-modular-payloads.png)

Modular payloads let each airframe specialize. Swap a camera for a speaker, light, or small cargo pod depending on the mission.
  
![Stylized illustration of a small fleet of community drones at work](/assets/images/flying-robots-concept-art.png)

Concept art shows how a humble fleet might look zipping between gardens, rooftops, and neighborhood outposts.
  
![Three drones perched on a solar-powered charging rail](/assets/images/flying-robots-charging.png)

An automated charging rack keeps robots topped off and ready without human intervention.
  
![Drone lowering a first-aid kit toward people in a flooded neighborhood](/assets/images/flying-robots-disaster-response.png)

The same system that handles daily chores can pivot to disaster response, delivering supplies or relaying messages when roads are impassable.
  
![Illustration of a future skyline dotted with helper drones and connected outposts](/assets/images/flying-robots-future-vision.png)

These scenes hint at a future where swarms of flying robots quietly stitch together the digital and physical realms.

By combining open‑hardware drones with the Cyberpony Express, communities gain a modular automation layer that works off‑grid. Each "flying robot" handles a narrow task it is suited for, while the mesh network and ATAK provide the coordination glue. When a sensor trips, a mission is created, a drone claims it, and the job gets done—no internet backbone required.

## Relevant Legal Limitations and Constraints for Flying and Ground Robots

This is not legal advice. This is just research I conducted to try to understand where regulations are at in different states and how they might affect the feasability of this project. This is by no means a complete or exhaustive list of the relevant or applicable laws, regulations, or rules. Please consult a qualified attorney for legal advice specific to your situation.  

*Scope: small unmanned aircraft (drones) under 55 lb operating under 14 CFR Part 107; spray/ag drones under 14 CFR Part 137; and ground-based Personal Delivery Devices (PDDs) a.k.a. sidewalk delivery robots. This is an informational overview, not legal advice.*

* **Effective date:** August 10, 2025
* **Federal rules** (FAA + FCC + federal lands) apply everywhere and frequently preempt state/local rules in the air.
* **California** (esp. San Francisco and state/national parks) adds **privacy, audio consent, and park takeoff/landing constraints**.
* **Arizona, Virginia, Ohio, Utah, Idaho** are generally **friendly to PDDs** statewide and have clearer state preemption for drones/PDDs, but still restrict operations over **critical infrastructure**, **state parks/wilderness**, and require **one‑party consent** for audio.
* **Texas and Florida** welcome PDDs but have **extra drone restrictions** around **critical infrastructure** and **surveillance/privacy**; Florida is **all‑party consent** for audio.
* **Private land helps** (you can control launch/landing of drones and robot access), but **doesn’t waive FAA rules** or privacy/trespass laws.

---

## Quick-reference tables

### A) Sidewalk delivery robots (PDDs)

| State  | Statewide PDD authorization?                                                             | Typical statewide caps                                         | Local control?                                                                  | Notes                                                                                 |
| ------ | ---------------------------------------------------------------------------------------- | -------------------------------------------------------------- | ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |
| **CA** | **No single statewide PDD statute**. Cities regulate (e.g., San Francisco, Los Angeles). | City-by-city (speed/weight, chaperone, insurance).             | Strong. SF/LA permit programs limit pilots to specific zones and device counts. | If you target CA, plan **city permits** and **human chaperone** rules in SF.          |
| **AZ** | **Yes** (preemption for UAS; PDDs governed with statewide framework).                    | Usually \~6–10 mph; weight caps; operator monitoring.          | Limited local control for safety/parks.                                         | Generally straightforward if you meet equipment/marking and remote monitoring.        |
| **VA** | **Yes** (Code of Virginia authorizes PDDs statewide).                                    | Speed/weight caps; plate/marker; remote monitoring.            | Localities may regulate time/place/manner.                                      | Clear statewide authorization; good permitting climate.                               |
| **OH** | **Yes** (ORC 4511.513).                                                                  | ≤10 mph; ≤\~250–550 lb device weight depending on locality.    | Localities can add conditions.                                                  | State recognizes PDDs as pedestrians for certain rules.                               |
| **UT** | **Yes** (Utah Code 41‑6a‑1119).                                                          | Similar caps; operator monitoring required.                    | Locals can set sidewalk rules.                                                  | Includes separate **mobile carrier** category.                                        |
| **ID** | **Yes** (Idaho Code 40‑2305).                                                            | Must yield to pedestrians; no hazmat; sidewalk/crosswalk only. | Locals may regulate for safety.                                                 | Explicit **no hazmat**, **no highway** use (except crosswalks).                       |
| **TX** | **Yes** (Transp. Code Ch. 552A).                                                         | Speed/weight limits; equipment; remote support.                | Cities may regulate **if not inconsistent** with Chapter 552A.                  | Good fit for at‑scale pilots; watch **critical infrastructure** air rules for drones. |
| **FL** | **Yes** (state UAS act; PDDs allowed under local ordinances).                            | Similar caps; insurance & identification common.               | Localities may add conditions.                                                  | Pair with strong privacy program; **park** rules can be strict.                       |

> **Tip:** Across states, plan for: device ID plate, braking, lights, audible signals, remote monitoring/override, insurance, data retention/privacy policy, and incident reporting.

### B) Drone‑related hot buttons by state

| State  | Audio recording consent | Extra state privacy/surveillance limits                                                                                             | Parks & wildlife                                                                                        | Local preemption                                                                    | Critical infrastructure rules                                                                  |
| ------ | ----------------------- | ----------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| **CA** | **All‑party** consent   | Anti‑paparazzi intrusion tort; filming/audio in private spaces; drone near prisons banned                                           | State & city parks often restrict takeoff/landing; **NPS lands** closed; wildlife harassment prohibited | Many cities regulate **takeoff/landing** on their property                          | General nuisance/trespass; some local facility restrictions                                    |
| **AZ** | One‑party               | “Critical facility” proximity/loitering crimes; strong **state preemption** of UAS                                                  | State parks often require permits; NPS closed; avoid wildlife harassment                                | **Yes** (state preemption limits city UAS regs; parks may regulate takeoff/landing) | **Yes** (criminal penalties near critical facilities)                                          |
| **VA** | One‑party               | Peeping/trespass by drone                                                                                                           | **State parks ban recreational drones without special permit**; NPS closed                              | General preemption for airspace; locals can regulate **property use**               | Facility‑specific rules may apply                                                              |
| **OH** | One‑party               | General privacy/trespass/harassment                                                                                                 | State parks vary; NPS closed                                                                            | Moderate; locals may regulate property use                                          | Some facility rules via general criminal law                                                   |
| **UT** | One‑party               | General privacy/trespass; wildfire TFR enforcement                                                                                  | **Wilderness areas off‑limits**; state parks vary; NPS closed                                           | Limited                                                                             | Facility rules mostly via general criminal law                                                 |
| **ID** | One‑party               | General privacy; stalking/harassment                                                                                                | Wilderness off‑limits; state parks vary; NPS closed                                                     | Limited                                                                             | General criminal law                                                                           |
| **TX** | One‑party               | **Gov’t Code Ch. 423**: surveillance image‑capture/use offenses; venue & critical‑infra **no‑fly**                                  | State parks permit‑based; NPS closed                                                                    | State preemption on airspace; cities can regulate **takeoff/landing** on their land | **Strong**: offenses for flying **≤400 ft** over critical infrastructure & stadiums            |
| **FL** | **All‑party** consent   | **Unmanned Aircraft Systems Act** + **“Freedom from Unwarranted Surveillance Act”**; facial recognition restrictions for government | State parks often restrict; NPS closed                                                                  | State preemption of local *airspace* rules; locals regulate property                | **Strong**: can’t fly over or near critical infrastructure (interference/disturbance standard) |

---

## What stays the same in every state (federal baseline)

**FAA (air):**

* Part 107 governs sUAS <55 lb: registration, Remote ID broadcasting, VLOS, airspace authorizations (LAANC) for controlled airspace, operations over people/vehicles/night only per rule categories, and waivers for things like BVLOS.
*

**Spray/ag drones:**

* Part 137 applies when **dispensing** chemicals (fertilizer, pesticides, disinfectants). Expect separate FAA authorizations (often a §44807 exemption for >55 lb), ops manuals, and pilot/company approvals. States also license pesticide applicators/pilots.

**Federal lands:**

* **National Park Service (NPS):** launching/landing/operating from NPS property is generally **prohibited** unless specifically authorized.
* **USFS Wilderness:** no takeoff/landing **in** designated Wilderness; avoid overflight; never near wildfires (“If you fly, we can’t”).

**Radios (FCC):**

* Unlicensed control/telemetry typically falls under **Part 15** (device certification, power/out‑of‑band limits). If you use **amateur (ham) bands**, note **no encryption for obscuring message content** and special telecommand rules for model craft; business use on ham spectrum is not allowed.

---

## Where private property helps—and where it doesn’t

* **You can control launch/landing**: landowners (including farms and gardens) can allow or forbid **takeoff/landing** on their property for both drones and ground robots.
* **FAA still rules the sky**: being over private land doesn’t waive **Part 107** (Remote ID, VLOS, altitude, waivers).
* **Privacy/audio/trespass still apply**: recording rules, intrusion/trespass, nuisance, and wildlife protections apply on private property.
* **Insurance & indemnities**: private sites often require COIs, hold‑harmless, data‑handling terms, and incident reporting.

---

## State-by-state notes

### California (incl. San Francisco & Joshua Tree area)

* **Drones:**

  * Expect **city park** bans on launching/landing (e.g., San Francisco Park Code), **NPS** closures (Joshua Tree National Park), and **Presidio/GGNRA** no‑drone policies.
  * **Privacy:** California’s intrusion/anti‑paparazzi statute and **all‑party** audio consent (Penal Code) create extra risk for recording/streaming.
  * **Facilities & wildlife:** No drones near prisons; no harassment of wildlife; observe local TFRs and critical‑infrastructure advisories.
* **PDDs:** No single statewide PDD law; **city permits** govern (SF pilot zones with human chaperone; LA permit program).
* **Spray/ag:** FAA **Part 137** + California **DPR** pilot licensing (Unmanned Pest Control Aircraft Pilot) and, where applicable, **QAC/QAL** credentials.

**Bottom line:** Plan for permits on public land, strict privacy practices, and city‑specific PDD rules; for farms, combine Part 107/137 compliance with DPR licensing and private‑property permissions.

---

### Arizona (incl. Williams area)

* **Preemption:** Strong state preemption of local UAS rules (cities generally can’t regulate flight), but they may regulate **park takeoff/landing**.
* **Critical facilities:** Criminal offenses for loitering/recording near critical facilities without permission; distance/altitude constraints may apply.
* **Parks & NPS:** Arizona State Parks commonly require permits or prohibit recreational UAS; NPS lands are closed.
* **Audio:** One‑party consent.
* **PDDs:** State framework with remote monitoring, equipment, and pedestrian‑right‑of‑way rules.

**Bottom line:** Good operating environment for both drones and PDDs when you respect critical‑facility buffers and park rules.

---

### Virginia

* **PDDs:** Fully authorized statewide with device ID/marker and remote monitoring; treated like pedestrians on sidewalks/crosswalks.
* **State parks:** Recreational drones generally **prohibited** on DCR lands without special‑use (commercial/research) permits; NPS closed.
* **Audio:** One‑party consent.

**Bottom line:** Friendly to PDD pilots; drone ops good off state park property or with permits.

---

### Ohio

* **PDDs:** Statewide authorization (ORC 4511.513) with speed/weight caps; locals can add conditions.
* **Audio:** One‑party consent.
* **Parks:** State parks vary by site; NPS closed.

**Bottom line:** Straightforward for PDDs; standard drone constraints.

---

### Utah

* **PDDs:** Statewide authorization (41‑6a‑1119); separate **mobile carrier** device category (operator stays within \~25 ft).
* **Wilderness & wildfires:** No UAS in Wilderness; expect strict wildfire TFR enforcement.
* **Audio:** One‑party consent.

**Bottom line:** Favorable for sidewalk robots and typical Part 107 operations away from Wilderness and fires.

---

### Idaho

* **PDDs:** Authorized statewide (40‑2305) with **no hazmat**, sidewalk/crosswalk only, yield to pedestrians, no highway travel (except crosswalks).
* **Wilderness:** No takeoff/landing in designated areas; NPS closed.
* **Audio:** One‑party consent.

**Bottom line:** Good fit for PDD pilots; standard federal constraints for drones.

---

### Texas

* **PDDs:** Statewide framework (Transp. Code Ch. 552A) with equipment, speed/weight, and remote support; cities can regulate if **not inconsistent** with state law.
* **Drones:** Strong **critical infrastructure** and **sports venue** restrictions; separate offenses for capturing/using images for “surveillance” without consent; one‑party audio.

**Bottom line:** Great for PDDs; drones must steer clear of critical infrastructure, stadiums, and surveillance‑type imaging without clear authority.

---

### Florida

* **PDDs:** Allowed with local conditions; plan for insurance/ID and local permitting.
* **Drones:** **All‑party audio** consent; strong **critical infrastructure** protections and limits on government use; surveillance/privacy rules are strict.

**Bottom line:** Works well with careful privacy posture and critical‑infra avoidance; obtain state park permits where needed.

---

## Implementation checklist (flying + ground)

**For drones (Part 107):**

* Register each aircraft; ensure **Remote ID** equipped or fly in an approved **FRIA**.
* VLOS, anti‑collision lighting for night; Ops‑over‑people only with eligible categories.
* Get LAANC/ATC authorization in controlled airspace; check NOTAMs/TFRs daily.
* Write an **Operations Manual** (emergencies, lost‑link, geofencing, checklists, incident reporting).
* For **spray/ag**: secure §44807 (if >55 lb), **Part 137** certificate/LOA, aircraft listing, and state **applicator/pilot** licenses.

**For ground robots (PDDs):**

* Conform to each state’s **speed/weight/equipment** limits; keep a **visible ID/plate**.
* Implement **remote monitoring/override**; log interventions; maintain **insurance**.
* Draft a **privacy & data retention** policy (audio/video minimization, signage, beep/voice alerts).
* Obtain **city permits** where required (e.g., San Francisco/Los Angeles pilots).

**For private properties (farms, gardens, campuses):**

* Written authorization from the landowner; map **no‑go** areas (homes, livestock habitat, sensitive crops).
* Neighbor relations: notify adjacent owners; set **geofences** to avoid overflight past boundaries.
* Signage indicating **robot/drone operations** and **recording**; follow local **audio consent** rules.

---

## Risk‑reduction practices to adopt everywhere

* **Geofence** critical infrastructure, prisons, schools, stadiums, hospitals, and NPS/Wilderness boundaries.
* **Wildlife safeguards**: seasonal no‑fly zones during nesting/calving; minimum standoff distances; no chasing/harassment.
* **Privacy by design**: low‑fidelity video unless needed, face/license‑plate blurring, short retention, opt‑out channels.
* **Community ops**: post hours/routes, provide a hotline/QR code on devices, and publish transparency reports for incidents.
* **Training**: Part 107 currency, recurrent training; sidewalk robot handler SOPs; audio consent playbook by state.

---

## What to do next (practical steps)

1. **Pick pilot states** that match your risk tolerance (AZ/VA/OH/UT/ID/TX are typically easiest for PDDs).
2. Build a **state matrix** for your SKUs (weight, speed, sensing stack) vs. legal caps.
3. Stand up an **internal permitting kit** (park permits, city PDD permits, FAA LAANC accounts, Part 137 docs).
4. Deploy **privacy controls** + signage that satisfy the strictest state you operate in (covers FL/CA).
5. Pre‑flight every site with **airspace & land‑manager checks**; pre‑walk PDD routes and curb ramps.

---

*Questions welcome—happy to tailor this to your exact routes, payloads, and sensors.*


---

[← Back to Cyberpony Express](/guilds/lorekeepers/cyberpony-express/)
