# HighDesertInstitute.org
Our public website


The idea is that anyone can submit edits or updates or new pages related to the projects they're working on. And then the website can become a shared repository of all the projects we are working on, where we can all help each other and anyone in the world can contribute to the work.

This website is live at [highdesertinstitute.org](https://highdesertinstitute.org)!


## Some notes on how Jekyll works and how to edit pages...

For any directory in this repository, there should be an index.md. This file can be [edited as markdown](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax). You can preview your changes in the preview tab, or edit the file locally on your machine before submitting a pull request. A member of the team will then review and approve your changes before they go live on the main public site.

There should also be a readme.md which contains devops details such as what you're reading now. This information is not necessary of helpful on the public website; only for people who are editing the public website.

If you would like to help with the process of reviewing pull requests, please reach out to CJ in the DevOps channel of the discord.

## IMPORTANT: Scope of Work

In general, changes to the home page, global css files, and the pages that list sub-pages (/blog, /outposts, /guilds, etc) are off limits unless there is some compelling reason to change them. It's important to maintain a consistent look and feel across the site. Think of these as the root scope; the board's section of the website. 

If you are working on a guild or one of it's projects, feel free to make any changes the guild wants to the pages in its section of the website. It's fine to use a different template or layout for your pages if that's what your group agrees to. Remember that you need to discuss changes with your project colleagues before requesting to make them.

If you are part of a Cyberpony Express Node site, feel free to edit or create subpages within the directory for that site. Remember that you need to discuss changes with the other people working on that site before requesting to make them.

No matter what scope you're working under, other people are working there too. Any changes need to be socialized and consensus built with your colleageues before the changes are made. This doesn't mean you need an internal review of every tweak and change, but no one who's working with you on your project should be surprised to hear that you've submitted a pull request.

The exception to these rules is for any factual errors or inconsistencies. If you notice something that is incorrect, please request to change it. Make sure to include details about what the error is and why you think it should be changed. If you are not sure if something is correct, please ask in the DevOps channel of the discord or wherever appropriate.


## Recommended Editing Setup

- Download github desktop for free. This allows you to stage your changes and submit them all at once.
- Download vs code to edit the pages. This has good integration for copilot which will help a lot for debugging and completions.

TODO put together a good self-hosted, open-source alternative set of recommendations running completions with something like QwQ-32b instead.


## Guilds and Projects (how they work, and how to add new ones)

This site is designed so guilds and project teams can update their own pages without needing to edit global site plumbing. Most of the “index” pages (like `/guilds/` and `/projects/`) automatically discover entries by scanning the repository for pages in the right folder structure.

The short version:

- A **guild** is a lightweight “org unit” page under `guilds/<guild-slug>/index.md`.
- A **project** is a page under `projects/<project-slug>/index.md`.
- Projects are linked to guilds via a simple front-matter field: `guilds: [<guild-slug>, ...]`.
- Project repositories should be added as **git submodules** under `projects/<project-slug>/repository/` so anyone (and any agent) can clone this whole org with full context.

### How guild pages work

Guilds are discovered by `guilds/index.md` using the path shape:

- Included in the guild list if the page path is `guilds/<slug>/index.md` (exactly 3 path parts).

Guild pages typically use the `guild` layout (`_layouts/guild.html`). That layout renders the page content, then automatically lists the projects that declare they belong to the guild.

#### What Jekyll expects for a guild

Create:

- `guilds/<guild-slug>/index.md`

Recommended front matter (example):

```yaml
---
layout: guild
title: "My Guild Name"
guild_id: my-guild-slug
blurb: "Short description shown on /guilds"
thumbnail: /assets/images/my-guild.jpg
---
```

Fields used by the site:

- `layout: guild` is what enables the “Current Projects in this Guild” section.
- `guild_id` is the canonical slug. This is what projects reference.
- `title` is what gets displayed in lists and badges.
- `blurb` is shown on `/guilds/`.
- `thumbnail` is optional, shown on `/guilds/`.

#### How guild → projects linking works

`_layouts/guild.html` collects all pages under `projects/` and filters them to those whose front matter contains the guild slug:

- `p.guilds contains page.guild_id`

So the guild page doesn’t need to manually maintain a list of projects as long as each project sets `guilds:` correctly.

### How project pages work

Projects are discovered by `projects/index.md` using the path shape:

- Included in the projects table if the page path is `projects/<slug>/index.md` (exactly 3 path parts).
- There’s also a fallback: if `projects/<slug>/index.md` doesn’t exist, it will look for `projects/<slug>/README.md`.

Projects typically use the `project` layout (`_layouts/project.html`). That layout renders the project title + optional primary link + summary, then shows the page content.

#### What Jekyll expects for a project

Create:

- `projects/<project-slug>/index.md`

Recommended front matter (example):

```yaml
---
layout: project
title: "My Project"
slug: my-project
guilds:
	- my-guild-slug
summary: >-
	A short summary shown on /projects and at the top of the project page.
link: "https://github.com/ORG/REPO" # optional (makes the title link out)
links: # optional (adds extra links in the /projects table)
	Repo: "https://github.com/ORG/REPO"
	Docs: "https://example.com"
---
```

Fields used by the site:

- `title` is displayed everywhere.
- `summary` (or `blurb`) is shown in the `/projects/` table and also rendered near the top of the project page.
- `guilds` is used to:
	- display badges/links on `/projects/`
	- include the project in a guild page’s “Current Projects” list
- `link` (optional):
	- on `/projects/`, the project name points to `link` instead of the internal page
	- on the project page, the header becomes clickable and a “Visit Project Site” button appears
- `links` (optional): additional labeled URLs shown in the `/projects/` table.

### Adding a project repository as a submodule (recommended)

If a project has its own code repository, include it here as a git submodule:

- `projects/<project-slug>/repository/`

Why this matters:

- Contributors can clone this website repo *once* with `--recurse-submodules` and have a complete working set.
- Agents and tooling get full “organization context” across all projects without needing to guess which repos are relevant.
- The website can link directly to `./repository/README.md` (many projects already do).

There are helper scripts (`rollup.bat` and `rollup.sh`) that update submodules recursively and create a single commit when submodule pointers change.

### Quick checklist (copy/paste)

**New guild**

- [ ] Create `guilds/<guild-slug>/index.md`
- [ ] Set `layout: guild`, `title`, and `guild_id: <guild-slug>`
- [ ] Add `blurb` (for `/guilds/`) and optional `thumbnail`

**New project**

- [ ] Create `projects/<project-slug>/index.md`
- [ ] Set `layout: project`, `title`, `slug`, `summary`
- [ ] Set `guilds: [<guild-slug>, ...]` to link it into the right guild page(s)
- [ ] If there’s a code repo, add it as `projects/<project-slug>/repository/` (submodule)
