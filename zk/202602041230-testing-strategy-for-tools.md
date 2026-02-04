# Testing Strategy for Tools

The testing strategy for tools in CodeCompanion relies on `Mini.Test` and a
headless child Neovim instance to simulate the full plugin environment.

## Infrastructure
Tests are orchestrated using `tests/helpers.lua`, which provides:
- **Child Process:** `MiniTest.new_child_neovim()` creates an isolated environment.
- **Setup:** `h.setup_chat_buffer()` initializes the `CodeCompanion.Chat` and
  `CodeCompanion.Tools` objects, mocking necessary dependencies (like config).

## Testing Patterns

### 1. Core Logic Testing (`test_tools.lua`)
Tests the `Tools` class methods:
- **Resolution:** Verifies that tool definitions (Lua tables or strings) are
  correctly resolved to executable objects.
- **Parsing:** Checks if tool tags (e.g., `@{tool}`) are correctly identified
  in user messages.
- **Execution:** Simulates the tool lifecycle by passing mock tool calls and
  verifying the side effects (usually by checking global variables set by the
  mock tool).

### 2. Built-in Tool Testing
Individual tools (like `cmd_runner`, `read_file`) have their own test files in
`tests/interactions/chat/tools/builtin/`.
- **Filesystem Mocks:** These tests often set up temporary directories
  (`_G.TEST_CWD`) to perform safe file operations.
- **Output Verification:** They verify the tool's output by inspecting the chat
  buffer's last message content.

## Best Practices
- **Isolation:** Use `_G` globals sparingly, primarily to bridge data between
  the test runner and the child process.
- **Teardown:** Always clean up temporary files and buffers in the `post_case`
  hook.

## Safety & Compatibility
See [[202602041235-tool-test-safety.md]] for details on mocking and cross-platform
strategies.

Tags: #testing #tools #quality-assurance

## References
- Implements standard: [[202601270013-testing-framework.md]]
- Tests component: [[202601270010-tool-system.md]]
