# Search-Based Editing Strategy

Relies on context matching rather than absolute line numbers to perform file
edits.

## The Problem with Line Numbers
LLMs struggle with absolute line numbers because tokenization often splits
digits into multiple tokens, breaking continuity. Furthermore, the use of
outdated file versions in the context window causes "Context Drift," where the
model's concept of line 10 differs from the file's reality. Finally, models
often hallucinate counts without verifying, leading to destructive edits.

## The Solution: Contextual Replacement
Instead of relying on fragile indices like "Replace line 10", the system
utilizes a "Replace `oldText` with `newText`" paradigm. This forces the LLM to
explicitely provide the unique code block it intends to change, shifting the
burden of location from the model's counting ability to the system's pattern
matching engine.

## Atomicity
To maintain file integrity, edits are **atomic**. If an LLM requests 5 edits to
a file and 1 fails (e.g., text not found), **none** of the edits are applied.
This prevents partial states where the code becomes unparseable.

Tags: #architecture #editing #llm-integration

## References
- Implements: [[202601270010-tool-system.md]]
- Relies on: [[202602041205-adaptive-edit-matching.md]]
