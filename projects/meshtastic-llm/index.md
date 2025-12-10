---
layout: project
title: "Meshtastic-LLM"
slug: meshtastic-llm
guilds:
    - pathfinders
link: "https://github.com/High-Desert-Institute/Meshtastic-LLM"
summary: >-
    A tool for connecting local LLMs to the Meshtastic network.
---

# Meshtastic-LLM

*This Pathfinders' Guild project keeps long-range navigation data available even when the wider internet is down.*

**Meshtastic-LLM** is a tool for connecting local LLMs (Large Language Models) to the Meshtastic network. It allows for intelligent, automated responses and interactions over the mesh, enabling advanced functionality even in off-grid scenarios.

## Project Overview
Meshtastic-LLM is a two-process stack that keeps a Meshtastic node synchronized with a local Ollama model. The Meshtastic bridge ingests telemetry and messages, persists everything to CSV, and delivers queued replies. The AI agent watches the same thread CSVs, applies persona triggers, calls Ollama through a single worker thread, and appends chunked replies ready for mesh delivery. Everything is file-based so the system stays resilient on low-resource, offline-first hardware.

## Components
- **Meshtastic bridge (`meshtastic-bridge.py`)** – Connects to the radio, records nodes/sightings/threads, and flushes queued outbound messages with retry/backoff logic.
- **AI agent (`ai-agent.py`)** – Loads persona TOML files, handles control commands immediately, queues LLM tasks, and writes newline-safe outbound chunks back to the thread CSVs.
- **Local LLM (Ollama)** – Serves persona-selected models; the agent validates connectivity and pulls models on demand.
- **Prompts archive** – Reserved for per-call CSV + Markdown audit logs.

This project is hosted in a [submodule](./repository/).

[View Repository README](./repository/README.md)
