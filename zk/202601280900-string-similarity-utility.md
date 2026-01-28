# String Similarity Utility Calculates Edit Distance

This utility provides functions to quantify the similarity between two strings,
primarily using the Levenshtein distance algorithm. It is used to support
features like [[202601280845-fuzzy-command-approval.md]].

## Algorithms

- **Levenshtein Distance:** Calculates the minimum number of single-character
  edits (insertions, deletions, or substitutions) required to change one word
  into the other.
- **Similarity Ratio:** A normalized value between 0.0 and 1.0, where 1.0
  represents an exact match. It is calculated as `1 - (distance / max_length)`.

Tags: #lua #utility #computer-science

## References
- Used by: [[202601280845-fuzzy-command-approval.md]]
