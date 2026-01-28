# CodeCompanion Integrates LLMs into Neovim

CodeCompanion.nvim is a Neovim plugin designed to integrate Large Language
Models (LLMs) directly into the editor. It functions as an AI coding assistant,
providing various interfaces to interact with LLMs for coding tasks.

The system is built on an "Omakase" philosophy, prioritizing a curated, stable,
and integrated experience over an exhaustive feature list.

## Core Components

The architecture is divided into several key systems:

- **Interactions:** The primary interfaces for user-LLM communication (Chat,
  Inline, Cmd).
  - [[202601270003-interactions-system.md]]
- **Adapters:** The bridge between Neovim and external LLM providers (OpenAI,
  Anthropic, etc.).
  - [[202601270002-adapters-system.md]]
- **Providers:** Integrations with other Neovim plugins (Telescope, Mini.Pick,
  etc.) for context retrieval and action selection.
  - [[202601270008-providers-system.md]]
- **Utilities:** Shared helper functions for buffer management, logging, and UI
  elements.
  - [[202601270010-tool-system.md]]
  - [[202601270005-action-palette.md]]
  - [[202601270006-prompt-library.md]]
  - [[202601270007-extensions-system.md]]
  - [[202601270013-testing-framework.md]]
  - [[202601270011-chat-ui-rendering.md]]
  - [[202601270012-tool-approvals.md]]

## Development Standards

- **Coding Standards:** The project adheres to strict coding and contribution
  guidelines.
  - [[202601270001-coding-standards.md]]

## Development Progress
Planned feature can be found here
[[202601161200-zktool-implementation-roadmap.md]].

## Feature Backlog
We plan feature implementation using
[[202601271000-implementation-plan-guidelines.md]].

Tags: #architecture #neovim #plugin #llm

## References
- Configuration details: [[202601270004-configuration-strategy.md]]
- Protocol for agents: [[202601270014-acp-protocol.md]]

## Backlinks
- [[202601270001-coding-standards.md]]
- [[202601270002-adapters-system.md]]
- [[202601270003-interactions-system.md]]
- [[202601270004-configuration-strategy.md]]
- [[202601270005-action-palette.md]]
- [[202601270006-prompt-library.md]]
- [[202601270007-extensions-system.md]]
- [[202601270008-providers-system.md]]
- [[202601270012-tool-approvals.md]]
- [[202601270013-testing-framework.md]]
- [[202601270014-acp-protocol.md]]
