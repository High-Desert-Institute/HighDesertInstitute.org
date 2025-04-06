---
layout: default
title: Outposts
---

# Outposts

These are the land projects currently being developed by the High Desert Institute. These are intended as landing-spots where nomads and travelers can find likeminded poeple and explore new regions, learning and teaching as they go. Each outpost will be set up as a hub for permaculture, mutual-aid, and sustainable, off-grid infrastructure. 

---
{% assign outposts = site.pages | where_exp: "page", "page.path contains 'outposts/' and page.path != 'outposts/index.md'" %}

<ul>
{% for page in outposts %}
  <li>
    <a href="{{ page.url }}">{{ page.title }}</a>
  </li>
{% endfor %}
</ul>
