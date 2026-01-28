local h = require("tests.helpers")
local string_utils = require("codecompanion.utils.string")

local new_set = MiniTest.new_set
local T = new_set()

T["levenshtein_distance"] = new_set()

T["levenshtein_distance"]["calculates distance correctly"] = function()
  h.eq(0, string_utils.levenshtein_distance("hello", "hello"))
  h.eq(1, string_utils.levenshtein_distance("hello", "hell"))
  h.eq(1, string_utils.levenshtein_distance("hello", "hallo"))
  h.eq(3, string_utils.levenshtein_distance("kitten", "sitting"))
  h.eq(3, string_utils.levenshtein_distance("saturday", "sunday"))
end

T["levenshtein_distance"]["handles empty strings"] = function()
  h.eq(5, string_utils.levenshtein_distance("hello", ""))
  h.eq(5, string_utils.levenshtein_distance("", "hello"))
  h.eq(0, string_utils.levenshtein_distance("", ""))
end

T["similarity_ratio"] = new_set()

T["similarity_ratio"]["calculates ratio correctly"] = function()
  h.eq(1.0, string_utils.similarity_ratio("hello", "hello"))
  h.eq(0.8, string_utils.similarity_ratio("hello", "hell")) -- 1 - 1/5 = 0.8
  h.eq(0.8, string_utils.similarity_ratio("hello", "hallo")) -- 1 - 1/5 = 0.8

  -- kitten (6) vs sitting (7). Distance is 3. Max len is 7.
  -- 1 - 3/7 = 0.5714...
  local ratio = string_utils.similarity_ratio("kitten", "sitting")
  h.eq(true, ratio > 0.57 and ratio < 0.58)
end

T["similarity_ratio"]["handles empty strings"] = function()
  h.eq(1.0, string_utils.similarity_ratio("", ""))
  h.eq(0.0, string_utils.similarity_ratio("hello", ""))
  h.eq(0.0, string_utils.similarity_ratio("", "hello"))
end

return T
