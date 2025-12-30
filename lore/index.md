---
layout: default
title: Institute Lore
---

# Institute Lore

The history, context, and terminology of the High Desert Institute.

<div class="lore-list">
{% assign lore_entries = site.pages | where: "layout", "lore" %}
{% assign styleguide = lore_entries | where: "slug", "styleguide" | first %}
{% assign other_entries = lore_entries | where_exp: "item", "item.slug != 'styleguide'" | sort: "last_modified_at" | reverse %}

{% if styleguide %}
    <div class="lore-entry" style="border-bottom: 1px solid #444; margin-bottom: 2rem; padding-bottom: 1rem;">
        <h3><a href="{{ styleguide.url }}">{{ styleguide.title }}</a></h3>
        {% if styleguide.summary %}
            <p>{{ styleguide.summary }}</p>
        {% endif %}
    </div>
{% endif %}

{% for entry in other_entries %}
    <div class="lore-entry">
        <h3><a href="{{ entry.url }}">{{ entry.title }}</a></h3>
        {% if entry.summary %}
            <p>{{ entry.summary }}</p>
        {% endif %}
    </div>
{% endfor %}
</div>
