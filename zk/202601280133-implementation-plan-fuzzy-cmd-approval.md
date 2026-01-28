# Implementation Plan: Similarity-Based Command Auto-Approval

## 1. Objective

Enhance the `cmd_runner` tool's approval system to automatically allow similar
commands that have been previously approved. This will reduce friction for users
when running slightly modified commands (e.g., different flags or arguments)
while maintaining security. The feature will introduce a "similarity check" when
a command is about to be executed. If the command is not identical to an
approved command but is "similar enough" (based on a configurable percentage),
it will be auto-approved. Crucially, **concatenated commands** (using `&&`, `;`,
`|`, etc.) will be strictly **excluded** from this auto-approval mechanism to
prevent security risks.

## 2. Architecture & Components

### New Components
- **`lua/codecompanion/utils/string.lua`**: (Potential) Utility module for
  string similarity algorithms (e.g., Levenshtein distance), if not already
  present or if we need a dedicated place.

### Modified Components
- **`lua/codecompanion/interactions/chat/tools/approvals.lua`**:
  - Update `Approvals` table structure to potentially store more metadata if
    needed (though simple list might suffice).
  - Modify `Approvals:is_approved` to implement the similarity logic.
  - Add configuration handling for the similarity threshold.
- **`lua/codecompanion/config.lua`**:
  - Add new configuration options for `cmd_runner`:
    `opts.approval_similarity_threshold` (default e.g., 0.8 or 80%).

### Architectural Fit
This feature sits within the existing **Interactions System**, specifically the
**Tool System's Approval Layer** (`[[202601270012-tool-approvals.md]]`). It
extends the logic of `Approvals:is_approved` without changing the external API
significantly.

## 3. Step-by-Step Implementation

### Step 1: Utility - Levenshtein Distance
Implement a Levenshtein distance function in Lua. This will be used to calculate
the similarity ratio between two strings.
- Create or update `lua/codecompanion/utils/string_similarity.lua` (or similar).
- **Test:** Unit test the distance function with various string pairs.

### Step 2: Configuration
Update `lua/codecompanion/config.lua` to include the new option.
- Key: `interactions.chat.tools.cmd_runner.opts.approval_similarity_threshold`
- Type: `number` (0.0 to 1.0)
- Default: `0.8` (Tentative)

### Step 3: Security Check - Concatenation Detection
Implement a check to detect concatenated commands.
- We must detect shell operators: `&&`, `||`, `;`, `|`.
- If any of these are present in the *new* command, the similarity check is
  **skipped**, and full approval is required.

### Step 4: Logic Implementation in `approvals.lua`
Modify `Approvals:is_approved` in `lua/codecompanion/interactions/chat/tools/approvals.lua`.
- **Note:** The similarity check should work for both yolo and non-yolo modes.
- **Current Logic:** Exact match check: `if approved[bufnr][tool][cmd] then return true end`.
- **New Logic:**
  1. Check for exact match (fast path). If yes, return `true`.
  2. If `tool_name` is `cmd_runner` and `opts.approval_similarity_threshold`
     is set:
     a. Check for concatenated commands in the *input* `cmd`. If found ->
     return `false` (require explicit approval).
     b. Iterate through all keys in `approved[bufnr]["cmd_runner"]`.
     c. For each approved command, calculate similarity ratio.
     d. If ratio >= threshold -> Auto-approve (return `true` and
     potentially cache the new exact match for future speed).
  3. If in `yolo_mode` and `tool_cfg.opts.allowed_in_yolo_mode == false`, we
     still check the similarity logic before returning `false`.

### Step 5: User Feedback (Optional but Good)
Consider if we should notify the user that a command was "Auto-approved based on
similarity". For now, we'll keep it silent as per standard "auto-approve"
behavior, but logging it to `log:debug` is essential.

## 4. Testing Strategy

### Unit Tests
- **Levenshtein Implementation:** Verify correctness.
- **Concatenation Detection:** Ensure `ls -la && rm -rf /` is correctly flagged.
- **Similarity Logic:**
  - `git status` vs `git statsu` (should pass if threshold high).
  - `ls -la` vs `rm -rf /` (should fail).
  - `echo "hello"` vs `echo "hell"` (should pass).

### Integration Tests
- Mock the configuration.
- Simulate a chat buffer `bufnr`.
- 1. Approve `ls -la`.
- 2. Ask `is_approved` for `ls -l`.
- 3. Verify it returns `true`.
- 4. Ask `is_approved` for `ls -la && echo "hack"`.
- 5. Verify it returns `false`.

## 5. Verification
- Open a chat.
- Run a command via `cmd_runner` (e.g., `echo "test"`). Approve it.
- Ask the LLM (or force via code) to run `echo "tests"`.
- Observe it runs without asking for approval.
- Ask to run `echo "test" && ls`.
- Observe it prompts for approval.

## 6. Documentation Update
- Update `[[202601270012-tool-approvals.md]]` to describe the fuzzy matching
  behavior.
- Update `[[202601270004-configuration-strategy.md]]` with the new option.

Tags:

## References
