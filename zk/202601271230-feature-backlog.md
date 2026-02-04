# Feature Backlog

This note tracks potential features and improvements for CodeCompanion.nvim that
are not yet scheduled for implementation.

## Proposed Features

### Asynchronous Message Injection
**Status:** Proposed
**Description:** Enable the ability to asynchronously inject messages into the
chat buffer from external processes or background tasks. This is useful for
status updates, live logs, or other non-blocking notifications.

### Command Interruption and Response Modification
**Status:** Proposed
**Description:** Enable the use of `q` to interrupt a running command and modify
the text sent to the LLM. Currently, the tool state does not update correctly
upon interruption, which needs to be addressed to maintain consistency.

Tags: #planning #backlog #features

## References
- Implementation process: [[shared/202601271000-implementation-plan-guidelines.md]]
