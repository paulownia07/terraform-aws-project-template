---
name: git-issue
description: "Create a GitHub Issue using this repository's Issue Form templates. Use when asked to create, draft, or file a bug report, feature request, documentation, question, refactoring, security, task, or test issue."
argument-hint: "[issue type and request details]"
---

# Create a GitHub Issue

Create an issue that follows one of the repository's forms in `.github/ISSUE_TEMPLATE/`.

## Workflow

1. Identify the requested outcome and choose the closest matching form:

   | Issue type | Template |
   | --- | --- |
   | Bug report | `bug_report.yml` |
   | Documentation | `documentation.yml` |
   | Feature request | `feature_request.yml` |
   | Question | `question.yml` |
   | Refactoring | `refactoring.yml` |
   | Security report | `security.yml` |
   | Task | `task.yml` |
   | Test | `test.yml` |

   If the issue type is ambiguous, ask the user which type to use. Do not combine unrelated requests into one issue.

2. Read the selected template and use its current field labels, required fields, and title prefix. Do not rely on a hard-coded copy if the form has changed.

3. Gather any missing information needed for required fields. Ask focused questions; do not invent reproduction steps, expected behavior, versions, or other facts. Keep optional sections only when relevant.

4. Draft a concise title and a Markdown body that mirrors the selected form's fields. Preserve the user's intent, remove empty sections, and do not add unsupported claims. For example, a bug report body should include `Bug description`, `Steps to reproduce`, and `Expected behavior`.

5. Check that the GitHub CLI (`gh`) is installed, authentication is available (`gh auth status`), and the current repository is the intended target. If the target repository is unclear, ask the user; do not publish to a guessed repository.

6. Check for likely duplicates using the title and key terms, for example with `gh issue list --repo OWNER/REPO --search "KEY TERMS"`. If a likely duplicate exists, show it to the user and ask whether to continue.

7. Show the proposed issue type, target repository, title, and complete body to the user. Ask for explicit confirmation before creating the issue.

8. After confirmation, create the issue with `gh issue create --repo OWNER/REPO --title "..." --body-file PATH`. Use a temporary body file for multiline content, quote shell arguments, and remove only the temporary file you created. Never use `eval` or put credentials in a command.

9. Report the resulting issue URL. If creation fails, report the error and do not claim success.

## Security reports

Do not publish vulnerability details, exploit steps, credentials, or other sensitive information in a public issue. For a security report, check whether the repository offers private vulnerability reporting or another private contact path and direct the user there. Do not use `gh issue create` for a security report unless the user explicitly confirms that the content is safe for public disclosure and intends to open a public issue.

## Issue form fields

Use the selected YAML form as the source of truth. Current forms require the following fields:

- **Bug report**: Bug description, Steps to reproduce, Expected behavior. Environment is optional.
- **Documentation**: Documentation location, Issue or suggested improvement. Additional context is optional.
- **Feature request**: Problem or need, Proposed solution. Alternatives considered and Additional context are optional.
- **Question**: Question. Context is optional.
- **Refactoring**: Area to refactor, Motivation. Proposed approach and Acceptance criteria are optional.
- **Security report**: Summary and Potential impact. Affected versions or components are optional; follow the private-disclosure rules above.
- **Task**: Task. Scope and Acceptance criteria are optional.
- **Test**: Area to test, Testing gap. Proposed tests are optional.