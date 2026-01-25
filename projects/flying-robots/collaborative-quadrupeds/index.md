---
layout: project
title: "Collaborative Quadrupeds"
slug: collaborative-quadrupeds
guilds:
  - pathfinders
summary: >-
  Quadruped robots working together using the mesh to solve complex tasks as a team.
---

<img src="/assets/images/quadruped-collaboration.png" class="photo">

# Collaborative Quadrupeds

Quadruped robots can work together using the mesh to solve complex tasks as a team.

**Example tasks:**
- Carrying heavy or bulky loads that a single robot can’t manage
- Traversing rough or uneven terrain by distributing weight
- Performing autonomous search-and-rescue missions during disasters
- Recovery: if one robot gets stuck, its team mates can assist it
- Modular tool use: each robot can carry a different tool to accomplish a shared task, via detachable mounts on top of the body

## Inspiration

- [Open Source Project: SpotMicro - Boston Dynamics Spot inspired robot](https://spotmicroai.readthedocs.io/en/latest/)
    - [GitLab Repository](https://gitlab.com/public-open-source/spotmicroai)
    - [Reinforcement Learning Simulation](https://spotmicroai.readthedocs.io/en/latest/training/)
    - [Original Thingiverse 3D Models](https://www.thingiverse.com/thing:3445283)
    - [Assembly Video](https://www.youtube.com/watch?v=03RR-mz2hwA)
    - Derivative Works:
        - [yamatai319's RS304Spot_QuRo](https://github.com/yamatai319/RS304Spot_QuRo)
        - [michaelkubina's ESP32-based SpotMicroESP32](https://github.com/michaelkubina/SpotMicroESP32)

## CJ's SpoMicro-Pi5 Design

CJ Trowbridge is prototyping a SpotMicro derivative robot using a Raspberry Pi 5 + LLM8850 as the main controller. This robot also has an integrated meshtastic node, allowing it to communicate and collaborate with humans as well as other robots on the mesh network.

[Github Repository](https://github.com/cjtrowbridge/SpotMicro-Pi5/)