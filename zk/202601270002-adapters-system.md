# Adapters Normalize LLM Interactions

The Adapters System serves as the translation layer between CodeCompanion's internal
logic and the diverse APIs of external LLM providers (e.g., OpenAI, Anthropic,
Ollama).

## Purpose

The primary goal of the adapter system is to normalize interactions with different
AI models. It abstracts away the differences in API endpoints, request structures,
and response formats, allowing the rest of the plugin to treat all LLMs uniformly.

## Architecture

- **HTTP Adapters:** Handle direct REST API communication with providers.
  - Located in `lua/codecompanion/adapters/http/`
- **ACP Adapters:** Support the Agent Client Protocol for standardized agent
  interactions.
  - Located in `lua/codecompanion/adapters/acp/`
- **Resolution:** The system resolves adapter names to their specific implementations,
  handling configuration merging and instantiation.

## Extensibility

Users can define custom adapters or extend existing ones. The system is designed to
be "plug-and-play" for new providers, provided they implement the required interface.

Tags: #adapters #llm-integration #architecture

## References
- Is a component of: [[202601270000-Codecompanion-architecture-overview.md]]
- Configuration of adapters: [[202601270004-configuration-strategy.md]]

## Backlinks
- [[202601270000-Codecompanion-architecture-overview.md]]
- [[202601270004-configuration-strategy.md]]
- [[202601270014-acp-protocol.md]]
