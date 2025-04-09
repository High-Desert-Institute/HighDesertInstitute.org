---
layout: default
title: Guilds
---

# Guilds

Guilds are groups within the High Desert Institute that focus on particular topics or aspects of community development. These are semi-atonomous organizations which start out as ad-hoc committees with a degree of self-governance ability including their own budget and fundraising ability, plus broad authority to decide how their projects happen, including spending. The goal is that these guilds will grow beyond the High Desert Institute, and eventually take on a life of their own, all over the world.


<div markdown="0">

{% assign sorted_pages = site.pages | sort: "order" %}
{% for page in sorted_pages %}
  {% if page.path contains "guilds/" and page.path != "guilds/index.md" %}
    {% if page.thumbnail %}
      <img src="{{ page.thumbnail }}" alt="{{ page.title }} image" class="photo">
    {% endif %}
    <h3><a href="{{ page.url }}">{{ page.title }}</a></h3>
    {% if page.blurb %}<p>{{ page.blurb }}</p>{% endif %}
    {% break %}
  {% endif %}
{% endfor %}

</div>