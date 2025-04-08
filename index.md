---
layout: default
title: Building a Foundation for the Survival of Humanity
---

<img src="/assets/images/landscape.jpg" alt="High Desert Institute" style="max-width: 100%; height: auto; border-radius: 8px; margin-bottom: 1rem;">

# The High Desert Institute

*Building a Foundation for the Survival of Humanity*

<a href="https://www.gofundme.com/f/build-a-foundation-for-the-survival-of-humanity" class="btn btn-gofundme"><i class="fa-solid fa-hand-holding-dollar"></i> GoFundMe: Help Us Buy Land</a>
<a href="https://www.gofundme.com/f/cyberpony-express-free-and-offgrid-communications" class="btn btn-gofundme"><i class="fa-solid fa-hand-holding-dollar"></i> GoFundMe: Help Us Build the Cyberpony Express</a>

---

## What We’re Working On

<img src="/assets/images/high-ground.jpg" alt="Land Projects" style="max-width: 100%; height: auto; border-radius: 8px; margin-bottom: 1rem;">

A group of seasoned experts from the off-grid community-building world are fundraising to create a series of new land projects in the high deserts of the southwest. These outposts will be centers for permaculture and mutual aid, designed to build a foundation for the survival of humanity. These new land projects will facilitate research, development, and distribution free open-source solutions to basic human needs like housing and off-grid infrastructure.

None of us are getting paid, every dollar goes to the mission. The entire process will be completely transparent and open source. Every dollar donated means the world and makes a huge difference!

---

## The Library

<img src="/assets/images/library.jpg" alt="Library" style="max-width: 100%; height: auto; border-radius: 8px; margin-bottom: 1rem;">

HDI will publish a vast, free, open-source library containing everything we learn as well as many other sources we have collected on the topic of how to live off-grid well. This idea started as a request from one of the communities our team helped build in the past; to enable off-grid communities to host their own private internet with libraries of useful knowledge. This library will be completely free and open to anyone and everyone.

---

## [Guilds](/guilds)

<img src="/assets/images/artificers-guild.jpg" alt="Guilds" style="max-width: 100%; height: auto; border-radius: 8px; margin-bottom: 1rem;">

Guilds are groups within the High Desert Institute that focus on particular topics or aspects of community development. These are semi-atonomous organizations which start out as ad-hoc committees with a degree of self-governance ability including their own budget and fundraising ability, plus broad authority to decide how their projects happen, including spending. The goal is that these guilds will grow beyond the High Desert Institute, and eventually take on a life of their own, all over the world.


## [High Desert Outposts](/outposts)

HDI will build outposts to demonstrate all the best practices and appropriate technologies we have identified for solving human infrastructure challenges off-grid. These outposts will be open and available for the public to come see what we have learned in action.

<div markdown="0">

{% assign sorted_pages = site.pages | sort: "order" %}
{% for page in sorted_pages %}
  {% if page.path contains "outposts/" and page.path != "outposts/index.md" %}
    {% if page.thumbnail %}
      <img src="{{ page.thumbnail }}" alt="{{ page.title }} image" style="max-width: 100%; height: auto; border-radius: 8px; margin-bottom: 1rem;">
    {% endif %}
    <h3><a href="{{ page.url }}">{{ page.title }}</a></h3>
    {% if page.status %}<p><em>Status:</em> {{ page.status }}</p>{% endif %}
    {% if page.location %}<p><em>Location:</em> {{ page.location }}</p>{% endif %}
    {% if page.blurb %}<p>{{ page.blurb }}</p>{% endif %}
    {% if page.donate_link %}
      <p><a class="btn btn-primary" href="{{ page.donate_link }}">Donate Now</a></p>
    {% endif %}
    <p><a href="/outposts/">View all outposts →</a></p>
    {% break %}
  {% endif %}
{% endfor %}

</div>


## Our Previous Land Projects

*(We do have several other land projects in common, but these are the public ones...)*

### [Emberfield](https://emberfield.org)



A moneyless intentional community featured in an upcoming TV show. We cover land ownership, governance, and infrastructure for permanent off-grid living.

### [Pirates’ Cove](https://www.peoplesprojectearth.org)

A 16-acre off-grid community on Dale Hollow Lake, Tennessee. Hundreds helped build this project after a successful GoFundMe campaign in 2022.

### The Garden

The Garden was where many involved in HDI first met. It inspired our current work. Out of it came the *Radical Raccoon How-To Guide* and the dream of HDI in the southwest.

---

## [Project Leadership](/board)

<div markdown="0">

{% assign sorted_pages = site.pages | sort: "order" %}

{% for page in sorted_pages %}
  {% if page.path contains "board/" and page.path != "board/index.md" %}
    <hr>
    {% if page.thumbnail %}
      <img src="{{ page.thumbnail }}" alt="{{ page.title }} image" style="max-width: 100%; height: auto; border-radius: 8px; margin-bottom: 1rem;">
    {% endif %}
    <h2><a href="{{ page.url }}">{{ page.title }}</a></h2>
    {% if page.blurb %}<p>{{ page.blurb }}</p>{% endif %}
  {% endif %}
{% endfor %}

</div>

> "If you have a garden and a library, you have everything you need."  
> — *Cicero*


## [Blog Posts and Updates:](/blog)

<div markdown="0">

{% assign blog_pages = site.pages | sort: "date" | reverse %}

{% assign count = 0 %}
{% for page in blog_pages %}
  {% if page.path contains "blog/" and page.path != "blog/index.md" %}
    <p>
      <a href="{{ page.url }}">{{ page.title }}</a><br>
      <small><em>{{ page.date | date: "%B %d, %Y at %I:%M %p" }}</em></small>
    </p>
    {% assign count = count | plus: 1 %}
    {% if count >= 10 %}
      {% break %}
    {% endif %}
  {% endif %}
{% endfor %}

<p><a href="/blog/">View all blog posts →</a></p>

</div>
