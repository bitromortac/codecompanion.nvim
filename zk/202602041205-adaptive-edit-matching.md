# Adaptive Edit Matching

A multi-strategy approach to locating code blocks for replacement when strict
exact matching fails.

## Strategy Chain
When the system tries to locate `oldText` in a file, it uses a waterfall of
strategies, moving from strict to fuzzy. It begins with an **Exact Match (1.0)**,
checking for byte-for-byte identity, which is the gold standard for reliability.
If that fails, it attempts **Whitespace Normalized (0.95)** matching to ignore
irrelevant differences in indentation or spacing.

Following this, it tries **Punctuation Normalized (0.93)** matching to forgive
minor syntax variations like trailing commas. If still unsuccessful, it uses a
**Trimmed Lines (0.8)** strategy that focuses solely on line content. Finally,
as a last resort, it employs a **Block Anchor (0.6)** strategy, which matches
only the first and last lines of the block and fuzzy-matches the content between
them.

## Conflict Resolution
If multiple matches are found with similar confidence scores (ambiguity), the
system aborts and asks the user (or LLM) for clarification. This prevents
accidental modifications of the wrong function (e.g., `init()` in the wrong
class).

## Substring Optimization
For simple token replacements (e.g., renaming a variable globally), the system
bypasses the line-based strategies and uses a parallel substring search
(`replaceAll: true` with no newlines in `oldText`).

Tags: #algorithm #editing #reliability

## References
- Supports: [[202602041200-search-based-editing-strategy.md]]
