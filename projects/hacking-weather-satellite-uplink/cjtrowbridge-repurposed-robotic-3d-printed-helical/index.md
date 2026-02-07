---
layout: default
title: "cjtrowbridge: repurposed robotic 3D-printed helical"
---

# cjtrowbridge: repurposed robotic 3D-printed helical

**Parent Project:** [Hacking Weather Satellite Uplink](../)

| Field | Details |
| --- | --- |
| Feed type | Helical (3D-printed) |
| Reflector type | Parabolic dish (TV/RV satellite reflector) |
| Alignment mechanism | Repurposed robotic mount |

This is an uplink for connecting to the [GOES](https://en.wikipedia.org/wiki/Geostationary_Operational_Environmental_Satellite) weather satellite weather satellites. This allows me to receive real-time weather forecasts, photography, and emergency alerts directly from space without needing an internet connection.

![GOES Satellite](/assets/images/goes-8.jpg)

## The Project

For this project, I got an old robotic TV satellite dish mount from marketplace for $20. 

I built a vibe pipeline to iterate on a design for a helical feed antenna in SCAD and printed it on my 3D printer. I designed it to fit over the original feed and center the new antenna at the focal point of the dish. I also built a new motor controller to use the robotic mount's motors to automatically find the satellite in the sky.

## Here is the parts list:
- [Solid-core 6mm^2 copper wire](https://amzn.to/4kmiW9O) for the helicone elements. I used 6mm^2 because it is the closest standard size to the ideal diameter for the GOES frequency.
- [SMA flange](https://amzn.to/4kmAlPT) to connect the feed to the LNA.
- [Special Low Noise Amplifier (LNA)](https://amzn.to/45TIxB9) designed for the GOES satellite frequency.
- [RTL-SDR dongle](https://amzn.to/4tk5M1i) to receive the satellite signal.
- [Raspberry Pi Zero 2W](https://amzn.to/45SZN9K) to run rtl_tcp and stream data to my main computer, running [SatDump](https://github.com/SatDump/SatDump) and [goestools](https://github.com/pietern/goestools)
- [Battery pack For Raspberry Pi](https://amzn.to/4aBLXer) to power the receiver in the field. These are great.
- [Memory card For Raspberry Pi](https://amzn.to/4tk5KX8) to store the OS and software.

More details coming soon!