---
name: git-branch
description: "Choose and create a Git branch name from the user's planned changes. Use when asked to name a branch, start work on a change, or create a feature, fix, documentation, refactoring, test, or maintenance branch."
argument-hint: "[planned change]"
---

# Create a Git Branch

Determine a clear branch name from the user's description of planned changes, then create the branch only after the user confirms the proposed name.

## Workflow

1. Understand the planned change from the user's description. If the goal is too vague to classify or summarize, ask a focused clarifying question instead of guessing.

2. Choose a short type prefix that describes the primary purpose:

   | Change | Prefix |
   | --- | --- |
   | New feature | `feat/` |
   | Bug fix | `fix/` |
   | Documentation | `docs/` |
   | Refactoring | `refactor/` |
   | Tests | `test/` |
   | Build or dependency work | `build/` |
   | CI or automation | `ci/` |
   | Performance improvement | `perf/` |
   | Other maintenance | `chore/` |

   When several categories apply, use the one that best captures the main purpose. Do not invent an issue number; include one only if the user provides it or it is clearly associated with the work.

3. Create a concise English summary slug from the planned change. Use lowercase kebab-case with ASCII letters and digits, for example `feat/add-csv-export` or `fix/handle-empty-response`. For a description written in another language, translate its meaning rather than transliterating it mechanically. Omit punctuation and filler words.

4. Inspect the repository and Git state before creating anything:
   - Confirm the repository root and current branch.
   - Review `git status --short` and preserve all existing work. Do not stage, commit, stash, reset, or discard changes.
   - Check whether the proposed name already exists locally or as a remote-tracking branch. If it exists, choose a distinct name or ask the user; never switch to an existing branch as if a new one had been created.
   - Validate the candidate with `git check-ref-format --branch <name>`.

5. Present the proposed branch name and the current branch it will be based on. Mention any existing uncommitted changes and explain that they will remain in the working tree. Ask for explicit confirmation before creating the branch.

6. After confirmation, create and switch to the branch with `git switch -c <name>`. Do not push the branch unless the user separately asks.

7. Verify the result with `git branch --show-current` and report the created branch name. If the command fails, report the error and do not claim success.

## Naming rules

- Use `<type>/<short-description>`; include an issue number only when known, such as `feat/123-add-csv-export`.
- Keep names descriptive, focused, and concise. Avoid dates, usernames, vague names such as `updates`, and unrelated tasks in one branch name.
- Do not alter the user's planned scope to make the name fit a category. Ask if the purpose is unclear.
- Never create, rename, delete, or switch branches without the user's explicit confirmation.