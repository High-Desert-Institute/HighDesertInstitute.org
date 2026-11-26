---
layout: default
title: Astrolabes
date: 2026-11-25
permalink: /projects/tools/tools/astrolabes/
summary: >-
  Build a pocket or large laser-cut astrolabe and use a star’s height above the horizon to tell time.
---

[Artificers’ Tools]({{ '/projects/tools/' | relative_url }})

# Astrolabes

A planispheric astrolabe is a handheld model of the sky and an instrument for observing it. Imagine holding a map of the stars over a drawing of your local horizon. Turn the star map and you can watch stars rise in the east, climb, and set in the west. An astrolabe makes that motion measurable. It uses a stereographic projection to draw the curved sky on a flat disk, with both layers sharing a pivot at the celestial pole.

## Reading the instrument

The **mater** is the body that holds the instrument together. A **latitude plate** inside it shows the horizon, compass directions, and curves of equal altitude. Altitude here means the angle above the horizon. A star on the horizon is at 0°, and one directly overhead is at 90°. The plate must match the observer’s latitude because the same star follows a different path across the sky when seen from farther north or south.

Above the plate turns the **rete**, a map with pointers for bright stars and a circle marking the Sun’s annual path, the ecliptic. The open spaces in a traditional rete let you see which altitude curve lies beneath a star pointer. A **rule** on the front helps read the scales around the rim. A separate sighting arm on the back, the **alidade**, lets you measure the sky itself. [Illustrated guide to the parts from the Whipple Museum](https://www.whipplemuseum.cam.ac.uk/explore-whipple-collections/astronomy/medieval-astrolabe/parts-astrolabe)

## Telling time from a star

1. Identify a bright star marked on the rete. Hang the instrument by its ring so it is vertical. Turn the alidade until you can sight the star along it, then read its altitude from the back scale.
2. On the front, rotate the rete until the star pointer meets the curve for the altitude you measured. A star can cross that curve twice in a night. Choose the eastern crossing if the star is rising or the western crossing if it is setting.
3. Find the Sun’s position for the observation date using the instrument’s calendar. On a traditional astrolabe, set the rule over that point on the ecliptic and read the hour on the rim. The modern builds below provide a calendar scale for this step. The reading is local apparent solar time, with noon when the Sun crosses your meridian. Comparing it with a clock also requires accounting for the equation of time, your longitude within the time zone, and daylight saving time where applicable.

You can also work forward from a date and time to find which stars will be visible. To estimate sunrise or sunset on a traditional plate, turn the date’s point on the ecliptic to the eastern or western horizon and read the corresponding hour. [Oxford’s guide to the astrolabe](https://www.mhs.ox.ac.uk/epact/article.php?ArticleID=2)

## Tutorials

- [Calculate time with an Islamic astrolabe — NOVA](https://www.youtube.com/watch?v=0MxzfqadkBQ)
- [How to use an astrolabe — British Museum, Curator’s Corner](https://www.youtube.com/watch?v=N8oWGwcdFmA)
- [Use the modern astrolabe featured in the build files — start at 4:56](https://www.youtube.com/watch?v=tt-_GKmX8dk&t=296s)

## Designs to build

Michael Robinson’s two designs use a transparent rotating sky map over an opaque, double-sided body. Before cutting either version, check the latitude used to generate the plate against your observing location.

- **Pocket astrolabe.** Its altitude curves are spaced every 5°. The repository includes SVGs for the laser-cut layers, a choice of detailed or simplified star maps, and OpenSCAD and STL files for the pointers. [Small astrolabe design and assembly notes](https://github.com/kb1dds/small_astrolabe)
- **Large astrolabe.** The larger face has room for altitude curves every 2°, making it easier to place a star between adjacent markings. The repository includes the cutting files and a guide to the front and back scales. [Large astrolabe design and assembly notes](https://github.com/kb1dds/large_astrolabe)

### More designs and construction guides

- Explore Richard Wymarc’s generator to lay out an astrolabe for your latitude, or try the simulator to see how the scales work before cutting parts. [The Astrolabe Project](https://www.astrolabeproject.com/)
- Follow an illustrated, step-by-step build for a customized instrument. [How to Build a Customized Astrolabe Using a Laser Cutter](https://www.instructables.com/How-to-Build-a-Customized-Astrolabe-Using-a-Laser-/)
- Browse two more designs on Thingiverse. [Astrolabe design #3657530](https://www.thingiverse.com/thing:3657530) · [Wymarc’s advanced astrolabe](https://www.thingiverse.com/thing:3681024)

## Reference instrument

I bought Wavytail’s pocket-sized astrolabe to use as a physical reference while building my own astrolabes. [Mini Astrolabe on Etsy](https://www.etsy.com/listing/1459306331/mini-astrolabe-pocket-sized-astronomical)
