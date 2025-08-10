---
layout: default
title: Flying Robots
---

## [Lorekeepers' Guild](/guilds/lorekeepers/): [Cyberpony Express](/guilds/lorekeepers/cyberpony-express/) - [Flying Robots](/guilds/lorekeepers/cyberpony-express/flying-robots/)

The "Flying Robots" project brings the automation ethos of *Factorio* to life. In the game, swarms of tiny drones ferry materials and handle jobs across sprawling factories. Our real‑world version uses low‑cost quadcopters, the Cyberpony Express mesh network, and open mapping tools so communities can dispatch small autonomous aircraft to tackle everyday tasks.

![The Cyberpony Express mesh network enables many robots to work together to accomplish tasks for users](/assets/images/flying-robots-mesh.png)

### Why Now?

To date we have raised more than ten thousand dollars and distributed hundreds of Cyberpony Express nodes across the Sacramento – San Francisco Bay Area. This growing Meshtastic network lets devices talk even when the public internet or cell service is unavailable. With the network in place, inexpensive drones can coordinate just like Factorio's flying robots.

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

#### Carrier (Fixed‑Wing UAV)
Built for long distances where agility is less critical.

**Example tasks:**
- Inter‑community logistics deliveries
- Photographing downed robots or infrastructure
- Surveying large areas for mapping
- Patrolling for predators or pests
- Capturing broad‑area imagery

#### Worker (Quadcopter)
Workers excel at nimble, close‑quarters tasks.

**Example tasks:**
- Moving small objects or supplies
- Wielding lightweight tools for repairs or assembly
- Deploying or recovering relay nodes in tight spots
- Planting seeds or placing sensors with precision
- Retrieving small payloads from Carriers

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

---

[← Back to Cyberpony Express](/guilds/lorekeepers/cyberpony-express/)
