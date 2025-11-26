---
layout: project
title: "The Library"
slug: library
guilds:
  - lorekeepers
summary: >-
  A free, open Library-in-a-Box that preserves everything HDI learns about living well off-grid and makes it available to every outpost.
---

<img src="/assets/images/library-rage.gif" alt="Rage against the dying of the light" class="photo">

# The Library

The Library is HDI's promise to publish everything we learn about thriving off-grid—permaculture field notes, schematics, course materials, survival manuals, zines, and oral histories. Each outpost hosts a full copy on low-power hardware, shares it over local Wi-Fi, and syncs updates through the Cyberpony Express mesh. Because it is 100% free and open-source, any community can fork it, add localized knowledge, and send improvements back upstream.

## What lives inside

- **Core curriculum** – gardening, water, energy, shelter, governance, finance, mutual aid.
- **Workshop recordings and slides** – so every cohort can revisit trainings on demand.
- **Community-contributed playbooks** – everything from building cob domes to running cooperatives.
- **Emergency references** – first aid, wildfire response, evacuation checklists, and comms plans.

## Hardware profile

- Raspberry Pi or similar mini PC with SSD/microSD mirror of the Library.
- Local Wi-Fi or ethernet to serve the collection via kiosks, tablets, or laptops.
- Optional Meshtastic bridge for syncing metadata and ferrying small files over the mesh.

## Software stack

- **HDI Librarian** for retrieval-augmented Q&A against the collection.
- **Open-source doc viewers** (Kiwix, Calibre-web, Nextcloud) for browsing and syncing.
- **Git + rsync/IPFS** pipelines for publishing updates back to HQ.

## How to contribute

1. **Document** your experiments, measurements, and lessons learned.
2. **License** them under permissive or Creative Commons terms.
3. **Submit** pull requests (or email archives) so the Lorekeepers can ingest and tag the new material.

## Roadmap

- Finish ingesting all historical HDI build logs and workshop decks.
- Bundle "starter library" images for each outpost, sized for common SD cards.
- Publish a public mirror plus instructions for running your own inside a LAN-only environment.
- Integrate translation workflows so communities can localize and re-share content in their own languages.

---

[← Back to Lorekeepers' Guild](/guilds/lorekeepers)
