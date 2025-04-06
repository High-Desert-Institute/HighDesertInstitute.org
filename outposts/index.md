---
layout: default
title: Outposts
---

# Outposts

These are the land projects currently being developed by the High Desert Institute. These are intended as landing-spots where nomads and travelers can find likeminded poeple and explore new regions, learning and teaching as they go. Each outpost will be set up as a hub for permaculture, mutual-aid, and sustainable, off-grid infrastructure. 

---

{% assign outposts = site.pages 
  | where_exp: "page", "page.path contains 'outposts/' and page.path contains '/index.md'" 
  | sort: "order" %}

{% for page in outposts %}
  {% unless page.url == "/outposts/" %}
    
    <h2><a href="{{ page.url }}">{{ page.title }}</a></h2>
    <p><em>Status:</em> {{ page.status }}</p>
    <p><em>Location:</em> {{ page.location }}</p>
    <p>{{ page.blurb }}</p>
    <hr>
    
  {% endunless %}
{% endfor %}
