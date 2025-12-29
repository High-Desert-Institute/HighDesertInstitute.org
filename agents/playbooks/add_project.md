# Playbook: Add Project

This playbook describes the procedure for adding a new project to the High Desert Institute website.

## Inputs required

- `project_name`: The display name of the project.
- `project_slug`: A URL-friendly version of the name (kebab-case).
- `guilds`: A list of guild slugs associated with this project.
  - **Why:** All projects are owned by a particular guild; the purpose of guilds is to facilitate projects.  This link directs contributors to the groups that can help them get involved.
  - **Effect:** The project will automatically appear on the associated Guild's page under "Current Projects", and the Guild will be listed on the Project's page. This creates a bidirectional link that helps users navigate between projects and the communities that support them.
- `summary`: A brief summary of the project.
- `description`: A longer description of the project (optional, defaults to summary).
- `link`: An external link to the project repository or homepage (optional).

## Steps

1.  **Check for Existing Content**
    Search the workspace for the project name.
    - If a folder in `projects/` exists, stop and advise the user.
    - If a page exists elsewhere (e.g., in the root or a guild folder), you may need to migrate its content to the new project page and set up a redirect or delete the old page.

2.  **Create Directory**
    Create the directory: `projects/<project_slug>/`

3.  **Create Project File**
    Create the file `projects/<project_slug>/index.md` with the following content. Ensure frontmatter is valid YAML.

    ```markdown
    ---
    layout: project
    title: "<project_name>"
    slug: <project_slug>
    guilds:
      - <guild_slug>
      # Add more guilds as needed
    link: "<link>" # Optional
    summary: >-
      <summary>
    ---

    # <project_name>

    <description>
    ```

4.  **Review Associated Guild Page**
    - **Migrate Content:** Most guilds have some dummy text about future projects on their pages. If this new project is already explained there, move that text to the body of the new project page and remove it from the guild page.
    - **Verify Layout:** Ensure the guild page (`guilds/<guild_slug>/index.md`) has the following frontmatter so the project appears automatically:
      ```yaml
      layout: guild
      guild_id: <guild_slug>
      ```