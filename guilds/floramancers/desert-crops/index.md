---
layout: default
title: Desert Crops - Floramancers' Guild
location_columns:
  - {id: coloma, title: Coloma, type: researched locale}
  - {id: nevada_city, title: Nevada City, type: researched locale}
  - {id: kingman, title: Kingman, type: researched locale}
  - {id: barstow, title: Barstow, type: researched locale}
  - {id: lucerne_lake, title: "Lucerne, Lake County", type: researched locale}
  - {id: lucerne_valley, title: Lucerne Valley, type: researched locale}
  - {id: bishop, title: Bishop, type: researched locale}
  - {id: mammoth_lakes, title: Mammoth Lakes, type: locale and planned outpost, outpost_url: /outposts/mammoth/}
  - {id: alturas, title: Alturas, type: researched locale}
  - {id: grand_canyon, title: Grand Canyon, type: planned outpost, outpost_url: /outposts/high-ground/}
  - {id: tucson, title: Tucson, type: planned outpost, outpost_url: /outposts/peoples-winter-palace/}
  - {id: quartzsite, title: Quartzsite, type: planned outpost, outpost_url: /outposts/quartzsite/}
  - {id: joshua_tree, title: Joshua Tree, type: planned outpost, outpost_url: /outposts/sky-spring/}
  - {id: slab_city, title: Slab City, type: planned outpost, outpost_url: /outposts/slab-city/}
  - {id: taos, title: Taos, type: planned outpost, outpost_url: /outposts/taos/}
---

{% assign desert_crops = site.pages | where: "desert_crop", true | sort: "title" %}

<nav aria-label="breadcrumb" class="mt-4">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="/guilds/floramancers/">Floramancers' Guild</a></li>
    <li class="breadcrumb-item active" aria-current="page">Desert Crops</li>
  </ol>
</nav>

# Desert Crops

<p class="lead">Develop practical crop systems for hot/cold high-desert regions.</p>

Desert Crops compares perennial specialty crops by productive climate range, water requirements, yield, products, and opportunities for local adaptation. The goal is not to force every crop into every desert. It is to identify a practical crop system for each biome and use field trials to expand the useful boundaries over time.

> **Evidence note:** This is an initial research catalog. Values labeled preliminary or experimental are planning ranges to test, not site-specific prescriptions.

## Choose a biome

<div class="row row-cols-1 row-cols-md-2 g-3 desert-biome-grid">
  <div class="col"><div class="card h-100 desert-biome-card"><div class="card-body">
    <h3 class="h4 mt-0">Hot high desert</h3>
    <p>Very hot, arid summers with relatively mild to moderately cold winters.</p>
    <p class="mb-0"><strong>Leading crops:</strong> date palm, Mission olive, Mission fig, and yaupon.</p>
  </div></div></div>
  <div class="col"><div class="card h-100 desert-biome-card"><div class="card-body">
    <h3 class="h4 mt-0">Hot/cold high desert</h3>
    <p>Intense summer heat combined with meaningful winter freeze pressure and large daily temperature swings.</p>
    <p class="mb-0"><strong>Leading crops:</strong> yaupon, chokecherry, serviceberry, and cold-selected figs or olives.</p>
  </div></div></div>
  <div class="col"><div class="card h-100 desert-biome-card"><div class="card-body">
    <h3 class="h4 mt-0">Cold high-desert plateau</h3>
    <p>Severe winters, warm but short summers, low precipitation, and recurring frost risk.</p>
    <p class="mb-0"><strong>Leading crops:</strong> haskap, black currant, chokecherry, and Saskatoon/serviceberry.</p>
  </div></div></div>
  <div class="col"><div class="card h-100 desert-biome-card"><div class="card-body">
    <h3 class="h4 mt-0">Alpine / very short season</h3>
    <p>Severe cold, late spring frost, early autumn frost, and limited accumulated summer heat.</p>
    <p class="mb-0"><strong>Leading crops:</strong> haskap, currants, improved chokecherry, and carefully selected serviceberry.</p>
  </div></div></div>
</div>

## Location temperature compatibility

This grid answers a deliberately narrow question: does the crop-page record show a location staying within that crop's current lower winter-temperature and upper summer-temperature bounds? A green check means no recorded temperature-bound problem; a red cross means the recorded low is below the crop's lower bound or the recorded high is above its upper bound; a question mark means that crop/location YAML record has not yet been added.

