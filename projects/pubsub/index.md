---
layout: project
title: "PubSub"
slug: pubsub
guilds:
  - lorekeepers
link: "https://github.com/High-Desert-Institute/pubsub"
summary: >
  A C++17 Notcurses reader/publisher for RSS, Atom, JSON, Meshtastic, via http/https/ipfs/ipns/tor/etc with logic bots.
---

# PubSub

**PubSub** is a C++17 application with a high-performance TUI (Text User Interface) that reads and publishes across decentralized protocols. It is designed to be a powerful tool for information management in off-grid and mesh environments.

## Overview

PubSub is built to:
- Read and publish across decentralized protocols.
- Organize subscriptions by type (e.g., `rss/`, `meshtastic/`) and store per-source metadata.
- Cache payloads deterministically.
- Maintain a SQLite database for UI state, latest payload metadata, and parsed posts.
- Provide a logic/view column for Filters, Transformations, and Views.
- Integrate a LAN-local LLM via Ollama and mesh messaging via Meshtastic.

## Interface Philosophy: Speed & Muscle Memory

A central priority of PubSub is to provide a high-speed, high-bandwidth, low-latency interface that rewards mastery. Inspired by the numeric command systems of *Star Trek: Klingon Academy* and the zero-latency navigation of the Sidekick phone, the TUI is designed for rapid execution via muscle memory.

*   **Numeric Chaining:** Every menu item and action is mapped to a static, standardized number. Users can execute complex, deep commands by typing rapid sequences (e.g., `2-1` to open Sub -> Subscriptions, select Refresh All, and close the menu) without waiting for UI animations.
*   **Base Menu Structure:**
    1. Home
    2. Pub (Publish)
    3. Sub (Subscribe)
    4. Tasks
    5. Bots
    6. Library
    0. Settings

This project is hosted in a [submodule](./repository/).

[View Repository README](./repository/README.md)
