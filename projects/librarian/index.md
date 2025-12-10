---
layout: project
title: "Librarian"
slug: librarian
guilds:
   - lorekeepers
link: "https://github.com/High-Desert-Institute/Librarian"
summary: >-
   A free, open-source digital librarian that runs on local hardware, answers questions from your own Library, and stays connected to the mesh via Meshtastic.
---

# The Librarian

**The Librarian** is a privacy-first knowledge steward that runs entirely on your own hardware—typically a Raspberry Pi paired with a Meshtastic node. Communities can load their local Library with PDFs, text files, videos, and field guides, then ask questions in natural language over Wi-Fi or the Cyberpony Express mesh. Because everything is offline, the Librarian keeps working when the public internet fails.

<img src="/assets/images/librarian.gif" alt="The Librarian" class="photo">

## Features

- **Local LLM** – Runs a lightweight model via Ollama so prompts never leave the outpost.
- **Meshtastic integration** – Offers a text interface over the mesh and can plug into RAG pipelines to cite local documents.
- **Custom knowledge base** – Drop new books or manuals into the Library and the Librarian immediately knows about them.
- **Multi-modal delivery** – Answers can be served over Wi-Fi with attachments or trimmed down to mesh-friendly text.
- **Open source and extensible** – All code lives in the HDI GitHub org, inviting contributions from guild members worldwide.

This project is hosted in a [submodule](./repository/).

[View Repository README](./repository/README.md)
