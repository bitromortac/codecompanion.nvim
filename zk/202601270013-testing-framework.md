# Mini.Test Drives QA

The project utilizes `Mini.Test` (part of `mini.nvim`) as its primary testing
framework, emphasizing a headless, automated testing strategy.

## Testing Infrastructure

1. **Orchestration:** The `Makefile` serves as the entry point for running
   tests.
   - `make test`: Runs the full test suite.
   - `make test_file FILE=...`: Runs a specific test file. This is preferred
     over running `make test` as it is much faster.
2. **Environment:** A `minimal_init.lua` script sets up a clean, isolated Neovim
   environment.
   - Manages dependencies (`mini.nvim`, `plenary.nvim`, `nvim-treesitter`).
   - Configures Tree-sitter parsers required for the plugin.
3. **Execution:** Tests are executed via `nvim --headless`, ensuring they run
   without a UI, which is essential for CI/CD pipelines.

## Dependencies

- **Mini.Test:** The test runner and assertion library.
- **Plenary:** Likely used for async testing or utility functions common in Neovim plugins.
- **Tree-sitter:** Required for syntax-aware features tested within the plugin.

Tags: #testing #quality-assurance #ci-cd #neovim-plugin

## References
- Is a standard defined in: [[202601270001-coding-standards.md]]
- Uses infrastructure from: [[202601270000-Codecompanion-architecture-overview.md]]

## Backlinks
- [[202601270000-Codecompanion-architecture-overview.md]]
