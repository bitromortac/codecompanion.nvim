# Fuzzy Command Approval Reduces Friction

Fuzzy Command Approval is a feature within the
[[202601270012-tool-approvals.md]] system that allows the `cmd_runner` tool to
automatically execute commands that are conceptually similar to those already
approved by the user.

## Purpose

The goal is to reduce the cognitive load and interruptions for the user when the
LLM makes minor adjustments to a command (e.g., adding a flag or fixing a typo)
that has already been vetted. It balances security with a fluid agentic
workflow.

## Mechanics

When a command is submitted for approval:
1. **Exact Match:** The system first checks for an identical previously approved
   command.
2. **Similarity Check:** If no exact match is found, and the tool is
   `cmd_runner`, the system calculates the Levenshtein distance between the new
   command and all previously approved commands in the current session.
3. **Threshold:** If the similarity ratio (1 - distance / max_length) meets or
   exceeds the `approval_similarity_threshold` (default: 0.8), the command is
   auto-approved.
4. **Caching:** Auto-approved commands are cached as "approved" to speed up
   future checks.

## Security Constraints

To prevent malicious command injection or unexpected side effects, certain
safety measures are in place:
- **No Concatenation:** Fuzzy matching is **skipped** if the command contains
  shell operators such as `&&`, `;`, or `|`. These commands must always match
  exactly or be explicitly approved.
- **Opt-in/Configurable:** The feature can be tuned or disabled by adjusting the
  similarity threshold in the configuration.

Tags: #security #tools #automation #ux

## References
- Part of the approval system: [[202601270012-tool-approvals.md]]
- Uses utility: [[202601280900-string-similarity-utility.md]]
