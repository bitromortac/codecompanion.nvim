# Tool Adapter Normalization

The process of standardizing tool arguments and outputs across different LLM
provider APIs to ensure consistent execution within the Tool System.

## The Challenge: Provider Divergence
Different LLM providers (OpenAI, Anthropic, Ollama, etc.) lack a unified
standard for returning tool calls, especially during streaming responses. Some
providers return fully parsed **JSON Objects**, while others emit **JSON
Strings** that require manual parsing. Furthermore, streaming responses often
fragment arguments, requiring stateful reconstruction.

## Normalization Layer
The `codecompanion.interactions.chat.tools.init` module acts as a "glue" layer.
It inspects the incoming tool arguments and, if necessary, parses JSON strings
into Lua tables. This defensive coding ensures that the core tool logic (Runner)
always receives a standardized Lua table, regardless of the upstream provider's
quirks.

## LLM-Specific Quirks
Specifically handles the "Python-like JSON" issue where some models output
Python booleans (`True`/`False`) or single quotes instead of standard JSON.

Tags: #interoperability #adapters #robustness

## References
- Component of: [[202601270010-tool-system.md]]
