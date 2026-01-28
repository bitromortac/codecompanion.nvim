# Configuration Customizes Behavior

The configuration system provides a flexible mechanism for users to customize
CodeCompanion's behavior, adapters, and UI.

## Structure

Configuration is primarily handled via the `setup` function in the main module.
It supports:
- **Global Options:** Settings that apply plugin-wide (e.g., log levels, language).
- **Adapter Configuration:** Specific settings for each LLM provider (API keys,
  model choices).
- **Strategy Pattern:** The configuration allows for overriding defaults at
  multiple levels (global, buffer-local, or per-interaction).

## Key Configuration Areas

- **Adapters:** Mapping of adapter names to their definitions.
- **Strategies:** Defining how certain actions (like diffs or inline edits) should
  be performed.
- **Display:** Customizing the appearance of the chat window and inline hints.

Tags: #configuration #setup #customization

## References
- Is a component of: [[202601270000-Codecompanion-architecture-overview.md]]
- Configures: [[202601270002-adapters-system.md]]

## Backlinks
- [[202601270000-Codecompanion-architecture-overview.md]]
- [[202601270002-adapters-system.md]]
