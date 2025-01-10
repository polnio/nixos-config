local M = {}

M.find_index = function(t, value)
  for i, v in ipairs(t) do
    if v == value then
      return i
    end
  end
  return nil
end

return M
