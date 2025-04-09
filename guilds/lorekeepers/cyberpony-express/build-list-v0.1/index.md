---
layout: default
title: Cyberpony Express
---

# Lorekeepers' Guild: The Cyberpony Express - Build List v0.1

<img src="/assets/images/cyberpony-express.jpg" alt="The Cyberpony Express" class="photo">
  
### Mobile Client Device
- [Lilygo T-Deck](https://www.amazon.com/LILYGO-Meshtastic-ESP32-S3-Keyboard-Development/dp/B0DL8PJ69F)
- [Maps for T-Deck](https://old.reddit.com/r/meshtastic/comments/1j1chem/meshtastic_26_map_tiles_with_higher_zoom_levels/)
  
### Minimal Public Node
- **Provides:** 
  - Meshtastic
  - Weather data (Optional)
  - Keeps working indefinitely during disasters
- **Parts List:**
    - [Large LoRa Antenna](https://www.amazon.com/dp/B09WR8DT2J) (Optional)
        - [Antenna connector](https://www.amazon.com/gp/product/B097GFY8LG)
    - [Enclosure](https://www.amazon.com/dp/B0B87XSMVP) (If outside)
    - [Weather Sensor](https://www.amazon.com/dp/B07KR24P6P) (Optional)
    - [Meshtastic node with battery](https://www.amazon.com/dp/B0DGT68T3R)
    - [USB solar panel](https://www.amazon.com/dp/B0CJ5C2QY5)
  
### Simple Public Node
- **Provides:** 
  - Meshtastic
  - Local Wikipedia
  - Bulletin Board Service (BBS)
  - Weather Data
  - Keeps working indefinitely during disasters

- **Parts List:**
    - [Large LoRa Antenna](https://www.amazon.com/dp/B09WR8DT2J)
    - [Antenna connector](https://www.amazon.com/gp/product/B097GFY8LG)
    - [Enclosure](https://www.amazon.com/dp/B0B87XSMVP)
    - [Weather Sensor](https://www.amazon.com/dp/B07KR24P6P)
    - [Meshtastic node with battery](https://www.amazon.com/dp/B0DGT68T3R)
    - [USB solar panel](https://www.amazon.com/dp/B0CJ5C2QY5)
    - [Power Splitter](https://www.amazon.com/gp/product/B0C73VPL8P)
    - [Raspberry Pi Zero W2](https://www.amazon.com/gp/product/B09LH5SBPS)
    - [Battery+Hat](https://www.amazon.com/gp/product/B08D678XPR)
    - [MicroSD Card](https://www.amazon.com/SAMSUNG-Smartphones-Nintendo-Switch-MB-ME1T0SA-AM/dp/B0CWPNR918)
  
### Advanced Public Node
- **Provides:** 
  - Meshtastic
  - Local Wikipedia
  - Bulletin Board Service (BBS)
  - Weather Data
  - LLM chat bot with RAG (Having AI means external power is needed for the AI)
  - Everything except the AI can keep working indefinitely during a disaster
- **Parts List:**
    - [Large LoRa Antenna](https://www.amazon.com/dp/B09WR8DT2J)
    - [Antenna connector](https://www.amazon.com/gp/product/B097GFY8LG)
    - [Larger Enclosure with Ventilation](https://www.amazon.com/gp/product/B0CT863GWQ)
    - [Weather Sensor](https://www.amazon.com/dp/B07KR24P6P)
    - [Meshtastic node with battery](https://www.amazon.com/dp/B0DGT68T3R)
    - [Raspberry Pi 5 (16gb)](https://www.amazon.com/Vemico-Raspberry-Single-Board-Computer/dp/B0DT14VHVM)
    - [MicroSD Card](https://www.amazon.com/SAMSUNG-Smartphones-Nintendo-Switch-MB-ME1T0SA-AM/dp/B0CWPNR918)
    - [Power Cable](https://www.amazon.com/PDEEY-Extension-Outdoor-Waterproof-Charger/dp/B0CP3QQ633)


## Consider Also
  
TC2 is a Youtube channel and community which is developing [its own BBS software](https://www.youtube.com/watch?v=qwwAOZnLLgg), and they have also developed their own [custom hardware](https://www.youtube.com/watch?v=lOPbck4ysos) to run that BBS as well as Meshtastic on a custom, minimal, solar-powered single-board-computer.

The TC2 project has gotten a lot of attention and volunteer help on solving technical challenges, designing custom hardware, and they’ve built a huge community of committed volunteers who are doing a lot of exciting work that we can learn a lot from. That said, the TC2 system isn’t powerful enough to host Internet-In-A-Box or artificial intelligence chat bots with RAG, but it’s worth considering for remote router nodes that could manage a local BBS which connects to more advanced nodes elsewhere and acts as a proxy to allow people to leave messages in the BBS for the chat bot, and then check back for replies.

**VeggieVampire** is building [another Meshtastic BBS project](https://www.tomshardware.com/raspberry-pi/raspberry-pi-powers-this-meshtastic-network-bbs) which runs on a Raspberry Pi using the version of Meshtastic that runs in Linux, meaning an additional Meshtastic node is not needed; you only need the one Raspberry Pi. This project is much smaller but actually it might be a better fit for what we’re trying to do.

[Glancing at the code](https://github.com/VeggieVampire/MeshBoard), it looks like some version of this would be able to deliver everything we want, including integrating with the chat bots, and allowing the same single-board-computer to host internet-in-a-box, host the AI chat bots, run RAG against the local IIAB install, and also be its own Meshtastic node. This would drastically lower the cost of the node, requiring only a single computer for the entire node instead of several.


[← Back to Cyberpony Express](/guilds/lorekeepers/cyberpony-express/)  
[← Back to Lorekeepers' Guild](/guilds/lorekeepers)  
[← Back to All Guilds](/guilds/)  
[← Back to Home](/)
