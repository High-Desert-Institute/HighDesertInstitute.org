---
layout: default
title: Blog and Updates
---

## Blog Posts and Updates:

<div markdown="0">

{% assign blog_pages = site.pages | sort: "date" | reverse %}

{% for page in blog_pages %}
  {% if page.path contains "blog/" and page.path != "blog/index.md" %}
    <p>
      <a href="{{ page.url }}">{{ page.title }}</a><br>
      <small><em>{{ page.date | date: "%B %d, %Y" }}</em></small>
    </p>
  {% endif %}
{% endfor %}

</div>

[← Back to Home](/)