It does not replace the biome assessment. A green check does not establish reliable yield, sufficient accumulated heat, soil suitability, water availability, or commercial viability.

<div class="table-responsive desert-location-grid-wrap">
  <table class="table table-bordered text-center align-middle desert-location-grid">
    <thead>
      <tr>
        <th scope="col" class="desert-location-crop-heading">Crop</th>
        {% for location in page.location_columns %}
        <th scope="col" class="desert-location-heading" title="{{ location.title }} — {{ location.type }}">
          <div>
            {% if location.outpost_url %}<a href="{{ location.outpost_url }}">{{ location.title }}</a>{% else %}{{ location.title }}{% endif %}
          </div>
        </th>
        {% endfor %}
      </tr>
    </thead>
    <tbody>
      {% for crop in desert_crops %}
      <tr>
        <th scope="row" class="text-start"><a href="{{ crop.url }}">{{ crop.title }}</a></th>
        {% for location in page.location_columns %}
          {% assign location_id = location.id %}
          {% assign assessment = crop.location_temperature[location_id] %}
          {% assign temperature_state = 'unknown' %}
          {% if assessment %}
            {% assign temperature_state = 'within-bounds' %}
            {% if assessment.winter_low_f < crop.temperature.productive_winter_min_f %}
              {% assign temperature_state = 'outside-bounds' %}
            {% endif %}
            {% if assessment.summer_high_f > crop.temperature.routine_summer_max_f %}
              {% assign temperature_state = 'outside-bounds' %}
            {% endif %}
          {% endif %}
          <td class="desert-location-cell">
            {% if temperature_state == 'within-bounds' %}
              <span class="location-fit location-fit-ok" aria-label="Within recorded temperature bounds" title="Recorded: {{ assessment.winter_low_f }}°F winter low; {{ assessment.summer_high_f }}°F summer high. Crop bounds: {{ crop.temperature.productive_winter_min_f }}°F to {{ crop.temperature.routine_summer_max_f }}°F.">✓</span>
            {% elsif temperature_state == 'outside-bounds' %}
              <span class="location-fit location-fit-problem" aria-label="Recorded temperature outside crop bounds" title="Recorded: {{ assessment.winter_low_f }}°F winter low; {{ assessment.summer_high_f }}°F summer high. Crop bounds: {{ crop.temperature.productive_winter_min_f }}°F to {{ crop.temperature.routine_summer_max_f }}°F.">×</span>
            {% else %}
              <span class="location-fit location-fit-unknown" aria-label="No crop-page location temperature record" title="No location_temperature.{{ location.id }} record on this crop page.">?</span>
            {% endif %}
          </td>
        {% endfor %}
      </tr>
      {% endfor %}
    </tbody>
  </table>
</div>

<p class="small text-muted">Column headings link to their outpost pages where applicable. The first nine locations are populated from the current research conversation; the remaining planned-outpost columns intentionally remain unknown until a crop-page record is added.</p>

## Which crops fit each biome?

<p class="desert-rating-legend"><span class="desert-rating desert-rating-recommended">Recommended</span> supported for productive cultivation &nbsp; <span class="desert-rating desert-rating-promising">Promising</span> likely fit needing local validation &nbsp; <span class="desert-rating desert-rating-experimental">Experimental</span> trial or breeding candidate &nbsp; <span class="desert-rating desert-rating-unsuitable">Unsuitable</span> major climatic limitations</p>

<div class="table-responsive">
  <table class="table table-striped align-middle desert-comparison-table">
    <thead><tr><th scope="col">Crop</th><th scope="col">Hot desert</th><th scope="col">Hot/cold desert</th><th scope="col">Cold plateau</th><th scope="col">Alpine</th></tr></thead>
    <tbody>
      {% for crop in desert_crops %}
        <tr>
          <th scope="row"><a href="{{ crop.url }}">{{ crop.title }}</a></th>
          {% assign fits = "hot_high_desert,hot_cold_high_desert,cold_plateau,alpine" | split: "," %}
          {% for fit_key in fits %}
            {% assign fit = crop.biome_suitability[fit_key] %}
            <td><span class="desert-rating desert-rating-{{ fit.rating }}" title="{{ fit.note }} Confidence: {{ fit.confidence }}">{{ fit.rating | capitalize }}</span></td>
          {% endfor %}
        </tr>
      {% endfor %}
    </tbody>
  </table>
