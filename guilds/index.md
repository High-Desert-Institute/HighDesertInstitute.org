---
layout: nocontainer
title: Guilds
---



<div class="container">
  <div class="row">
    <div class="col">
      <h1><a href="/">High Desert Institute</a></h1>
      <h2><a href="/guilds">Guilds</a></h2>
      <p>Guilds are groups within the High Desert Institute that focus on particular topics or aspects of community development. These are semi-atonomous organizations which start out as ad-hoc committees with a degree of self-governance ability including their own budget and fundraising ability, plus broad authority to decide how their projects happen, including spending. The goal is that these guilds will grow beyond the High Desert Institute, and eventually take on a life of their own, all over the world.</p>
      <hr>

    </div><!--/col-->
  </div><!--/row-->

  <div class="row" markdown="0">

{% assign sorted_pages = site.pages | sort: "order" %}
{% for page in sorted_pages %}
  {% assign path_parts = page.path | split: "/" %}
  {% if path_parts[0] == "guilds" and path_parts.size == 3 %}
    <div class="col-md-4">
    {% if page.thumbnail %}
      <img src="{{ page.thumbnail }}" alt="{{ page.title }} image" class="photo">
    {% endif %}
      <h3><a href="{{ page.url }}">{{ page.title }}</a></h3>
      {% if page.blurb %}<p>{{ page.blurb }}</p>{% endif %}
    </div><!--/col-md-4-->
  {% endif %}
{% endfor %}

  </div><!--/row-->
  <div class="row">
    <div class="col">
      [← Back to Home](/)
    </div><!--/col-->
  </div><!--/row---->
</div><!--/container-->
