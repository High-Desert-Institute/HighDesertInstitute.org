---
layout: project
title: "Very Small Array"
slug: very-small-array
guilds:
  - astromancers
summary: >-
  A portable, standalone SDR device equipped with a phased antenna array and onboard FPGA,
  designed to visualize radio frequencies in augmented reality and to perform advanced SDR
  and radio astronomy tasks.
---

# Very Small Array

The **Very Small Array (VSA)** is a portable, standalone **software-defined radio (SDR)** device equipped with a **phased antenna array** and an onboard **FPGA**.

Its two primary goals are:

1. **Augmented reality RF visualization** — turning the invisible RF environment into something you can *see* and understand in real time.
2. **Advanced SDR + radio astronomy** — enabling serious measurement, direction-finding, interferometry experiments, and other astronomy-adjacent workflows in a field-deployable form factor.

## Overview

The Very Small Array is a concept for a portable device inspired by large-scale radio arrays (like the Very Large Array), but **miniaturized for field deployment**.

It’s designed to pair with augmented reality hardware (for example, the upcoming Valve *Steam Frame*) so users can “see” the RF environment as an overlay: frequencies, power, directionality, and other derived features translated into **colors, lights, and spatial cues**.

On the research end of the spectrum, the VSA also aims to support heavier “radio astronomy adjacent” workflows, including **high-bandwidth signal processing** and experiments that could contribute to **pulsar timing / triangulation** style approaches.

## Core Features

- **Phased Antenna Array:** A compact, multi-element antenna system intended for directionality, beamforming experiments, and array processing.
- **Onboard FPGA:** Handles high-bandwidth processing for real-time spectrum analysis, correlation/beamforming-style experiments, and other compute-heavy SDR pipelines.
- **AR Integration:** Pairs with AR devices to render radio frequencies as visual elements in the user’s field of view.
- **Practical use cases:** Monitoring NOAA broadcasts, visualizing local signal sources, exploring ground-based GPS references, and experimenting with radio astronomy techniques.

## Relationship to Other Projects

The VSA fits into the High Desert Institute ecosystem as an “instrument” that bridges **community infrastructure** and **science**:

- It complements resilient communications projects like the [Cyberpony Express](/projects/cyberpony-express/) by making RF conditions *legible* to builders and operators.
- It aligns with the [Astromancers’ Guild](/guilds/astromancers/) mission around radio astronomy and related sensing.
- It connects to a broader theme in the org: taking advanced tools (SDR, sensing, visualization, applied inference) and making them accessible + field-ready.

## Next Steps

1. **Prototyping:** Identify the minimal viable hardware stack (antenna elements, FPGA/SoC choice, RF front end, timebase/clocking, power budget).
2. **AR Development:** Define the AR visualization primitives (what variables to render, how to map them to the environment) and plan integration with Steam Frame or similar.
3. **Community Collaboration:** Specify an open-source development approach, recruit contributors, and explore partnerships with SDR + amateur radio + radio astronomy communities.

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
