---
layout: default
title: "Fox Hunting Tools & Hardware"
---

# Fox Hunting Tools & Hardware

**Parent Project:** [Fox Hunting: Community Policing](../)

## Initial hardware proposal: 4-element array

### Elements

#### 1) Coordinator / wideband sensor

* **Raspberry Pi + RTL-SDR + Meshtastic Node + GPS**
* Purpose:
  * Provide **high-bandwidth spectrum visibility** (waterfall / channel occupancy)
  * Run the “coordination brain” (tasking + logging + map)

#### 2) At least two distributed “spotter” nodes

* **ESP32 + CC1101 + Meshtastic Node + GPS** (x3)
* Purpose:
  * Act as **mobile RSSI/SNR spotters** that can be placed at different positions (or carried by 3 participants)
  * Feed signal strength observations back to the Pi (via mesh, Wi‑Fi, or serial—whatever’s simplest in the field)

### Why this split works

* The **Pi/RTL‑SDR** sees *everything* happening in-band (and adjacent-band weirdness), quickly.
* The **CC1101 spotters** give you **spatial sampling** (multiple points) so you can triangulate faster than “one person walking around squinting at bars.”

---

## Practical build notes

* The Pi should be the “truth recorder”: one canonical log, one canonical map.
* The spotters should be dead simple in the field: one button to “take reading,” one screen to confirm it recorded.
* The fastest early win is not perfect DF math—it’s **good data hygiene** + **repeatable search choreography**.

## Deliverables

* Real time map view (even a simple one)
* Standardized hardware build instructions
* Standardized software setup instructions
* Field procedure / choreography guide
* Simple but powerful tools for real time analysis and data logging

## Connection to the Astromancers' Very Small Array

This project shares significant DNA with the [Very Small Array (VSA)](/projects/very-small-array/) project managed by the Astromancers' Guild. While the goals differ—Fox Hunting focuses on **localizing interference** via signal strength (RSSI), while the VSA focuses on **astronomy and interferometry** via phase and timing—the underlying architecture is remarkably similar.

### Shared Hardware Stack
Both projects rely on a distributed network of low-cost sensors:
* **Compute:** Raspberry Pi (Coordinator) and ESP32 (Nodes).
* **Radio:** RTL-SDR for wideband analysis and CC1101/LoRa modules for telemetry.
* **Coordination:** A central "brain" that ingests data from multiple spatially separated observers to form a coherent picture of the RF environment.

### Evolutionary Pathway
The Fox Hunting kit serves as an excellent **technological stepping stone** toward the VSA.
1.  **Level 1 (Fox Hunting):** We master the logistics of deploying distributed nodes, time-stamping data, and performing basic triangulation based on signal amplitude (RSSI).
2.  **Level 2 (Very Small Array):** We upgrade the software to handle precise time synchronization and phase-coherent sampling, allowing the same (or similar) hardware to perform beamforming and interferometry.

By building this kit, you are effectively building the "MVP" hardware for a distributed radio telescope.