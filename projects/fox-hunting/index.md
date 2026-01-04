---
layout: project
title: "Fox Hunting: Community Policing"
slug: fox-hunting
guilds:
  - pathfinders
summary: >-
  Developing skills and tools for radio direction finding to maintain the integrity of the Cyberpony Express mesh network and locate interference.
---

<img src="/assets/images/fox-hunting.jpg" class="photo">

# Community Policing: Fox Hunting

## Problem statement

A single misconfigured or malfunctioning Meshtastic node (or small cluster) can degrade a whole regional mesh—e.g., forwarding pathologies, channel/preset mismatches, bad power/antenna setups, or “repeater-ish” configurations that behave in destabilizing ways.

The community needs a repeatable, friendly, non-escalatory way to **find the source** and **dispatch assistance**.

## Goal

Build a **portable direction-finding + coordination kit** and a **skillshare workshop series** that trains everyday users to:

1. Detect “network sick” conditions
2. Localize the likely offending node(s)
3. Contact the operator
4. Remediate with them (config + placement + RF hygiene)
5. Document the incident so the network gets stronger over time

## Non-goals

* Not for surveillance, intimidation, or punishment
* Not for interference/jamming
* Not for doxxing or public shaming
* Not for locating people—**nodes, configs, and RF symptoms only**

---

## Project Resources

* **[Tools & Hardware](tools/)**: Specifications for the 4-element array and spotter nodes.
* **[Workshop Series](workshops/)**: Curriculum for skillshare sessions.
* **[Outreach Strategy & Protocol](outreach-strategy/)**: Scripts and protocols for community policing.

## Further Reading/Watching
* [Gadgets For People Who Don't Trust The Government](https://www.youtube.com/watch?v=W_F4rEaRduk) An exploration of DIY radio direction finding techniques and existing projects for identifying and locating bad actors.
* [Colonel Panic Github](https://github.com/colonelpanichacks?tab=repositories) A colleciton of projects related to RF direction finding and interference hunting, including drone tracking, foxhunting, flock detection, stingray detection, and even Meshtastic LLM projects.

---

## System behavior (end-to-end)

### 1) Detect “we have a fox” (triage)

**Indicators to train on:**

* Sudden drop in message delivery reliability across multiple users
* Abnormally high channel occupancy (looks “busy” but nothing useful gets through)
* Repeated identical packets / suspicious repeating patterns
* A localized area where traffic looks “loud” but network usefulness collapses

**Coordinator role:** show “the RF looks wrong” and create a timestamped incident log.

### 2) Constrain the search area (coarse localization)

* Pi watches the waterfall to identify *where in frequency/time* the disruption is concentrated.
* Spotters spread out (even just a few hundred meters apart) and report RSSI/SNR observations + their GPS positions.

Output: an initial “heat map” of where the offending transmitter *probably* is.

### 3) Bearing + close-in pinpoint (fine localization)

As you close in, switch from “triangulation” to “close-in methods”:

* Directional antenna + step attenuation mindset (so you don’t just peg the meter everywhere)
* Short moves + quick readings
* Repeat until you can say “it’s that camp / that vehicle / that structure,” then stop and contact politely.

### 4) Assist + restore

Check out the [outreach strategy page](outreach-strategy/) for scripts and protocols. Our goal is to persuade the operator to correct the problem. We can escalate to the FCC but that will take months or years. Figure out how to talk them into fixing it now.

A standard “help checklist” for the operator:

* Confirm channel/preset compatibility
* Check hop settings / role settings
* Verify antenna, placement, power
* Confirm no accidental “special modes” or duplicated configs across multiple nodes
* Validate improvement with before/after logs

### 5) Document + learn

A lightweight incident report:

* Symptoms observed
* How localization was done
* What the fix was
* What preventative guidance should be taught next time

---

## Engineering MVP checklist

Treat MVP as: **sensing + spatial sampling + logging + coordination**.

### MVP outputs

* A timestamped “incident start/end”
* A list of spotter readings: `(time, lat, lon, rssi, snr, note)`
* A “likely source area” estimate (even if manual at first)
* A short after-action summary

### MVP constraints

* Works offline
* Works with 2–4 people
* Doesn’t require perfect calibration to be useful
