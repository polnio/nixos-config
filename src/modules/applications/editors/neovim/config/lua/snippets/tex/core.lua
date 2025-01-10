local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
	s(
		{ trig = "txt", dscr = "Expands 'txt' into '\\text{}'", snippetType = "autosnippet" },
		fmta("\\text{<>}", { i(1) })
	),
	s(
		{ trig = "tt", dscr = "Expands 'tt' into '\\texttt{}'", snippetType = "autosnippet" },
		fmta("\\texttt{<>}", { i(1) })
	),
	--[[ s(
    { trig = "bb", dscr = "Expands 'bb' into '\\mathbb{}'", snippetType = "autosnippet" },
    fmta("\\mathbb{<>}", { i(1) })
  ), ]]
	s({ trig = "mm", dscr = "Expands 'mm' into '$$", snippetType = "autosnippet" }, fmta("$<>$", { i(1) })),
	s({ trig = "MM", dscr = "Expands 'MM' into '$$$$", snippetType = "autosnippet" }, fmta("$$<>$$", { i(1) })),
}
