# Implementation Plan: Prefix-Based Command Whitelisting

## 1. Objective

Enable auto-approval for `cmd_runner` commands that start with user-defined
whitelisted prefixes. This ensures that common, trusted commands can be executed
without manual intervention, while maintaining a strong security posture against
command concatenation.

## 2. Architecture & Components

### Modified Components
- **`lua/codecompanion/config.lua`**:
  - Add `allowed_prefixes` table to the `cmd_runner` tool's default options.
- **`lua/codecompanion/interactions/chat/tools/approvals.lua`**:
  - Update `Approvals:is_approved` to check against whitelisted prefixes.
  - Apply the `dangerous_pattern` check to all whitelisted command attempts.

## 3. Step-by-Step Implementation

### Step 1: Configuration Update
Update `lua/codecompanion/config.lua` to include `allowed_prefixes` for the
`cmd_runner`.

### Step 2: Logic Implementation in `approvals.lua`
Modify `Approvals:is_approved` to handle the whitelist.
1. Extract `allowed_prefixes` from the tool configuration.
2. Before fuzzy matching, check if the command starts with any whitelisted
   prefix.
3. **Crucial:** Ensure the `dangerous_pattern` check (`[;&|]`) is applied to the
   command. If a dangerous operator is present, reject auto-approval regardless
   of the prefix.

### Step 3: Security Validation
Verify that commands like `git status && rm -rf /` are correctly blocked even if
`git` is whitelisted.

## 4. Testing Strategy

### Unit Tests
- Test various whitelisted prefixes (e.g., `git status`, `make test`).
- Test security blocks (e.g., `git status; rm -rf /`).
- Test non-whitelisted commands (e.g., `rm -rf /`).

## 5. Documentation Update
- Update `[[202601270012-tool-approvals.md]]` to include Whitelisting.
- Update `[[202601161200-zktool-implementation-roadmap.md]]` with the new plan.

Tags: #planning #roadmap

## References
- Based on: [[202601281000-prefix-based-command-whitelisting.md]]
