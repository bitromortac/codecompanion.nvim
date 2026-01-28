# Prompt Library Manages Strategies

The Prompt Library is a system for managing and executing reusable LLM prompts.
It allows users to define complex prompt strategies and access them quickly via
the Action Palette or Slash Commands.

## Structure

Prompts are typically defined in Lua or Markdown configuration. They include:
- **Strategy:** How the prompt should be processed (e.g., "chat", "inline", "append").
- **Description:** A human-readable explanation of what the prompt does.
- **Prompts:** The actual text content sent to the LLM, which can include roles
  (System, User) and variable placeholders.
- **Conditions:** Logic to determine when the prompt is applicable (e.g., only
  in visual mode).

## Purpose

The library transforms repetitive tasks (like "Explain this code" or "Generate
Unit Tests") into one-click actions. It separates the "prompt engineering" from
the daily workflow, allowing users to curate high-quality prompts once and use
them repeatedly.

Tags: #prompts #productivity #workflow

## References
- Accessed via: [[202601270005-action-palette.md]]
- Is a component of: [[202601270000-Codecompanion-architecture-overview.md]]

## Backlinks
- [[202601270000-Codecompanion-architecture-overview.md]]
- [[202601270005-action-palette.md]]
