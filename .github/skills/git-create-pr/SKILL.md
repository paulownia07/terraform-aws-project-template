---
name: git-pr
description: "Create a GitHub Pull Request using this repository's pull request template. Use when asked to draft, create, or open a PR from the current branch."
argument-hint: "[PR goal, target branch, and related issues]"
---

# Create a Pull Request

Create a GitHub Pull Request whose body follows `.github/pull_request_template.md`.

## Workflow

1. Read `.github/pull_request_template.md` before drafting. Preserve its headings, comments, checklist items, and ordering. Replace its guidance text and placeholders with accurate information; do not substitute a generic PR description.

2. Inspect the current branch, repository, working tree, and changes relative to the intended base branch. Review both staged and unstaged diffs. Do not include unrelated work or claim changes that are not in the PR.

3. Determine the PR type from the actual changes. Select the applicable checkbox in the template's Type section and leave the other type checkboxes unchecked. If multiple types seem applicable, choose the primary purpose; explain secondary work under Changes.

4. Draft a concise title and complete body using every section in the template:
   - **Summary**: State the problem and the solution.
   - **Changes**: List the significant changes.
   - **Related Issue**: Include `Closes #N` only for issues this PR will close when merged. Mention related but non-closing issues without a closing keyword. If there is no related issue, write `None`.
   - **Testing**: List each relevant test or verification command with its actual result. Inspect the project documentation for test commands and run the relevant checks when feasible. If a command was not run, state that explicitly; never imply a check passed when it was not run.
   - **Checklist**: Preserve all checklist items and check only those that are verified as complete. Do not mark tests, documentation, linting, or formatting complete based on assumptions.

5. Check that `gh` is installed, authenticated (`gh auth status`), and targeting the intended repository. Determine the base branch from repository context or ask the user if it is unclear. Check the PR diff against the base and check for an existing PR for the current head branch to avoid duplicates.

6. If the branch has uncommitted changes, clearly distinguish those from committed changes. Do not commit, discard, or stage changes unless the user asks. A PR can include only pushed commits; do not imply uncommitted work will be included.

7. Verify whether the current branch is pushed and has the intended base. Do not push changes without the user's authorization. If publishing requires a push and the user has not authorized it, ask before pushing.

8. Present the proposed title, base branch, complete template-based body, and any test results to the user. Ask for explicit confirmation before creating the PR. If push authorization is also required, obtain it before pushing.

9. After confirmation and once the head branch is available on the remote, create the PR with `gh pr create --repo OWNER/REPO --base BASE --head HEAD --title "..." --body-file PATH`. Use a temporary body file for multiline content, quote shell arguments, and remove only the temporary file you created. Never use `eval` or put credentials in a command.

10. Report the resulting PR URL. If creation fails, report the error and do not claim success.

## Template source of truth

The current template sections, in order, are:

1. Pull Request
2. Type: Feature, Bug Fix, Refactoring, Documentation, Dependency Update, Others
3. Summary
4. Changes
5. Related Issue
6. Testing
7. Checklist:
   - I reviewed the changes and removed unrelated changes.
   - I added or updated relevant tests and ran them.
   - I updated the documentation where needed.
   - I ran the relevant linting and formatting checks.

Always reread the template and follow its actual current content if it changes.