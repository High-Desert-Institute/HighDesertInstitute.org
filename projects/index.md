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
        <th scope="col" width="1">Links</th>
      </tr>
    </thead>
    <tbody>
      {% for row in project_rows %}
        {% assign parts = row | split: '::' %}
        {% assign row_path = parts[2] | default: parts[1] %}
        {% assign project = site.pages | where: 'path', row_path | first %}
        {% if project %}
          {% assign project_dir_link = project.dir | default: project.url %}
          {% assign repo_link = project.github_repo | default: project.repo | default: project.repository | default: project.github | default: project.repo_url %}
          {% if repo_link == nil or repo_link == '' %}
            {% if project.link and project.link contains 'github.com' %}
              {% assign repo_link = project.link %}
            {% endif %}
          {% endif %}
        <tr>
          <td class="fw-semibold">
            <a href="{{ project_dir_link }}">{{ project.title | default: project.url }}</a>
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
            {% elsif repo_link %}
              <a href="{{ repo_link }}" target="_blank" rel="noopener">GitHub</a>
            {% elsif project.link %}
              <a href="{{ project.link }}" target="_blank" rel="noopener">Learn more</a>
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
