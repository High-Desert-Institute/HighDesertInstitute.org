---
layout: default
title: "Projects"
---

<h1>Projects</h1>

{% assign project_slugs = '' | split: '' %}
{% for item in site.pages %}
  {% if item.path contains 'projects/' %}
    {% assign path_parts = item.path | split: '/' %}
    {% if path_parts.size == 3 %}
      {% assign slug = path_parts[1] %}
      {% unless project_slugs contains slug %}
        {% assign project_slugs = project_slugs | push: slug %}
      {% endunless %}
    {% endif %}
  {% endif %}
{% endfor %}
{% assign project_slugs = project_slugs | sort %}

{% assign project_pages = '' | split: '' %}
{% for slug in project_slugs %}
  {% assign index_path = 'projects/' | append: slug | append: '/index.md' %}
  {% assign readme_path = 'projects/' | append: slug | append: '/README.md' %}
  {% assign project_page = site.pages | where: 'path', index_path | first %}
  {% if project_page == nil %}
    {% assign project_page = site.pages | where: 'path', readme_path | first %}
  {% endif %}
  {% if project_page %}
    {% assign project_pages = project_pages | push: project_page %}
  {% endif %}
{% endfor %}

{% assign project_rows = '' | split: '' %}
{% for project in project_pages %}
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
        <th scope="col" width="1">Links</th>
      </tr>
    </thead>
    <tbody>
      {% for row in project_rows %}
        {% assign parts = row | split: '::' %}
        {% assign row_path = parts[2] | default: parts[1] %}
        {% assign project = site.pages | where: 'path', row_path | first %}
        {% if project %}
          {% if project.link %}
            {% assign project_primary_link = project.link %}
            {% assign project_link_is_external = true %}
          {% else %}
            {% assign project_primary_link = project.dir | default: project.url %}
            {% assign project_link_is_external = false %}
          {% endif %}
        <tr>
          <td class="fw-semibold">
            <a href="{{ project_primary_link }}"{% if project_link_is_external %} target="_blank" rel="noopener"{% endif %}>{{ project.title | default: project.url }}</a>
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
          <td class="text-nowrap">
            {% if project.links %}
              {% for link in project.links %}
                {% assign link_label = link[0] | default: link.label | default: 'Link' %}
                {% assign link_url = link[1] | default: link.url %}
                {% if link_url %}
                  <a href="{{ link_url }}" target="_blank" rel="noopener">{{ link_label }}</a>{% unless forloop.last %}<br>{% endunless %}
                {% endif %}
              {% endfor %}
            {% else %}
              <span class="text-muted">—</span>
            {% endif %}
          </td>
        </tr>
        {% endif %}
      {% endfor %}
    </tbody>
  </table>
</div>
