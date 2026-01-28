# Interactions Define Engagement Modes

The Interactions System defines the varying modes of engagement between the user
and the LLM. It manages the user interface, input processing, and the context within
which the AI operates.

## Core Interaction Modes

1. **Chat Buffer:** A conversational interface akin to a messaging app.
   - Allows for multi-turn dialogue.
   - Supports slash commands, variables, and tool usage.
   - Persists history for context.
2. **Inline Assistant:** A "ghost text" or direct editing interface.
   - Designed for quick code generation or refactoring directly in the buffer.
   - Supports "diff" views to accept or reject changes.
3. **Command (Cmd):** A command-line style interface for one-off tasks.
   - useful for quick questions or piped commands.

## Context Management

Interactions rely heavily on **Context**, which includes:
- The current buffer's content and file type.
- Selected text ranges.
- Visible lines.
- Cursor position.

This context is captured and fed to the LLM to ground its responses in the user's
current reality.

Tags: #interactions #ui #ux #context-management

## References
- Is a component of: [[202601270000-Codecompanion-architecture-overview.md]]

## Backlinks
- [[202601270000-Codecompanion-architecture-overview.md]]
- [[202601270009-chat-buffer-mechanics.md]]
- [[202601270010-tool-system.md]]
- [[202601270011-chat-ui-rendering.md]]
