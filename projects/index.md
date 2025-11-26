---
layout: default
title: "Projects"
---

<h1>Projects</h1>

{% assign project_readmes = '' | split: '' %}
{% for item in site.pages %}
  {% if item.path contains 'projects/' and item.path contains '/README.md' %}
    {% assign path_parts = item.path | split: '/' %}
    {% if path_parts.size == 3 %}
      {% assign project_readmes = project_readmes | push: item %}
    {% endif %}
  {% endif %}
{% endfor %}

{% assign project_rows = '' | split: '' %}
{% for project in project_readmes %}
  {% if project.path != 'projects/index.md' %}
    {% assign primary_guild_slug = project.guilds | first %}
    {% assign guild_page = site.pages | where: 'guild_id', primary_guild_slug | first %}
    {% if guild_page %}
      {% assign guild_sort_key = guild_page.title %}
    {% elsif primary_guild_slug %}
      {% assign guild_sort_key = primary_guild_slug %}
    {% else %}
      {% assign guild_sort_key = 'zzz' %}
    {% endif %}
    {% capture row %}{{ guild_sort_key | downcase }}::{{ project.title | downcase | default: project.url }}::{{ project.path }}{% endcapture %}
    {% assign project_rows = project_rows | push: row %}
  {% endif %}
{% endfor %}
{% assign project_rows = project_rows | sort %}

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
      {% for row in project_rows %}
        {% assign parts = row | split: '::' %}
        {% assign row_path = parts[2] | default: parts[1] %}
        {% assign project = site.pages | where: 'path', row_path | first %}
        {% if project %}
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
            {% elsif project.blurb %}
              {{ project.blurb }}
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
