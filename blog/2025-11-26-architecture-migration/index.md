---
layout: default
title: "Architecture Migration: One HDI Repo To Unify Them All"
date: 2025-11-26
---

# Architecture Migration: One HDI Repo To Unify Them All

We are migrating the High Desert Institute website architecture from a loose collection of folders into a more intentional, "one repo to rule them all" structure.

The core idea is to:

* Keep **one canonical HDI website repo** as the public-facing site.
* Introduce a **standard `/projects` directory** where each project gets its own folder and index page.
* Let each project declare its **guild relationships** and other metadata in front matter.
* Automatically wire up **Guild → Projects** and **Project → Guild(s)** relationships in the UI without needing a database.

### Why we are doing this

We are doing this migration to:

* **Clarify governance boundaries** between the HDI core site, guilds, and projects.
* **Improve discoverability** so visitors can navigate cleanly from guilds to their active projects and back.
* **Standardize project metadata** (status, owners, repos, outposts, tags) for humans and agents.
* **Prepare for automation**, so future tooling can roll up project information and sync external repos into the main site in a predictable way.

## How it works

### Projects Directory Structure

We are using a standard directory structure that mirrors our other content types (like guilds and blog posts). Each project lives in its own directory under `projects/` (e.g., `projects/cyberpony-express/index.md`). These project directories are sub-modules, allowing them to be developed independently and then rolled-up into the main site.

### Project Metadata

Each project page uses the `project` layout and defines its relationship to guilds, its status, and repository links in the front matter.

```yaml
---
layout: project
title: "Cyberpony Express"
guilds:
  - lorekeepers
link: "https://github.com/High-Desert-Institute/cyberpony-express"
---
```

### Automatic Linking

We have implemented layouts that automatically link:
* **Guild Pages** scan the site for pages with `layout: project` and list those that reference the guild's ID.
* **Project Pages** link back to the guilds they belong to.

This simplifies navigation and ensures that as new projects are added, they automatically appear in the relevant guild sections.

### Future Automation

This structure prepares us for a future where we can automate roll-ups of content from external project repos into the main HDI site. We plan to use a branch-per-project pattern where changes in project repos trigger updates in the main site via pull requests, keeping the main HDI repo as the single source of truth while allowing projects to evolve independently.

This migration simplifies finding information about active projects so participants can more easily plug in and contribute.
