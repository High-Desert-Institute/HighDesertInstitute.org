---
layout: default
title: Board
---

# Board

These are the current members of our nonprofit board, tasked with overseeing governance and empowering the teams and projects that make up the guilds and lands of the High Desert Institute.


<div markdown="0">

{% assign sorted_pages = site.pages | sort: "order" %}

{% for page in sorted_pages %}
  {% if page.path contains "board/" and page.path != "board/index.md" %}
    <hr>
    {% if page.thumbnail %}
      <img src="{{ page.thumbnail }}" alt="{{ page.title }} image" style="max-width: 100%; height: auto; border-radius: 8px; margin-bottom: 1rem;">
    {% endif %}
    <h2><a href="{{ page.url }}">{{ page.title }}</a></h2>
    {% if page.blurb %}<p>{{ page.blurb }}</p>{% endif %}
  {% endif %}
{% endfor %}

</div>
