---
layout: project
title: "LocalNet"
slug: localnet
guilds:
    - lorekeepers
link: "https://github.com/High-Desert-Institute/LocalNet"
summary: >-
    A resilient off-grid application stack that gives every outpost a local digital hub
    for knowledge, AI, and mesh-integrated services.
---

# LocalNet

**LocalNet** is the resilient, off-grid server stack for the [High Desert Institute](https://highdesertinstitute.org) outposts. It is designed to be a "set-it-and-forget-it" digital hub that empowers regional communities to run their own local tools while integrating seamlessly with the wider mesh network.

As part of the High Desert Institute's mission to *build a foundation for the survival of humanity*, LocalNet provides the critical digital infrastructure required for communities to function independently of the traditional internet grid. It is a primary project of the **Lorekeepers' Guild**.

## Key Features

### The Digital Hearth
LocalNet serves as an application server on the local intranet at each outpost, hosting rich services on low-power hardware (e.g., Raspberry Pi, mini PCs, Steam Machines):
*   **The Library**: Hosting a vast, offline-first repository of survival, technical, and cultural knowledge.
*   **The Librarian**: A local, privacy-focused LLM (Large Language Model) that acts as an intelligent interface to The Library, answering complex questions without internet access.
*   **Pubsub**: A lightweight publish-subscribe messaging system to facilitate communication between local applications and services and maintain updated records and library content.
*   **Kasm Workspaces**: Containerized applications accessible via web browser, providing a variety of tools and environments for users.
*   **Collaboration Tools**: Local instances of GitLab, Nextcloud, and other collaboration platforms to facilitate teamwork and resource sharing within the community.
*   **Knowledge Management Systems**: GitLab/Pages for documentation, wikis, and project management.
*   **Open WebUI**: An open source chat interface for interacting with all the bleeding edge LLMs.
*   **Creative AI**: Local AI-powered tools for image, code, and music generation.
*   **Offline-First Design**: All services are designed to function fully offline, ensuring reliability in remote locations.
*   **Internet-In-A-Box**: Complete local copy of Wikipedia, OpenStreetMaps, and other educational materials.

### Mesh Integration (The Cyberpony Express)
LocalNet integrates directly with **The Cyberpony Express**, HDI's public Meshtastic-based mesh network.
*   Acts as a bridge between the local high-bandwidth intranet and the low-bandwidth, long-range LoRa mesh.
*   Facilitates secure communication between disparate outposts (e.g., High Ground, Mammoth, Slab City).
*   Hosts the **BBS**, allowing for asynchronous messaging, bulletin boards, and lightweight applications over the mesh.
*   Records data from regional sensors for things like weather forecasting, environmental monitoring, and resource management.

This project is hosted in a [submodule](./repository/).

[View Repository README](./repository/README.md)
