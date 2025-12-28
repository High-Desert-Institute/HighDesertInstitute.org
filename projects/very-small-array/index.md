---
layout: project
title: "Very Small Array"
slug: very-small-array
guilds:
  - astromancers
summary: >-
  A distributed software project for microcontrollers and single board computers using affordable software defined radio (SDR) hardware to collaborate on Very Long Baseline Interferometry (VLBI).
---

# Very Small Array

The **Very Small Array (VSA)** is a distributed software project designed to run on hardware ranging from small microcontrollers with simple radios to more powerful single board computers with advanced software defiend radios.

This project focuses on using a **Very Long Baseline Interferometry (VLBI)** approach to allow each device to independently determine its location and the precise time before capturing radio measurements. These nodes then report their results back separately to a coordinating node for later correlation and analysis.

The intent is that many cheap nodes can be deployed to work together and accomplish various tasks, creating a powerful distributed array from accessible hardware.

## Overview

The Very Small Array takes the concepts of large-scale radio astronomy arrays and applies them to a distributed network of low-cost devices. Instead of a single massive installation, the VSA relies on software coordination across many small, inexpensive nodes.

By leveraging VLBI techniques, the system allows for precise localization and timing without relying on centralized infrastructure like GPS for the initial measurements. Each node acts as an independent observer, collecting data that becomes valuable when correlated with the rest of the network.

## Core Features

- **Distributed VLBI:** Implements Very Long Baseline Interferometry algorithms suitable for low-power, distributed hardware.
- **Hardware Agnostic:** Designed to run on a spectrum of devices, from microcontrollers (like ESP32, nRF52) to Single Board Computers (Raspberry Pi, etc.).
- **Self-Localization:** Enables nodes to determine their own location and time through radio observation.
- **Centralized Correlation:** Data is reported back to a coordinating node where the heavy lifting of correlation and analysis takes place.
- **Scalable Deployment:** Intended for deployment of many cheap nodes to form a large synthetic aperture or sensor network.

## Relationship to Other Projects

The VSA fits into the High Desert Institute ecosystem as a distributed instrument that bridges **community infrastructure** and **science**:

- It complements resilient communications projects like the [Cyberpony Express](/projects/cyberpony-express/) by providing alternative methods for localization and timing.
- It aligns with the [Astromancers’ Guild](/guilds/astromancers/) mission around radio astronomy and related sensing.
- It connects to a broader theme in the org: taking advanced tools (VLBI, distributed sensing) and making them accessible using commodity hardware.

## Next Steps

1. **Algorithm Development:** Implement core VLBI algorithms for time and location determination on constrained hardware.
2. **Hardware Selection:** Identify suitable low-cost microcontrollers and radio modules for the initial node prototypes.
3. **Coordinator Software:** Develop the central software required to ingest, correlate, and analyze data from multiple nodes.
4. **Field Testing:** Deploy a small network of nodes to validate the localization and timing accuracy in real-world conditions.

## Why this matters

Radio is infrastructure. It’s also a scientific instrument.

A rugged, low-power, self-contained SDR array unlocks:

- Field diagnostics of interference, jamming, and spectrum occupancy
- Direction-finding and localization experiments
- Time-synchronized array measurements (beamforming / null steering)
- Portable “radio telescope” prototyping and education

## Status

This is an Astromancers’ Guild project page. If/when there’s a separate code repository, it should be added as a submodule here:

- `projects/very-small-array/repository/`

(That way anyone can clone this whole org recursively and get complete agent + contributor context.)
