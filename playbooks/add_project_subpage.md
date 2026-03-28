# Playbook: Add Project Subpage (and optionally split a project into subpages)

This playbook describes a safe, repeatable procedure for:

1) Adding a **new subpage** under an existing project, and
2) **Splitting** an existing long project page into multiple subpages without losing any information.

This playbook is intentionally strict about **completeness**: when reorganizing content, *nothing gets dropped*.

## Inputs required

- `project_slug`: The existing project folder name (e.g. `hacking-weather-satellite-uplink`).
- `project_display_name`: The human-readable name of the project (usually the `title` in `projects/<project_slug>/index.md`).
- `subpage_title`: The human-readable title for the new subpage (e.g. `"Robotic Yagi-Uda Feed"`).
- `subpage_slug`: A URL-friendly version of the title (kebab-case, e.g. `robotic-yagi-uda`).
- `parent_link_location`: Where the parent project should link to the subpage (e.g. a new “Implementation Examples” list/table, or a “How-To” section).
- `content_source`: Where the subpage content comes from:
  - `new`: brand new content being authored, or
  - `extracted`: content moved out of the parent project page (splitting).

## Non‑negotiables (completeness rules)

- **Do not delete information.** If you remove content from the parent page, it must appear on a subpage.
- **Do not leave orphan content.** Every new subpage must be linked from the parent project page.
- **Do not leave broken links.** Update any links that pointed to moved sections.
- **Do not leave “TODO: move later” gaps.** Reorg work is urgent *because partial reorganizations are how content gets lost*.

## Steps

### 1) Confirm the target project exists

- Verify `projects/<project_slug>/index.md` exists.
- If it does not exist, stop: this playbook is for **subpages of an existing project**, not creating a new project.

### 2) Pick a stable subpage slug and path

- Preferred path shape:
  - `projects/<project_slug>/<subpage_slug>/index.md`
- Slug rules:
  - Use `kebab-case`, all lowercase.
  - Avoid changing slugs later; links will spread.

Idempotency check:
- If `projects/<project_slug>/<subpage_slug>/` already exists, **do not create a new folder**. You are updating/finishing the existing subpage.

### 3) Create (or update) the subpage file

Create `projects/<project_slug>/<subpage_slug>/index.md` (or update it if it already exists) with valid YAML frontmatter.

Recommended minimal template:

```markdown
---
layout: default
title: "<subpage_title>"
---

# <subpage_title>

**Parent Project:** [<project_display_name>](../)

<subpage content>
```

Notes:
- Use `layout: default` for subpages unless there is a strong reason otherwise.
- Keep the parent link near the top so readers can navigate back immediately.

### 4) Link the subpage from the parent project page

Edit `projects/<project_slug>/index.md` and add exactly **one** link to the subpage in the agreed location.

Recommended link format (absolute, consistent across the site):
- `/projects/<project_slug>/<subpage_slug>/`

Idempotency check:
- Before adding a new bullet/row, search the parent page for the subpage slug/link.
- If a link already exists, **update it in place** (title text, table cells), don’t add a duplicate.

### 5) If splitting: move content without losing anything

When `content_source: extracted`:

- Copy the full section(s) from the parent page into the new subpage first.
- Only after the subpage contains the content, remove it from the parent page.
- Replace the removed content in the parent page with a short summary + a link to the new subpage.

Completeness checks (required):
- Ensure every image reference, list item, and link that was in the moved section still exists on the subpage.
- Ensure the parent page still makes sense as a “front door” (no abrupt jumps, no missing prerequisites).

### 6) Repair internal references after moving content

- Update any relative links impacted by the new directory depth.
  - From a subpage, the project root is typically `../`.
- If other pages in the repo link to the moved content, update those links too.

Quick repo-wide check:
- Search for the old heading text and any old anchor/paths that changed.

### 7) Final “nothing left out” verification (required)

Before finishing:

- Review the parent page’s reorganized section and confirm it includes a link to every subpage you created.
- Open each new subpage and confirm:
  - Title is correct
  - Parent link works
  - The page contains the promised details (no placeholders)
- Do a final search for obvious “unfinished reorg” markers like `TODO`, `TBD`, or `FIXME` in the edited files.

## Optional: Implementation Examples table pattern

If the parent project page is listing multiple implementations, a table is often the cleanest “index”.

Recommended pattern:

- Table columns:
  - `Title` (first column; bold; link to subpage)
  - `Feed type`
  - `Reflector type`
  - `Alignment mechanism`

Idempotency tip:
- Treat the table as the source of truth: one row per implementation, no duplicates.
