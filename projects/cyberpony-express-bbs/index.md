---
layout: project
title: "Cyberpony Express BBS"
slug: cyberpony-express-bbs
guilds:
    - pathfinders
link: "https://github.com/High-Desert-Institute/cyberpony-express-bbs"
summary: >-
    The bulletin board software that powers Cyberpony Express, providing resilient store-and-forward messaging across the mesh network.
---

# Cyberpony Express BBS

The **Cyberpony Express Bulletin Board Service (BBS)** is the digital-postal backbone of the [Cyberpony Express](https://highdesertinstitute.org/guilds/lorekeepers/cyberpony-express/) project. It is a text-based bulletin board system that operates over the [Meshtastic](https://meshtastic.org) mesh-networking platform, allowing communities to share messages and files when traditional Internet connections are unavailable.

*The Pathfinders' Guild leads this software effort, ensuring the mesh can bridge distant outposts and keep travelers connected even when traditional infrastructure fails.*

## The Role of the BBS

The BBS acts like an automated phone operator that:
*   Provides a menu-driven interface so users can **check messages, view public or private threads, and talk to the librarian chatbot** by sending single-letter commands.
*   **Queues and forwards messages** between distant parts of the mesh, solving the *back-haul problem* and allowing nodes that cannot directly hear each other to exchange data.
*   Serves as the access point for **text-based games (multi-user dungeons)** and a **librarian chatbot** that can answer queries using a local library.
*   Runs on low-power hardware so it continues working in disasters; heavy processing is off-loaded to a Raspberry Pi service host.

## Key Features
*   **Store-and-Forward Messaging**: Uses a "digital postal service" model where messages are encrypted, sealed, and relayed opportunistically.
*   **Backhaul via IPFS and Tor**: Nodes can synchronize data using IPFS and Tor as a fallback when direct LoRa links are unavailable, without exposing public IP addresses.
*   **Decentralized & Resilient**: No central servers; anyone can host a node, and the network runs entirely off-grid.

This project is hosted in a [submodule](./repository/).

[View Repository README](./repository/README.md)
