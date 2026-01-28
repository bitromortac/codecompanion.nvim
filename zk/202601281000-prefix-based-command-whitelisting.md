# Prefix-Based Command Whitelisting Automates Trusted Tools

Prefix-Based Command Whitelisting allows for the automatic approval of commands
in the `cmd_runner` tool if they begin with a pre-defined set of trusted
prefixes.

## Purpose

This feature further reduces friction for users who frequently run safe,
standardized commands (e.g., `git`, `make`, `zktool`). By whitelisting these
prefixes, the system can bypass the manual approval dialog for known-safe
entry points, enhancing the fluidity of the development loop.

## Mechanics

1. **Prefix Matching:** When a command is evaluated, the system checks if it
   starts with any entry in the `allowed_prefixes` list.
2. **Security Verification:** Even if a prefix matches, the command undergoes a
   rigorous security check to ensure it does not contain shell operators,
   subshells, or redirections (e.g., `&&`, `;`, `|`, `$()`, `>`, etc.).
3. **Binary Isolation:** The system ensures that only the intended binary matches
   by requiring the prefix to be followed by a space or the end of the string,
   preventing "prefix shadowing" (e.g., `echo` matching `echon`).
4. **Configuration:** The whitelist is defined in the tool's configuration

   options, typically under `opts.allowed_prefixes`.

Tags: #security #tools #automation #ux

## References
- Complements: [[202601280845-fuzzy-command-approval.md]]
- Part of: [[202601270012-tool-approvals.md]]
