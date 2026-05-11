---
plan_id: 2026-05-11-13-59-25_add-biblioteca-noetica-project-and-library-link
title: Add Biblioteca Noetica project, repository submodule, and Library software stack link
summary: Create a new Lorekeepers project page for Biblioteca Noetica, attach its repository as a submodule, and link it from The Library software stack section.
status: current
created_at: 2026-05-11-13-59-25
---

# Add Biblioteca Noetica project, repository submodule, and Library software stack link

Key: `[ ]` pending task, `[x]` completed task, `[?]` needs validation, `[-]` closed task

- [x] 1. Establish execution baseline for new project addition.
  - [x] 1.1 Validate no conflicting Biblioteca Noetica project path or submodule path exists.
  - [x] 1.2 Confirm target guild mapping for automatic project listing behavior.

- [x] 2. Add Biblioteca Noetica as a top-level project under Lorekeepers.
  - [x] 2.1 Create `projects/biblioteca-noetica/index.md` with valid project frontmatter.
  - [x] 2.2 Add initial project body content and external repository link metadata.

- [x] 3. Attach Biblioteca Noetica repository as the project submodule.
  - [x] 3.1 Add submodule at `projects/biblioteca-noetica/repository` for `https://github.com/High-Desert-Institute/biblioteca-noetica`.
  - [x] 3.2 Initialize and verify submodule registration in `.gitmodules` and git status.

- [x] 4. Update Library project software stack references.
  - [x] 4.1 Add a software stack bullet in `projects/library/index.md` linking to `/projects/biblioteca-noetica/`.

- [x] 5. Verify outcomes and synchronize plan indexes.
  - [x] 5.1 Run plan index regeneration after plan lifecycle updates.
  - [x] 5.2 Verify changed files and link placement for expected behavior.

- [x] 6. Align project index content with submodule reality.
  - [x] 6.1 Inspect `projects/biblioteca-noetica/repository` top-level contents and README.
  - [x] 6.2 Update `projects/biblioteca-noetica/index.md` summary/body to match the repository's current scope and structure.
