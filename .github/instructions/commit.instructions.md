---
description: "Use when generating Git commit messages. Require the Conventional Commits format and validate the type, optional scope, and imperative description."
---

# Commit Message Instructions

Generate commit messages that follow the [Conventional Commits 1.0.0 specification](https://www.conventionalcommits.org/en/v1.0.0/).

Use this format:

```text
<type>[optional scope][!]: <description>

[optional body]

[optional footer(s)]
```

Rules:

- Generate the commit message solely from the staged changes shown by `git diff --cached`. Ignore unstaged and untracked changes, and do not infer commit content from them or from unrelated conversation context.
- If there are no staged changes, do not generate a commit message; tell the user to stage the intended changes first.
- When staged and unstaged changes coexist, use only the staged diff to determine the message type, scope, and description.
- Use one of these types: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, or `revert`.
- Choose the type that best describes the change. Use `feat` for a new feature and `fix` for a bug fix.
- Add a concise, lowercase scope in parentheses when it clarifies the affected area, such as `feat(parser):`.
- Write a short, imperative description after the colon. Do not end it with a period.
- Keep the subject concise and describe the change, not the process used to make it.
- Add a body only when more context is needed. Separate it from the subject with a blank line.
- For a breaking change, add `!` after the type or scope and include a `BREAKING CHANGE: <description>` footer.
- Add issue references or other footers only when relevant.
- Output only the commit message, without Markdown fences or commentary.

Examples:

```text
feat(parser): add array parsing
fix(ui): correct button alignment
docs: update usage instructions
refactor: simplify data processing
feat(api)!: require authentication for all endpoints
```