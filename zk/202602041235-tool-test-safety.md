# Tool Test Safety Patterns

Safeguards implemented in the test suite to ensure stability, cost control, and
environment integrity.

## Defensive Mocking
To prevent flaky tests and accidental API usage (cost), the test helper explicitly
mocks external providers. For example, `setup_plugin` injects a mock for the
Copilot adapter to ensure no HTTP requests leak out during the test run, which
could otherwise cause CI failures or incur costs.

## Cross-Platform Gating
Tests that rely on OS-specific shell behavior (like `cmd_runner`) utilize
conditional logic to skip execution on incompatible platforms.
- **Pattern:** `if vim.fn.has("win32") == 0 then MiniTest.skip(...) end`
- **Purpose:** Ensures the test suite remains green on Linux CI runners while
  still verifying Windows-specific edge cases (e.g., pipe handling).

## Filesystem Sandboxing
Tests for file-manipulation tools (like `read_file`, `create_file`) explicitly
setup temporary directories (e.g., `_G.TEST_CWD`) in the `pre_case` hook and
delete them in `post_case`. This prevents test pollution and data loss in the
developer's actual workspace.

Tags: #testing #safety #ci-cd

## References
- Complements: [[202602041230-testing-strategy-for-tools.md]]
