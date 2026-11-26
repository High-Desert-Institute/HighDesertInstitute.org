---
layout: project
title: Tools
slug: tools
guilds:
  - artificers
summary: >-
  The Artificers’ Guild makes tools with laser cutters and 3D printers. Explore the design frameworks and individual tool projects below.
---

## Design frameworks

- **[Vibe Modeling](https://github.com/cjtrowbridge/vibe-modeling)** is an agentic framework for generating complex, detailed 3D models for printing. Use it to turn a design brief into a model, inspect the result, and iterate on the geometry.
- **[Vibe Cutting](https://github.com/cjtrowbridge/vibe-cutting)** is an agentic framework for designing complex laser-cut objects. It brings gear-network queries and drivetrain design into the same workflow as generating and testing cut and engraving paths.

## Tool projects

{% assign entries = '' | split: '' %}
{% for item in site.pages %}
  {% assign parts = item.path | split: '/' %}
  {% if parts.size == 5 and parts[0] == 'projects' and parts[1] == 'tools' and parts[2] == 'tools' and parts[4] == 'readme.md' %}
    {% assign entries = entries | push: item %}
  {% endif %}
{% endfor %}
{% assign entries = entries | sort: 'date' | reverse %}
{% for tool in entries %}
<article>
  <h3><a href="{{ tool.url | relative_url }}">{{ tool.title | escape }}</a></h3>
  <time datetime="{{ tool.date | date: '%Y-%m-%d' }}">{{ tool.date | date: '%B %-d, %Y' }}</time>
  <p>{{ tool.summary | escape }}</p>
</article>
{% endfor %}
