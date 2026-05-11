---
layout: project
title: "Biblioteca Noetica"
slug: biblioteca-noetica
guilds:
  - lorekeepers
link: "https://github.com/High-Desert-Institute/biblioteca-noetica"
summary: >-
  A pre-build blueprint for a multimodal, argument-indexed knowledge library with SemRAG tutoring workflows and federated, opt-in knowledge graph design.
---

# Biblioteca Noetica

Biblioteca Noetica is a Lorekeepers project for designing a multimodal knowledge system that can ingest video, documents, and other media; extract arguments and evidence; and expose grounded SemRAG tutoring over a federated knowledge graph.

## Current state of the repository

The linked repository is currently a project blueprint and execution framework rather than a finished application build. Right now it contains:

- A comprehensive project specification and roadmap in `README.md`.
- Planning and governance structure in `plans/`, `playbooks/`, `templates/`, `references/`, and `downtime/`.
- Utility support in `scripts/`, including plan index regeneration.
- Framework bootstrap files (`AGENTS.md`, `CODEX.md`, `CLAUDE.md`, `GEMINI.md`, `OPENCODE.md`).
- A nested `agents/` git submodule that provides the upstream agent framework used by the repo.

As implementation code lands, this project page should continue to track the repository's actual top-level contents and maturity.