</div>

## Climate ranges

These values describe a first-pass productive envelope rather than one-night laboratory survival limits. Follow the crop links for biome-specific qualifications.

<div class="desert-chart" role="img" aria-label="Chart comparing productive winter minimum and routine summer maximum temperatures for each crop">
  <canvas id="desert-temperature-chart"></canvas>
</div>

<div class="table-responsive">
  <table class="table table-striped align-middle desert-comparison-table">
    <thead><tr><th scope="col">Crop</th><th scope="col">System</th><th scope="col">Productive winter minimum</th><th scope="col">Routine summer maximum</th></tr></thead>
    <tbody>
      {% for crop in desert_crops %}
      <tr>
        <th scope="row"><a href="{{ crop.url }}">{{ crop.title }}</a></th>
        <td>{{ crop.crop_system | join: ", " | capitalize }}</td>
        <td>{{ crop.temperature.productive_winter_min_f }}°F</td>
        <td>{{ crop.temperature.routine_summer_max_f }}°F</td>
      </tr>
      {% endfor %}
    </tbody>
  </table>
</div>

The cold portfolio occupies the low-temperature end, the hot portfolio occupies the high-temperature end, and crossover crops help define an overlap zone. Actual suitability also depends on growing-season length, frost timing, soil, humidity, and cultivar.

## Water and production

Water comparisons use mature productive plantings. “Drought tolerant” describes survival, not necessarily the water required for a dependable commercial crop.

<div class="desert-chart" role="img" aria-label="Chart comparing annual irrigation ranges in acre-feet per acre for each crop">
  <canvas id="desert-water-chart"></canvas>
</div>

<div class="table-responsive">
  <table class="table table-striped align-middle desert-comparison-table">
    <thead><tr><th scope="col">Crop</th><th scope="col">Annual irrigation</th><th scope="col">Mature yield</th><th scope="col">Summer gal/plant/day</th><th scope="col">Evidence</th></tr></thead>
    <tbody>
      {% for crop in desert_crops %}
      <tr>
        <th scope="row"><a href="{{ crop.url }}">{{ crop.title }}</a></th>
        <td>{{ crop.water.annual_acre_feet_per_acre.minimum }}–{{ crop.water.annual_acre_feet_per_acre.maximum }} acre-ft/acre</td>
        <td>{{ crop.production.mature_yield_lb_per_acre.minimum }}–{{ crop.production.mature_yield_lb_per_acre.maximum }} lb/acre</td>
        <td>{{ crop.water.seasonal_gallons_per_mature_plant_day.summer.minimum }}–{{ crop.water.seasonal_gallons_per_mature_plant_day.summer.maximum }}</td>
        <td>{{ crop.water.evidence | replace: "_", " " | capitalize }}</td>
      </tr>
      {% endfor %}
    </tbody>
  </table>
</div>

These figures reveal three broad hydraulic classes: small shrubs and berries use single-digit gallons per mature plant, orchard trees use tens of gallons, and mature date palms use hundreds. Plant density and annual acre-feet remain essential when comparing whole systems.

## Crop catalog

<div class="row row-cols-1 row-cols-md-2 row-cols-xl-3 g-3">
  {% for crop in desert_crops %}
  <div class="col">
    <article class="card h-100 desert-crop-card"><div class="card-body d-flex flex-column">
      <p class="small text-uppercase text-muted mb-1">{{ crop.crop_system | join: " / " }} system</p>
      <h3 class="h4 mt-0"><a href="{{ crop.url }}">{{ crop.title }}</a></h3>
      <p class="fst-italic">{{ crop.scientific_name }}</p>
      <p>{{ crop.summary }}</p>
      <p class="small mb-3"><strong>Products:</strong> {{ crop.products | join: ", " }}</p>
      <a class="btn btn-sm btn-outline-primary mt-auto" href="{{ crop.url }}">View crop profile</a>
    </div></article>
  </div>
  {% endfor %}
</div>

## Trial locations as biome analogs

