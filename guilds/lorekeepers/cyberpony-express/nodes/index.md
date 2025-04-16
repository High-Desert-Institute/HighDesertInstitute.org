---
layout: default
title: Nodes
---

## [Lorekeepers' Guild](/guilds/lorekeepers/) - [Cyberpony Express](/guilds/lorekeepers/cyberpony-express/) - [Nodes](/guilds/lorekeepers/cyberpony-express/nodes/)

These are the official public nodes of the Cyberpony Express.  

If you'd like to donate to fund the creation of new nodes, [click here for the gofundme](https://www.gofundme.com/f/cyberpony-express-free-and-offgrid-communications).  

If you've like to host a node for free at your intentional communtiy, community garden, amateur radio club repeater site, etc, [click here for the application form](https://forms.gle/UZgQiUNzm8q1dmNfA).  

<img src="/assets/images/cyberpony-loop-2.gif" class="photo">

### Map:



### Node List:

<div markdown="0">

{% assign sorted_pages = site.pages | sort: "order" %}

{% for page in sorted_pages %}
  {% if page.path contains "guilds/lorekeepers/cyberpony-express/nodes/" and page.path != "guilds/lorekeepers/cyberpony-express/nodes/index.md" %}
    <hr>
    {% if page.thumbnail %}
      <img src="{{ page.thumbnail }}" alt="{{ page.title }} image" style="max-width: 100%; height: auto; border-radius: 8px; margin-bottom: 1rem;">
    {% endif %}
    <h2><a href="{{ page.url }}">{{ page.title }}</a></h2>
    {% if page.status %}<p><em>Status:</em> {{ page.status }}</p>{% endif %}
    {% if page.location %}<p><em>Location:</em> {{ page.location }}</p>{% endif %}
    {% if page.blurb %}<p>{{ page.blurb }}</p>{% endif %}
    {% if page.donate_link %}<a href="{{ page.donate_link }}" class="btn btn-success">Donate</a>{% endif %}
    {% if page.volunteer_link %}<a href="{{ page.volunteer_link }}" class="btn btn-primary">Volunteer</a>{% endif %}
  {% endif %}
{% endfor %}

</div>


---

[← Back to Cyberpony Express](/guilds/lorekeepers/cyberpony-express/)  
[← Back to Lorekeepers' Guild](/guilds/lorekeepers)  
[← Back to All Guilds](/guilds/)  
[← Back to Home](/)
