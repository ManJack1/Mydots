local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local f = ls.function_node
local i = ls.insert_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- local tex = require("util.latex")
local tex = require("util.tex_utils")
-- local get_visual = function(args, parent)
--   if #parent.snippet.env.SELECT_RAW > 0 then
--     return sn(nil, t(parent.snippet.env.SELECT_RAW))
--   else -- If SELECT_RAW is empty, return a blank insert node
--     return sn(nil, i(1))
--   end
-- end
return {
  s({ trig = "In", snippetType = "autosnippet" }, t("\\in"), { condition = tex.in_mathzone }),
  s(
    { trig = "int", snippetType = "autosnippet" },
    fmta(
      [[
    \int_{<>}^{<>}<><>
    ]],
      {
        i(1),
        i(2),
        i(3),
        i(0),
      }
    ),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "sum", snippetType = "autosnippet" },
    fmta(
      [[
    \sum\limits_{<>}^{<>}<>
    ]],
      {
        i(1),
        i(2),
        i(0),
      }
    ),
    { condition = tex.in_math }
  ),

  s(
    { trig = "oin", snippetType = "autosnippet", privoty = "3000" },
    fmta(
      [[
    \oint\limits_{<>}<>
    ]],
      {
        i(1),
        i(0),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s(
    { trig = "ff", snippetType = "autosnippet" },
    fmta(
      [[
    \frac{<>}{<>}<>
    ]],
      {
        i(1),
        i(2),
        i(0),
      }
    ),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "lim", snippetType = "autosnippet" },
    fmta(
      [[
    \lim\limits_{<>}<>
    ]],
      {
        i(1),
        i(0),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s(
    { trig = "lim", snippetType = "autosnippet" },
    fmta(
      [[
    \lim\limits_{<>}<>
    ]],
      {
        i(1),
        i(0),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s({ trig = "to", snippetType = "autosnippet" }, t("\\to "), { condition = tex.in_mathzone }),
  s(
    { trig = "sq", snippetType = "autosnippet" },
    fmta(
      [[
    \sqrt{<>}<>
    ]],
      {
        i(1),
        i(0),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s(
    { trig = "nsq", snippetType = "autosnippet" },
    fmta(
      [[
    \sqrt[n]{<>}<>
    ]],
      {
        i(1),
        i(0),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s(
    { trig = "pow", regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[
        <>^{<>}<>
        ]],
      {
        i(1),
        i(2),
        i(0),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s(
    { trig = "(%a+)pow", regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[
        <>^{<>}<>
        ]],
      {
        f(function(_, snip)
          return snip.captures[1]
        end),
        i(1),
        i(0),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s(
    { trig = "sub", regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[
        <>_{<>}<>
        ]],
      {
        i(1),
        i(2),
        i(0),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s(
    { trig = "(%a+)sub", regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[
        <>_{<>}<>
        ]],
      {
        f(function(_, snip)
          return snip.captures[1]
        end),
        i(1),
        i(0),
      }
    ),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "\\{", snippetType = "autosnippet" },
    fmta("\\left\\{ <>\\right\\}<>", { i(1), i(2) }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "l%[", regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[
        \left[ <> \right
        ]],
      {
        i(0),
      }
    ),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "cmat", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{pmatrix}
       <>\\
       \vdots \\
       <>
       \end{pmatrix} <>
      ]],
      {
        i(1),
        i(2),
        i(0),
      }
    ),
    { condition = tex.in_math }
  ),
  s(
    { trig = "bm", snippetType = "autosnippet" },
    fmta(
      [[
      \binom{<>}{<>}<>
      ]],
      {
        i(1),
        i(2),
        i(0),
      }
    ),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "l%(", regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[
        \left( <> \right
        ]],
      {
        i(0),
      }
    ),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "l%{", regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[
        \left\{ <> \right\
        ]],
      {
        i(0),
      }
    ),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "msf", snippetType = "autosnippet" },
    fmta("\\mathsf{<>}", {
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "(%a+)bs", regTrig = true, snippetType = "autosnippet" },
    fmta("<>(<>)<>", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    "series",
    fmta(
      [[
<>_1, <>_2, \cdots, <>_<> <>
    ]],
      {
        i(1), -- 输入变量名称，默认 "x"
        rep(1), -- 自动复用变量名称
        rep(1), -- 再次复用变量名称
        i(2, "n"), -- 输入最大下标，默认 "n"
        i(0),
      }
    )
  ),
  s(
    { trig = "bs", regTrig = true, snippetType = "autosnippet" },
    fmta("(<>)<>", {
      i(1),
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "D(%a+)", regTrig = true, snippetType = "autosnippet" },
    fmta("\\diff <>", {
      f(function(_, snip)
        return snip.captures[1]
      end),
    }),
    { condition = tex.in_mathzone }
  ),
}
