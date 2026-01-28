local M = {}

---Calculate the Levenshtein distance between two strings
---@param str1 string
---@param str2 string
---@return number
function M.levenshtein_distance(str1, str2)
  local len1 = #str1
  local len2 = #str2
  local matrix = {}

  for i = 0, len1 do
    matrix[i] = { [0] = i }
  end

  for j = 0, len2 do
    matrix[0][j] = j
  end

  for i = 1, len1 do
    for j = 1, len2 do
      local cost = (str1:sub(i, i) == str2:sub(j, j)) and 0 or 1
      matrix[i][j] = math.min(
        matrix[i - 1][j] + 1, -- deletion
        matrix[i][j - 1] + 1, -- insertion
        matrix[i - 1][j - 1] + cost -- substitution
      )
    end
  end

  return matrix[len1][len2]
end

---Calculate the similarity ratio between two strings
---@param str1 string
---@param str2 string
---@return number 0.0 to 1.0
function M.similarity_ratio(str1, str2)
  local distance = M.levenshtein_distance(str1, str2)
  local max_len = math.max(#str1, #str2)
  if max_len == 0 then
    return 1.0
  end
  return 1.0 - (distance / max_len)
end

return M
