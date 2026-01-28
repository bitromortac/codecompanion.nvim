# Coding Standards Ensure Maintainability

This note outlines the required standards for contributing code to the
CodeCompanion.nvim project. Adherence to these standards ensures maintainability,
consistency, and stability.

## Core Philosophy: Omakase

The project follows an "Omakase" philosophy ("I'll leave it up to you"). This
means:
- **Curated Features:** Features are carefully selected for stability and utility
  rather than novelty.
- **Maintainability:** Contributors must be willing to maintain their additions
  indefinitely.
- **Intentionality:** Every line of code must be understood and justifiable.
  "Vibe-coded" (blindly LLM-generated) contributions are explicitly rejected.

## Technical Requirements

### Lua Code
- **Formatting:** Strictly use `stylua` with the project's `stylua.toml`.
  - Column width: 120
  - Indentation: 2 spaces
  - Line endings: Unix
  - Quote style: AutoPreferDouble
- **Type Annotations:** Use LuaCATS annotations (see `lua/codecompanion/types.lua`)
  to ensure type safety and better LSP support.
- **Linting:** Use `lua-language-server`.

### Testing
- **Framework:** Tests are written using `Mini.Test`.
- **Coverage:** New features must include comprehensive tests, including edge
  cases.
- **Execution:** Run tests via `make test` or `nmake test` (Windows).

### Documentation
- **Tooling:** Documentation is generated using `panvimdoc`.
- **Process:** Run `make docs` to update documentation.

Tags: #standards #coding-conventions #lua #testing

## References:
- Project architecture: [[202601270000-Codecompanion-architecture-overview.md]]

## References

## Backlinks
- [[202601270000-Codecompanion-architecture-overview.md]]
- [[202601270013-testing-framework.md]]
