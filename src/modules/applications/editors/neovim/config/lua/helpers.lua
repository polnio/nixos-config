local M = {}

local ls = require "luasnip"
local sn = ls.snippet_node
local i = ls.insert_node

function M.get_ISO_8601_date()
  return os.date "%Y-%m-%d"
end

function M.get_visual(args, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else
    return sn(nil, i(1, ""))
  end
end

function M.in_mathzone()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

function M.in_text()
  return not M.in_mathzone()
end

function M.in_tikz()
  local is_inside = vim.fn["vimtex#env#is_inside"] "tikzpicture"
  return (is_inside[1] > 0 and is_inside[2] > 0)
end

return M
