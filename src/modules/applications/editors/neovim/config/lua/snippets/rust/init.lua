local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node

return {
  s('derives', t( --[[ rust --]] '#[derive(Debug, Clone, Default, PartialEq, Eq)]')),
}
