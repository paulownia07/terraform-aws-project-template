---
description: "Use when writing or editing Markdown files. Follow this project's Prettier formatting and markdownlint checks configured in the Dev Container."
applyTo: "**/*.md"
---

# Markdown Conventions

Follow the Markdown tooling configured in `.devcontainer/devcontainer.json`:

- Use Prettier (`esbenp.prettier-vscode`) as the Markdown formatter. Formatting runs on save.
- markdownlint runs on save. Resolve its reported violations rather than disabling rules or suppressing warnings without a specific reason.
- There is no repository-specific Prettier or markdownlint configuration, so do not add undocumented project-specific formatting constraints; use the tools' defaults.

When writing Markdown:

- Use a clear heading hierarchy and do not skip heading levels.
- Separate headings, paragraphs, lists, tables, and fenced code blocks with blank lines.
- Use fenced code blocks and specify the language when it is known.
- Use descriptive link text and keep lists and tables readable.
- Let Prettier format the document; avoid manual alignment or wrapping that conflicts with its output.
