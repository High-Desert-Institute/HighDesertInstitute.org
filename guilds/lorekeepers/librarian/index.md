---
layout: default
title: Librarian
---

# Lorekeepers' Guild: The Librarian

<img src="/assets/images/librarian.gif" alt="The Librarian" class="photo">

The librarian is a free, open-source, digital librarian to help you find what you need and answer complex questions. A small LLM runs on an edge device like a Raspberry Pi in order to answer complex questions based on the contents of the local library. This means, communities can add contents to the library and the librarian will be able to answer questions based on that content.  

## Features
- **Local LLM**: Runs a small language model on an edge device, ensuring privacy and low latency.
- **Meshtastic Integration**: Connects with Meshtastic devices to provide offline access to the librarian's knowledge base in remote areas. Can leverage RAG pipeline to answer complicated questions based on the local library's contents.
- **Custom Knowledge Base**: Easily add documents, books, and other resources to the library for the librarian to reference.
- **Natural Language Queries**: Ask questions in plain English and get accurate, context-aware responses.
- **Multi-format Support**: Supports various document formats including PDFs, text files, and more. Meshtastic is text-only, but local wifi serves other formats like video, images, files, etc.
- **User-friendly Interface**: Simple web interface for easy interaction with the librarian, or via text message on Meshtastic.
- **Open Source**: Fully open-source, allowing for customization and community contributions.
- **Offline Capability**: Operates without an internet connection, making it ideal for remote or underserved areas.
- **Scalable**: Can be deployed on various hardware configurations, from single-board computers to more powerful servers.
- **Community-driven**: Encourages contributions from users to improve and expand the librarian's capabilities.

## Recommended Hardware
- Raspberry Pi 5 with 16GB RAM
- 256GB or larger microSD card or SSD for storage
- Lilygo T-Beam Supreme or other Meshtastic-compatible device for mesh networking
- Large antenna mounted up high for better range

- Recommended Personal Node:
    -T-Deck Plus as a terminal to interact with the librarian. Battery life isn't amazing, but it has a keyboard and screen which makes it easy to send/receive messages on the node device itself.
    -Meshpocket; a rugged node with a huge battery which lasts for weeks and has a really great internal antenna. It doesn't have a keyboard, so you'll need to use a phone or computer to interact with it, but you can leave this in your backpack for weeks and it will work.

## Software

The development repository is here. Please feel free to contribute, make suggestions, or post issues.



---

[← Back to Lorekeepers' Guild](/guilds/lorekeepers)  
[← Back to All Guilds](/guilds/)  
[← Back to Home](/)
