# Approvals Gatekeep Execution

The Tool Approval System acts as a security gatekeeper, ensuring that the AI
agent cannot execute potentially harmful actions (like deleting files or running
shell commands) without user consent.

## Approval Levels

The system employs two levels of approval to balance security and usability.

### Tool-Level Approval

The user approves the use of a specific tool (e.g., `read_file`) for the duration
of the chat session.

### Command-Level Approval

For sensitive tools like `cmd_runner`, the user must approve *each unique
command* (e.g., `ls -la`). Subsequent requests for the same command are
auto-approved. The system also supports
[[202601280845-fuzzy-command-approval.md]], allowing for the auto-approval of
commands that are similar to previously approved ones, provided they meet
security constraints.

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
- Is a component of: [[202601270010-tool-system.md]]
- Utilizes: [[202601280845-fuzzy-command-approval.md]]

## Backlinks
- [[202601270000-Codecompanion-architecture-overview.md]]
