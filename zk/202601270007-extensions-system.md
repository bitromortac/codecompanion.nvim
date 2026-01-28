# Extensions Expand Functionality

The Extensions System provides a structured way to expand CodeCompanion's functionality
without modifying the core codebase. It allows for modular additions that can be
registered and managed dynamically.

## Mechanism

Extensions are Lua modules that adhere to a specific contract:
1. **Setup Function:** A `setup(opts)` method to initialize the extension with
   user configuration.
2. **Exports:** An optional `exports` table to expose public API methods via
   `codecompanion.extensions.<name>`.

## Management

The `Extension Manager` handles the lifecycle of extensions:
- **Resolution:** Locates extensions from the runtime path or local configuration.
- **Registration:** Validates and loads the extension.
- **Access:** Provides a unified interface to access exported functions from all
  loaded extensions.

Tags: #extensions #modularity #plugins #architecture

## References
- Is a component of: [[202601270000-Codecompanion-architecture-overview.md]]

## Backlinks
- [[202601270000-Codecompanion-architecture-overview.md]]
