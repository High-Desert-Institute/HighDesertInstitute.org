---
layout: default
title: Flying Robots
---

## [Lorekeepers' Guild](/guilds/lorekeepers/): [Cyberpony Express](/guilds/lorekeepers/cyberpony-express/) - [Flying Robots](/guilds/lorekeepers/cyberpony-express/flying-robots/)

The "Flying Robots" project brings the automation ethos of *Factorio* to life. In the game, swarms of tiny drones ferry materials and handle jobs across sprawling factories. Our real‑world version uses low‑cost quadcopters, the Cyberpony Express mesh network, and open mapping tools so communities can dispatch small autonomous aircraft to tackle everyday tasks.

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

### Example Roles

- **Scout** – Verify alarms or check a triggered motion sensor.
- **Guardian** – Patrol gardens and chase pests away with lights or sound.
- **Courier** – Deliver small items between nearby outposts.
- **Surveyor** – Capture aerial imagery for mapping or real‑estate photography.

By combining open‑hardware drones with the Cyberpony Express, communities gain a modular automation layer that works off‑grid. Each "flying robot" handles a narrow task it is suited for, while the mesh network and ATAK provide the coordination glue. When a sensor trips, a mission is created, a drone claims it, and the job gets done—no internet backbone required.

---

[← Back to Cyberpony Express](/guilds/lorekeepers/cyberpony-express/)
