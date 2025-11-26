---
layout: default
title: "Projects"
---

<h1>Projects</h1>

{% assign project_readmes = site.pages | where_exp: "item", "item.path contains 'projects/'" %}
{% assign project_readmes = project_readmes | where_exp: "item", "item.path contains '/README.md'" %}
{% assign project_readmes = project_readmes | where_exp: "item", "item.path | split: '/' | size == 3" %}
{% assign project_indexes = site.pages | where_exp: "item", "item.path contains 'projects/'" %}
{% assign project_indexes = project_indexes | where_exp: "item", "item.path contains '/index.md'" %}
{% assign project_indexes = project_indexes | where_exp: "item", "item.path != 'projects/index.md'" %}
{% assign project_indexes = project_indexes | where_exp: "item", "item.path | split: '/' | size == 3" %}
{% assign projects = project_readmes | concat: project_indexes | uniq %}

<div class="table-responsive">
  <table class="table table-striped align-middle">
    <thead>
      <tr>
        <th scope="col" width="1">Project</th>
        <th scope="col" width="1">Guilds</th>
        <th scope="col">Description</th>
      </tr>
    </thead>
    <tbody>
      {% for project in projects %}
        {% if project.path != 'projects/index.md' %}
          {% assign project_link = project.link | default: project.url %}
        <tr>
          <td class="fw-semibold">
            <a href="{{ project_link }}"{% if project.link %} target="_blank" rel="noopener"{% endif %}>{{ project.title | default: project.url }}</a>
          </td>
          <td>
            {% if project.guilds %}
              {% for guild_slug in project.guilds %}
                {% assign guild_page = site.pages | where: "guild_id", guild_slug | first %}
                {% if guild_page %}
                  <a href="{{ guild_page.url }}" class="badge text-bg-secondary me-1">{{ guild_page.title }}</a>
                {% else %}
                  <span class="badge text-bg-secondary me-1">{{ guild_slug }}</span>
                {% endif %}
              {% endfor %}
            {% else %}
              <span class="text-muted">—</span>
            {% endif %}
          </td>
          <td>
            {% if project.summary %}
              {{ project.summary }}
            {% else %}
              <span class="text-muted">No summary provided.</span>
            {% endif %}
          </td>
        </tr>
        {% endif %}
      {% endfor %}
    </tbody>
  </table>
</div>
