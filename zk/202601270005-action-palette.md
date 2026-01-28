# Action Palette Unifies Commands

The Action Palette is a central hub for executing pre-defined or context-aware
actions within CodeCompanion. It unifies static commands and dynamic prompts into
a single selectable list.

## Functionality

1. **Aggregation:** It collects actions from multiple sources:
   - **Static Actions:** Hardcoded commands like "Open Chat" or "Toggle Inline".
   - **Prompt Library:** User-defined or built-in prompts stored as Markdown files.
2. **Validation:** It filters available actions based on the current context
   (e.g., current mode, file type, or selection) to ensure only relevant options
   are shown.
3. **Execution:** It handles the resolution and execution of the selected action,
   whether it's a Lua function or a prompt sent to the LLM.

## Architecture

The system uses a caching mechanism to store resolved actions and a validation
layer to filter them dynamically at runtime. It serves as a discovery mechanism
for the user to find capabilities without memorizing commands.

Tags: #actions #ui #ux #workflow

## References
- Is a component of: [[202601270000-Codecompanion-architecture-overview.md]]
- Uses prompts from: [[202601270006-prompt-library.md]]

## Backlinks
- [[202601270000-Codecompanion-architecture-overview.md]]
- [[202601270006-prompt-library.md]]
- [[202601270008-providers-system.md]]
