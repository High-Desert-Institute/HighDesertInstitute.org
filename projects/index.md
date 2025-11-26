---
layout: default
title: "Projects"
---

<h1>Projects</h1>

<ul>
  {% assign project_readmes = site.pages | where_exp: "item", "item.path contains 'projects/'" %}
  {% assign project_readmes = project_readmes | where_exp: "item", "item.path contains '/README.md'" %}
  {% assign project_indexes = site.pages | where_exp: "item", "item.path contains 'projects/'" %}
  {% assign project_indexes = project_indexes | where_exp: "item", "item.path contains '/index.md'" %}
  {% assign project_indexes = project_indexes | where_exp: "item", "item.path != 'projects/index.md'" %}
  {% assign projects = project_readmes | concat: project_indexes | uniq %}
  {% for project in projects %}
    {% if project.path != 'projects/index.md' %}
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
    {% endif %}
  {% endfor %}
</ul>
