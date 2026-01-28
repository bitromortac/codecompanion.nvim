# Chat Buffer Manages Loops

The Chat Buffer is the primary conversational interface in CodeCompanion, functioning
as a stateful event-driven loop that manages the dialogue between the user and the
LLM.

## The Message Loop

The core lifecycle of a chat interaction follows a distinct cycle:

1. **Submission:** The user's input (and context) is packaged into a payload (`submit`).
2. **Transmission:** The payload is sent to the LLM via the configured adapter
   (HTTP or ACP).
3. **Streaming:** Responses are received in chunks (`process_chunk`). The system
   parsers distinct streams for:
   - **Content:** The actual text response.
   - **Reasoning:** "Chain of thought" data (if supported).
   - **Tool Calls:** Requests to execute external functions.
4. **Completion:** Once the stream ends (`done`), the system finalizes the message
   state.

## Event Architecture

The Chat Buffer is highly observable and extensible through an event system. Components
can subscribe to lifecycle events:
- `on_submitted`: When a request is sent.
- `on_completed`: When a response is fully received.
- `on_cancelled`: If the user aborts the request.
- `ToolsStarted` / `ToolsFinished`: Specific events for tool execution phases.

## State Management

The buffer persists the state of the conversation, including:
- **Messages:** The history of User/LLM turns.
- **Context:** Active buffers, selected code, or file references.
- **Variables:** Dynamic data injected into the chat.

Tags: #chat-buffer #event-loop #architecture #messaging

## References
- Is a component of: [[202601270003-interactions-system.md]]
- Utilizes: [[202601270010-tool-system.md]]

## Backlinks
- [[202601270010-tool-system.md]]
- [[202601270011-chat-ui-rendering.md]]
