# Playbook: Add Project Repository Submodule

This playbook describes the standard procedure for attaching a code/design repository to an existing project by adding it as a git submodule at:

- `projects/<project_slug>/repository/`

This is a common site pattern and keeps each project page and its canonical repo linked together.

This playbook is written to be safe to run multiple times: it avoids duplicating `.gitmodules` entries and avoids re-adding an existing submodule.

## Inputs required

- `project_slug`: The existing project folder name (e.g. `hacking-weather-satellite-uplink`).
- `repo_url`: The git URL for the project repository (e.g. `https://github.com/org/repo`).

## Steps

### 1) Confirm the project exists

- Verify `projects/<project_slug>/index.md` exists.
- If it does not exist, stop: this playbook only applies to existing projects.

### 2) Decide the destination path

- Destination path (standard):
  - `projects/<project_slug>/repository`

Idempotency check:
- If that path already exists, determine which case applies:
  - If it is already a git submodule, do not try to add it again.
  - If it is a normal directory (not a submodule), stop and ask for guidance (converting a normal directory into a submodule is a separate, higher-risk operation).

### 3) Check for an existing submodule entry

Inspect `.gitmodules`:

- If there is already an entry for `projects/<project_slug>/repository`, verify its `url` matches `repo_url`.
  - If it matches: nothing to do (already configured).
  - If it differs: stop and ask for guidance (changing submodule URLs can be disruptive if other contributors have clones).

### 4) Add the submodule

From the repository root:

- Run:
  - `git submodule add <repo_url> projects/<project_slug>/repository`

Notes:
- This creates/updates `.gitmodules` and writes the gitlink for the submodule at that path.
- If the command fails due to network restrictions, do not partially improvise a fake submodule by hand. Capture the error and ask the user to run the command locally (or grant access), then continue from Step 5.

### 5) Initialize/sync (if needed)

If the submodule exists but is not initialized in the working tree:

- Run:
  - `git submodule update --init --recursive projects/<project_slug>/repository`

If a URL was changed intentionally (rare):

- Run:
  - `git submodule sync --recursive`

### 6) Verify and finish

- Confirm `projects/<project_slug>/repository/` contains the expected repository content.
- Confirm `.gitmodules` contains exactly one entry for the submodule path.
- Ensure `git status` shows:
  - `.gitmodules` changed (when newly added), and
  - the submodule gitlink recorded (as a path change under `projects/<project_slug>/repository`).

