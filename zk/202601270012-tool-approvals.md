# Approvals Gatekeep Execution

The Tool Approval System acts as a security gatekeeper, ensuring that the AI agent
cannot execute potentially harmful actions (like deleting files or running shell
commands) without user consent.

## Approval Levels

1. **Tool-Level Approval:** The user approves the use of a specific tool (e.g.,
   `read_file`) for the duration of the chat session.
2. **Command-Level Approval:** For sensitive tools like `cmd_runner`, the user must
   approve *each unique command* (e.g., `ls -la`). Subsequent requests for the
   same command are auto-approved.

## YOLO Mode (You Only Look Once)

"YOLO Mode" is a relaxed security state for a chat buffer where tool executions
are automatically approved.

- **Purpose:** Enables fully autonomous agentic workflows where the AI plans and
  executes multiple steps (coding, testing, fixing) without user interruption.
- **Safeguards:** Even in YOLO mode, tools can be explicitly flagged as
  `allowed_in_yolo_mode = false` in their configuration to prevent critical
  actions (like `rm -rf`).
- **Scope:** Applied per chat buffer.

Tags: #security #tools #automation #agent

## References
- Is a component of: [[20260127000010-codecompanion-tool-system.md]]

## Backlinks
- [[202601270000-Codecompanion-architecture-overview.md]]
