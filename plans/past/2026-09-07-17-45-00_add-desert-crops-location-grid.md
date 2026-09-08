---
plan_id: 2026-09-07-17-45-00_add-desert-crops-location-grid
title: Add Desert Crops location compatibility grid
summary: Add an extensible crop-page location-temperature schema and generate a rotated-header grid for researched locales and planned outpost locations.
status: past
created_at: 2026-09-07-17-45-00
---

# Add Desert Crops location compatibility grid

Key: `[ ]` pending task, `[x]` completed task, `[?]` needs validation, `[-]` closed task

- [x] 1. Define a reusable location-intersection schema.
  - [x] 1.1 Add ordered locale and planned-outpost column metadata to the Desert Crops index.
  - [x] 1.2 Document crop-page temperature records and the check/question/cross decision rule.

- [x] 2. Populate existing research.
  - [x] 2.1 Add the existing nine researched locale temperature records to each initial crop profile.
  - [x] 2.2 Leave planned outpost intersections without research records as explicit unknowns.

- [x] 3. Create and style the compatibility grid.
  - [x] 3.1 Generate one rotated location column per researched locale or planned outpost location.
  - [x] 3.2 Render green checks, question marks, and red crosses from crop thresholds and location records.
  - [x] 3.3 Explain grid scope and link it to the more complete biome assessment.

- [x] 4. Verify and archive the work.
  - [x] 4.1 Validate all crop schemas and grid column IDs.
  - [x] 4.2 Run available static checks and review the diff.
  - [x] 4.3 Regenerate plan indexes and archive the completed plan.
