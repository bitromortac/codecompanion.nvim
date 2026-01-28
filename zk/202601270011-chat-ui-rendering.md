# Chat UI Renders Interactions

The Chat UI Rendering System is responsible for visually constructing the chat buffer, managing
the display of messages, and controlling user interaction states (read-only vs editable).

## Builder Pattern

The system uses a `Builder` pattern (`builder.lua`) to construct the buffer content.
It manages:
- **Sections:** Groups of content under a specific role (User/LLM).
- **Blocks:** Distinct types of content (Text, Reasoning, Tool Outputs) within a section.
- **Ephemeral State:** Tracks the current rendering cycle to ensure correct formatting
  and spacing.

## Buffer Locking Mechanics

To maintain the integrity of the conversation flow, the buffer switches between
editable and read-only states:
- **Locked (Read-Only):** The buffer is locked when the LLM is generating a response
  or when the system is processing tools. This prevents race conditions and ensures
  the user doesn't interrupt the stream.
- **Unlocked (Editable):** The buffer is temporarily unlocked *only* during the
  write operation to append new tokens, then immediately re-locked if the LLM is
  still active. It remains unlocked when waiting for user input.

## Visual Elements

- **Virtual Text:** Used for status indicators and introductory messages.
- **Extmarks:** Used to render headers, separators, and icons.
- **Folds:** Automatically collapses verbose sections like reasoning chains or large
  tool outputs to keep the interface clean.

Tags: #ui #rendering #neovim-ui #buffer-management

## References
- Visualizes: [[202601270009-chat-buffer-mechanics.md]]
- Is a component of: [[202601270003-interactions-system.md]]

## Backlinks
- [[202601270000-Codecompanion-architecture-overview.md]]