| Location | Biome role | Principal research value |
|---|---|---|
| Barstow | Hot high desert | Extreme-heat production and date trials |
| Lucerne Valley | Hot/cold high desert | Desert heat with meaningful winter selection |
| Kingman | Hot/cold high desert | Cold, aridity, alkaline soil, and intense solar exposure |
| Bishop | Hot/cold transition | Strong combined heat and winter-cold selection |
| Alturas | Cold plateau | Cold-system production and cultivar selection |
| Mammoth Lakes | Alpine / short season | Extreme-cold and season-length stress testing |

Coloma and Lucerne can provide productive warm-climate baselines without defining the high-desert target biomes themselves.

## Shared evaluation method

Trials should record:

- Winter survival, wood injury, flowering, and frost loss
- Heat injury, ripening dates, harvest length, yield, and product quality
- Irrigation applied by season and at peak demand
- Yield response under full and deficit irrigation
- Soil, salinity, pest, and disease observations
- Performance by cultivar, seedling family, and microclimate
- Yield and eventual gross revenue per acre-foot

The first major research gap is a western high-desert water-response curve for productive yaupon. Other priorities include cold-selected Mission-type figs, cold-edge Mission olives, improved chokecherries, and heat-tolerant cold-system berries.

## Evidence labels

- **Research-anchored estimate:** derived from published production or irrigation research, but not necessarily from the target biome.
- **Planning estimate:** suitable for sizing an experiment, not for final engineering or financial decisions.
- **Experimental:** local performance must be demonstrated before recommending production acreage.

The original [crop feasibility conversation](./Crop%20Feasibility%20Comparison.html) is retained as research context. Claims should be checked against their primary sources as individual crop profiles mature.

<script>
document.addEventListener('DOMContentLoaded', function () {
  if (typeof Chart === 'undefined') return;

  const cropLabels = [{% for crop in desert_crops %}{{ crop.title | jsonify }}{% unless forloop.last %}, {% endunless %}{% endfor %}];

  new Chart(document.getElementById('desert-temperature-chart'), {
    type: 'bar',
    data: {
      labels: cropLabels,
      datasets: [
        {
          label: 'Productive winter minimum to freezing (°F)',
          data: [{% for crop in desert_crops %}[{{ crop.temperature.productive_winter_min_f }}, 32]{% unless forloop.last %}, {% endunless %}{% endfor %}],
          backgroundColor: 'rgba(2, 132, 199, 0.75)',
          borderColor: 'rgb(2, 132, 199)',
          borderWidth: 1
        },
        {
          label: 'Warm-season reference to routine maximum (°F)',
          data: [{% for crop in desert_crops %}[80, {{ crop.temperature.routine_summer_max_f }}]{% unless forloop.last %}, {% endunless %}{% endfor %}],
          backgroundColor: 'rgba(220, 38, 38, 0.7)',
          borderColor: 'rgb(220, 38, 38)',
          borderWidth: 1
        }
      ]
    },
    options: {
      indexAxis: 'y',
      maintainAspectRatio: false,
      responsive: true,
      scales: { x: { min: -55, max: 125, title: { display: true, text: 'Temperature (°F)' } } },
      plugins: { tooltip: { callbacks: { label: function (context) { return context.dataset.label + ': ' + context.raw[0] + ' to ' + context.raw[1] + '°F'; } } } }
    }
  });

  new Chart(document.getElementById('desert-water-chart'), {
    type: 'bar',
    data: {
      labels: cropLabels,
      datasets: [{
        label: 'Annual productive irrigation range',
        data: [{% for crop in desert_crops %}[{{ crop.water.annual_acre_feet_per_acre.minimum }}, {{ crop.water.annual_acre_feet_per_acre.maximum }}]{% unless forloop.last %}, {% endunless %}{% endfor %}],
        backgroundColor: 'rgba(14, 116, 144, 0.75)',
        borderColor: 'rgb(14, 116, 144)',
        borderWidth: 1
      }]
    },
    options: {
      indexAxis: 'y',
      maintainAspectRatio: false,
      responsive: true,
      scales: { x: { beginAtZero: true, title: { display: true, text: 'Acre-feet per acre per year' } } },
      plugins: { tooltip: { callbacks: { label: function (context) { return context.raw[0] + ' to ' + context.raw[1] + ' acre-feet/acre/year'; } } } }
    }
  });
});
</script>

[← Back to Floramancers' Guild](/guilds/floramancers/)

[← Back to All Guilds](/guilds/)
