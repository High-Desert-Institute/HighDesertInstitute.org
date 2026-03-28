# Playbook: Migrate Host Repo to Upstream `agents` Framework

This playbook migrates a host repository that currently has a local `agents/` folder into the upstream submodule-based framework model.

This playbook is idempotent:
- It checks for existing directories/files before creating or copying.
- It preserves host custom files and only adds missing upstream defaults.
- It avoids re-adding an already-configured `agents` submodule.

## Inputs required

- `upstream_repo_url`: Git URL for upstream framework repo.
- `submodule_path`: Target submodule path (default `agents`).

## Steps

1. **Capture baseline**
   - Record `git status --short`.
   - Record current tree for `agents/`.
   - Verify the repository root.

2. **Create host runtime directories if missing**
   - `playbooks/`, `references/`, `templates/`, `scripts/`
   - `plans/future/`, `plans/current/`, `plans/past/`
   - `journal/`
   - `kanban/`
   - `downtime/reports/pending/`, `downtime/reports/reviewed/`

3. **Preserve current host playbooks**
   - Copy `agents/playbooks/*.md` into root `playbooks/` only when destination file is missing.
   - Do not overwrite existing host files.

4. **Convert `agents/` to submodule safely**
   - If `agents` is already a submodule, skip conversion.
   - If `agents` is a normal directory, remove it only after Step 3 succeeds.
   - Add submodule:
     - `git submodule add <upstream_repo_url> <submodule_path>`
   - Initialize:
     - `git submodule update --init --recursive <submodule_path>`

5. **Bootstrap host shim files**
   - Ensure root shim files exist and point runtimes to `./agents/RULES.md`:
     - `AGENTS.md`, `CODEX.md`, `CLAUDE.md`, `GEMINI.md`, `OPENCODE.md`
   - Shim behavior must state:
     - use host-managed `./playbooks`, `./references`, `./templates`, `./scripts` first
     - fall back to `./agents/...` when missing

6. **Copy upstream framework defaults into host-managed directories**
   - For each of `playbooks`, `references`, `templates`, `scripts`:
     - Copy missing files from `./agents/<dir>/` into `./<dir>/`.
     - Do not blindly overwrite host-custom files.
   - If overwrite decisions are required, stop and ask user.

7. **Run verification**
   - `python agents/scripts/regenerate_plan_indexes.py --check --repo-root .`
   - Check that `agents` appears in `.gitmodules`.
   - Confirm host-managed directories exist.
   - Confirm shim files point to `./agents/RULES.md`.

8. **Finalize**
   - Summarize created directories, copied files, and any unresolved merge choices.
   - Suggest a checkpoint commit message.
