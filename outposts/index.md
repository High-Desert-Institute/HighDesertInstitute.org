---
layout: default
title: Outposts
---

# Outposts

These are the land projects currently being developed by the High Desert Institute. These are intended as landing-spots where nomads and travelers can find likeminded poeple and explore new regions, learning and teaching as they go. Each outpost will be set up as a hub for permaculture, mutual-aid, and sustainable, off-grid infrastructure. 

---

<div markdown="0">

{% assign sorted_pages = site.pages | sort: "order" %}

{% for page in sorted_pages %}
  {% if page.path contains "outposts/" and page.path != "outposts/index.md" %}
    <h2><a href="{{ page.url }}">{{ page.title }}</a></h2>
    {% if page.status %}<p><em>Status:</em> {{ page.status }}</p>{% endif %}
    {% if page.location %}<p><em>Location:</em> {{ page.location }}</p>{% endif %}
    {% if page.blurb %}<p>{{ page.blurb }}</p>{% endif %}
    <hr>
  {% endif %}
{% endfor %}

</div>
