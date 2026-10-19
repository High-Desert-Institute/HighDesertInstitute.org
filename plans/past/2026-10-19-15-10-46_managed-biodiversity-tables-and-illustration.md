---
plan_id: 2026-10-19-15-10-46_managed-biodiversity-tables-and-illustration
title: Fix MANAGED BIODIVERSITY tables and add illustration
summary: Apply existing Bootstrap table styling and display the supplied BLOOM CASTER illustration.
status: past
created_at: 2026-10-19-15-10-46
---

# Fix project tables and illustration

Key: `[ ]` pending task, `[x]` completed task, `[?]` needs validation, `[-]` closed task

Directly authorized by the user's request. Follow task execution and debugging playbooks. Scope: project index, contributor README, existing illustration reference, and plan/index records; no global CSS changes.

## Evidence and diagnosis

Expected: padded, bordered tables consistent with the site's Bootstrap theme. Reported: table CSS does not work. Source inspection shows two plain Markdown tables without Bootstrap's opt-in `table` class. The default layout loads Bootstrap, so a missing stylesheet is less likely. Markdown parsing could also fail, but both source tables have valid headers and separators. The smallest robust fix is explicit HTML tables with Bootstrap classes and responsive wrappers, preserving all cells and links.

- [x] 1. Convert both public-page tables to semantic HTML with Bootstrap table classes, column/row header scopes, captions, and responsive wrappers.
- [x] 2. Add `/assets/images/bloom-caster-1.png` above the opening mission heading with accurate alt text and responsive dimensions, preserving the supplied asset.
- [x] 3. Update the contributor README with the table styling cause/fix and illustration guidance.
- [x] 4. Verify table structure, all six candidate URLs, image reference/dimensions, and diff formatting; archive this plan and regenerate indexes.

No root README or framework policy changes are needed. A full Jekyll/browser rendering check depends on available tools; report validation limits. The user approved journal logging, committing all current changes, and pushing on 2026-10-19.

## Verification outcome

- [x] 5. Direct user follow-up: add the supplied `bloom-caster-2.png` immediately below the design-candidates table, with responsive sizing, accurate alt text, and README placement guidance. Verify asset dimensions and placement.

HTML structure, table classes, row counts, six model/profile links, illustration placement and intrinsic dimensions passed source checks. No Ruby/Bundler executable was available for a full Jekyll build; visual browser rendering remains unverified. Diff formatting checked.

- [x] 6. User-requested terminology update: use biodiversity pellets throughout current project copy, image alt text, contributor guidance, and guild listing in place of DIVERSITY UNIT(S). Keep ammunition in the contributor avoid-list as an explicit discouraged term. Verify no old pellet names remain in those pages.

- [x] 7. User-approved all-changes checkpoint: include existing Desert Crops changes governed by `plans/past/2026-09-07-18-12-41_fix-desert-crops-table-and-resilience.md`, the supplied Artificers and Floramancers stylized illustrations, both BLOOM CASTER illustrations, and this checkpoint journal record. Review complete diff and commit/push all current files.
