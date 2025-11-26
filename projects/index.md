---
layout: default
title: "Projects"
---

<h1>Projects</h1>

<ul>
  {% assign projects = site.pages 
    | where_exp: "item", "item.path contains 'projects/' and (item.path contains '/README.md' or item.path contains '/readme.md')" %}
  {% for project in projects %}
    <li>
      <a href="{{ project.url }}">{{ project.title | default: project.url }}</a>
      {% if project.guilds %}
        — Guilds:
        {% for guild_slug in project.guilds %}
          {% assign guild_page = site.pages | where: "guild_id", guild_slug | first %}
          {% if guild_page %}
            <a href="{{ guild_page.url }}">{{ guild_page.title }}</a>{% unless forloop.last %}, {% endunless %}
          {% else %}
            {{ guild_slug }}{% unless forloop.last %}, {% endunless %}
          {% endif %}
        {% endfor %}
      {% endif %}
    </li>
  {% endfor %}
</ul>
