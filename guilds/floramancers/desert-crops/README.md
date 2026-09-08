# Desert Crops content guide

The public `index.md` discovers crop profiles automatically from `site.pages` when their front matter includes `desert_crop: true`. Each crop has its own `<crop-slug>/index.md` and uses the shared `_layouts/desert-crop.html` layout.

## Adding a crop

1. Copy the template below into `<crop-slug>/index.md`.
2. Replace every placeholder and keep all four biome keys.
3. Use numeric values for measurements; units belong in field names.
4. Separate productive climate limits from absolute survival claims.
5. Use `research_anchored_estimate` or `planning_estimate` for `water.evidence`.
6. Use one of `recommended`, `promising`, `experimental`, or `unsuitable` for every biome rating.
7. Add primary sources and explain important uncertainties in the page body.

## Crop profile template

```yaml
---
layout: desert-crop
title: Common Crop Name
desert_crop: true
crop_id: crop-slug
scientific_name: Genus species
summary: One sentence explaining this crop's high-desert role.
crop_system: [hot, cold, crossover]
system_primary: hot
lifecycle: perennial
harvested_part: fruit
products: [first product, second product]

biome_suitability:
  hot_high_desert:
    rating: experimental
    confidence: low
    note: Explain the main opportunity or limitation.
  hot_cold_high_desert:
    rating: experimental
    confidence: low
    note: Explain the main opportunity or limitation.
  cold_plateau:
    rating: experimental
    confidence: low
    note: Explain the main opportunity or limitation.
  alpine:
    rating: experimental
    confidence: low
    note: Explain the main opportunity or limitation.

temperature:
  productive_winter_min_f: 0
  routine_summer_max_f: 100

# Add a record only when this crop/location intersection has been researched.
# Its absence renders as ? in the public location-temperature grid.
location_temperature:
  location-id:
    winter_low_f: 0
    summer_high_f: 100
    evidence: research_summary

water:
  annual_acre_feet_per_acre:
    minimum: 0.0
    maximum: 0.0
  seasonal_gallons_per_mature_plant_day:
    spring: {minimum: 0, maximum: 0}
    summer: {minimum: 0, maximum: 0}
    fall: {minimum: 0, maximum: 0}
  evidence: planning_estimate

production:
  plants_per_acre: 0
  mature_yield_lb_per_acre:
    minimum: 0
    maximum: 0

data_status: preliminary

trial_priorities:
  - State one measurable research question.
  - State another measurable research question.

sources:
  - label: Primary source title
    url: https://example.org/source
---

## Why it belongs

Explain how the crop contributes to the hot, cold, or crossover crop system.

## Cultivation and selection notes

Explain the important climatic, agronomic, product-quality, and breeding considerations that do not fit cleanly in structured fields.
```

## Interpretation rules

- **Recommended:** evidence supports productive cultivation in the biome.
- **Promising:** likely to fit, but local validation is still needed.
- **Experimental:** useful as a field trial or breeding candidate.
- **Unsuitable:** major climatic constraints make dependable outdoor production unlikely.
- **Productive winter minimum:** an approximate annual extreme minimum compatible with dependable production, not the lowest temperature at which tissue might survive.
- **Routine summer maximum:** an approximate recurring daytime maximum compatible with productive growth, not an instantaneous lethal temperature.
- **Location temperature record:** a crop-page intersection record containing the researched winter low and summer high for one named location. The index gives that cell a green check when the low is not below the crop's productive winter minimum and the high is not above the crop's routine summer maximum; it gives a red cross otherwise. Missing records render as a question mark.
- **Daily-equivalent irrigation:** a system-sizing value. Actual water may be applied in deeper, less-frequent events.

The schema is intentionally conservative. Add new structured fields only when they can be populated consistently across the catalog and improve comparisons on the public index.
