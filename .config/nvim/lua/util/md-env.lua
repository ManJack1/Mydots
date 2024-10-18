local ts_utils = require("nvim-treesitter.ts_utils")
local parsers = require("nvim-treesitter.parsers")

local M = {}

-- 获取当前光标所在的节点
local function get_node_at_cursor()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local cursor_row = cursor[1] - 1 -- 0-based row
  local cursor_col = cursor[2] -- 0-based column

  local buf = vim.api.nvim_get_current_buf()
  local filetype = vim.bo.filetype
  local lang = filetype == "markdown" and "markdown" or "latex"

  local ok, parser = pcall(parsers.get_parser, buf, lang)
  if not ok or not parser then
    return nil
  end

  local tree = parser:parse()[1]
  if not tree then
    return nil
  end

  return tree:root():descendant_for_range(cursor_row, cursor_col, cursor_row, cursor_col)
end

-- 检测是否在 LaTeX 或 Markdown 数学环境中
function M.in_mathzone()
  local node = get_node_at_cursor()

  while node do
    local node_type = node:type()
    -- 检查常见的数学节点类型，包括 "inline" 和 "$" 类型
    if
      node_type == "inline_math"
      or node_type == "math_block"
      or node_type == "displayed_equation"
      or node_type == "inline_formula"
      or node_type == "inline"
      or node_type == "$"
    then -- 添加对 "$" 的支持
      -- 进一步检查是否包含数学符号，比如 "$" 或 "$$"
      local node_text = vim.treesitter.get_node_text(node, 0)
      if node_text:match("%$") or node_text:match("%$%$") then
        return true
      end
    elseif node_type == "generic_environment" or node_type == "math_environment" then
      local start_node = node:child(0)
      if start_node and start_node:type() == "begin" then
        local text = vim.treesitter.get_node_text(start_node, 0)
        if text:match("\\begin{[A-Za-z]*math}") then
          return true
        end
      end
    end
    node = node:parent()
  end
  return false
end

return M
