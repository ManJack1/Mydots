local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- local tex = require("util.latex")
local tex = require("util.md-env")

local get_visual = function(args, parent)
  if #parent.snippet.env.SELECT_RAW > 0 then
    return sn(nil, t(parent.snippet.env.SELECT_RAW))
  else -- If SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

return {

  s({ trig = "and", snippetType = "autosnippet" }, { t("&") }, { condition = tex.in_mathzone }),
  s({ trig = "--", snippetType = "autosnippet" }, { t("\\item") }, { condition = tex.in_list }),
  s(
    { trig = "||", snippetType = "autosnippet" },
    { t("\\left|"), i(1), t("\\right|") },
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "\\{", snippetType = "autosnippet" },
    { t("\\left\\{"), i(1), t("\\right\\}") },
    { condition = tex.in_mathzone }
  ),
  s({ trig = "sin", snippetType = "autosnippet" }, {
    t("\\sin"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "sset", snippetType = "autosnippet" }, {
    t("\\subset"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "ssq", snippetType = "autosnippet" }, {
    t("\\subseteq"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "asin", snippetType = "autosnippet" }, {
    t("\\arcsin"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "setm", snippetType = "autosnippet" }, {
    t("\\setminus"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "cos", snippetType = "autosnippet" }, {
    t("\\cos"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "acos", snippetType = "autosnippet" }, {
    t("\\arccos"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "tan", snippetType = "autosnippet" }, {
    t("\\tan"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "atan", snippetType = "autosnippet" }, {
    t("\\arctan"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "cot", snippetType = "autosnippet" }, {
    t("\\cot"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "acot", snippetType = "autosnippet" }, {
    t("\\arccot"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "csc", snippetType = "autosnippet" }, {
    t("\\csc"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "acsc", snippetType = "autosnippet" }, {
    t("\\arccsc"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "sec", snippetType = "autosnippet" }, {
    t("\\sec"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "asec", snippetType = "autosnippet" }, {
    t("\\arcsec"),
  }, { condition = tex.in_mathzone }),
  s({ trig = ";t", snippetType = "autosnippet" }, {
    t("\\theta"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "oo", snippetType = "autosnippet" }, { t("\\infty") }, { condition = tex.in_mathzone }),

  s({ trig = ";p", snippetType = "autosnippet" }, { t("\\pi") }, { condition = tex.in_mathzone }),
  s({ trig = ";a", snippetType = "autosnippet" }, { t("\\alpha") }, { condition = tex.in_mathzone }),
  s({ trig = "<=", snippetType = "autosnippet" }, { t("\\leq") }, { condition = tex.in_mathzone }),

  s({ trig = ">=", snippetType = "autosnippet" }, { t("\\geq") }, { condition = tex.in_mathzone }),

  s({ trig = ";m", snippetType = "autosnippet" }, { t("\\mu") }, { condition = tex.in_mathzone }),
  s({ trig = ";l", snippetType = "autosnippet" }, { t("\\lambd") }, { condition = tex.in_mathzone }),

  s({ trig = ";e", snippetType = "autosnippet" }, { t("\\varepsilon") }, { condition = tex.in_mathzone }),
  s({ trig = "mid", regTrig = true, snippetType = "autosnippet" }, t("\\middle"), { condition = tex.in_mathzone }),
  s({ trig = "...", snippetType = "autosnippet" }, { t("\\dots") }, { condition = tex.in_mathzone }),

  s({ trig = ";b", snippetType = "autosnippet" }, { t("\\beta") }, { condition = tex.in_mathzone }),
  s({ trig = "c..", snippetType = "autosnippet" }, { t("\\cdots") }, { condition = tex.in_mathzone }),

  s({ trig = ";z", snippetType = "autosnippet" }, { t("\\zeta") }, { condition = tex.in_mathzone }),

  s({ trig = ";w", snippetType = "autosnippet" }, { t("\\omiga") }, { condition = tex.in_mathzone }),
  s({ trig = "v..", snippetType = "autosnippet" }, { t("\\vdots") }, { condition = tex.in_mathzone }),
  s({ trig = "mto", snippetType = "autosnippet" }, { t("\\mapsto") }, { condition = tex.in_mathzone }),
  s({ trig = "To", snippetType = "autosnippet" }, { t("\\Rightarrow") }, { condition = tex.in_mathzone }),
  s({ trig = "phi", snippetType = "autosnippet" }, { t("\\phi") }, { condition = tex.in_mathzone }),

  s({ trig = "tt", snippetType = "autosnippet" }, { t("\\times") }, { condition = tex.in_mathzone }),
  s({ trig = "ott", snippetType = "autosnippet" }, { t("\\otimes") }, { condition = tex.in_mathzone }),

  s({ trig = "emp", snippetType = "autosnippet" }, { t("\\emptyset") }, { condition = tex.in_mathzone }),

  s({ trig = "neq", snippetType = "autosnippet" }, { t("\\neq") }, { condition = tex.in_mathzone }),

  s({ trig = "co", snippetType = "autosnippet" }, { t("\\circ") }, { condition = tex.in_mathzone }),

  s({ trig = "ex", snippetType = "autosnippet" }, { t("\\exists") }, { condition = tex.in_mathzone }),
  s({ trig = "fa", snippetType = "autosnippet" }, { t("\\forall") }, { condition = tex.in_mathzone }),
}
