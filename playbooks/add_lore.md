# Playbook: Add Lore

This playbook describes the procedure for adding a new lore entry to the High Desert Institute website.

## Inputs required

- `title`: The title of the lore entry.
- `slug`: A URL-friendly version of the title (kebab-case).
- `summary`: A brief summary of the lore entry.
- `content`: The main body of the lore text.

## Steps

1.  **Check for Existing Content**
    Search the workspace for the lore title or slug to avoid duplicates.
    - If a folder in `lore/` exists with the same slug, stop and advise the user.

2.  **Create Directory**
    Create the directory: `lore/<slug>/`

3.  **Create Lore File**
    Create the file `lore/<slug>/index.md` with the following content. Ensure frontmatter is valid YAML.

    ```markdown
    ---
    layout: lore
    title: "<title>"
    slug: <slug>
    summary: >-
      <summary>
    ---

    # <title>

    <content>
    ```
