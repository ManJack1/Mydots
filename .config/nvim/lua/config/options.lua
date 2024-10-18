-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.cmd([[let g:loaded_perl_provider = 0]])
vim.cmd([[let g:loaded_ruby_provider = 0]])
vim.opt.guifont = "Monaco:h10" -- 字体设置为 Monaco，字号为 18

vim.opt.clipboard = "unnamedplus"

vim.opt.wrap = true

-- 当窗口尺寸变化时自动换行
vim.opt.linebreak = true

-- vimtex
vim.g.maplocalleader = "m"
-- vim.g.vimtex_view_general_viewer = "xdg-open"

-- vimtex configuration
vim.g.vimtex_view_method = "zathura"
-- 设置 nvr 作为 Neovim 远程通信工具
-- vim.g.vimtex_compiler_progname = "nvr"

vim.g.vimtex_view_general_viewer = "zathura"

-- Ensure vimtex is loaded
vim.g.vimtex_compiler_latexmk = {
  build_dir = "",
  callback = 1,
  continuous = 1,
  executable = "latexmk",
  options = {
    "-pdf",
    "-shell-escape",
    "-verbose",
    "-file-line-error",
    "-synctex=1",
    "-interaction=nonstopmode",
  },
}

vim.g.vimtex_syntax_enabled = 0
-- 设置 Visual 模式下选择文本的颜色为蓝色，保持文本颜色不变
-- 确保 Visual 模式的颜色在主题之后设置

vim.g.vimtex_syntax_conceal = {
  math = 1,
  tex = 1,
}

function orgtbl_to_latex_matrix()
  -- 获取选中的文本内容
  local start_line = vim.fn.line("'<") -- 选区起始行
  local end_line = vim.fn.line("'>") -- 选区结束行
  local input_table = vim.fn.getline(start_line, end_line) -- 获取选中的文本行

  -- 处理每一行
  local result = {}
  for _, line in ipairs(input_table) do
    local row = {}

    -- 去掉行首和行尾的 | 符号，再分割剩余的单元格
    line = line:gsub("^%s*|%s*", ""):gsub("%s*|%s*$", "")

    -- 将每行的单元格内容按 | 分割并去除空白
    for cell in line:gmatch("[^|]+") do
      table.insert(row, vim.trim(cell)) -- 去掉单元格内容的多余空格
    end

    -- 将每行的单元格用 & 连接，并确保不在最后一个单元格后添加 & 符号
    local formatted_row = table.concat(row, " & ")
    table.insert(result, formatted_row .. " \\\\") -- 每行以 \\ 结束
  end

  -- 替换选中的文本为转换后的 LaTeX 表格格式
  vim.fn.setline(start_line, result)
end

function InsertTableRowBelow()
  -- 获取当前光标所在的行
  local current_line = vim.fn.getline(".")

  -- 统计当前行的列数（基于 | 分隔符）
  local num_columns = select(2, current_line:gsub("|", "")) - 1

  -- 构建与当前列数匹配的新行
  local new_row = "|"
  for _ = 1, num_columns do
    new_row = new_row .. "   |" -- 每个单元格有空格填充
  end

  -- 在当前行下方插入新行
  vim.fn.append(vim.fn.line("."), new_row)

  -- 移动光标到新行的第一个单元格
  vim.fn.cursor(vim.fn.line(".") + 1, 2)
end

-- 向后跳转到下一个单元格
function jump_to_next_cell()
  local line = vim.fn.getline(".")
  local col = vim.fn.col(".")

  -- 当前行包含 | 符号，说明是表格行
  if line:find("|") then
    -- 在当前列之后查找下一个 |
    local next_pipe = line:find("|", col + 1)
    if next_pipe then
      -- 如果找到下一个 |，则跳转到该单元格
      vim.fn.cursor(vim.fn.line("."), next_pipe + 1)
    else
      -- 当前行中没有下一个 |，则跳转到下一行的第一个 |
      vim.cmd("normal! j")
      local next_line = vim.fn.getline(".")

      -- 循环寻找下一行的 |，直到找到为止
      while next_line ~= "" do
        local first_pipe = next_line:find("|")
        if first_pipe then
          -- 跳转到下一行的第一个 |
          vim.fn.cursor(vim.fn.line("."), first_pipe + 1)
          break
        else
          -- 没有找到 | 就继续往下跳
          vim.cmd("normal! j")
          next_line = vim.fn.getline(".")
        end
      end
    end
  else
    -- 当前行不是表格行，正常执行 Tab 键功能
    vim.cmd("normal! <Tab>")
  end
end

-- 向前跳转到上一个单元格
function jump_to_previous_cell()
  local line = vim.fn.getline(".")
  local col = vim.fn.col(".")

  -- 如果当前行是表格（包含 | 符号）
  if line:find("|") then
    -- 查找前一个 | 的位置
    local last_pipe = line:sub(1, col - 2):find("|[^|]*$")
    if last_pipe then
      -- 跳转到前一个单元格
      vim.fn.cursor(vim.fn.line("."), last_pipe + 1)
    else
      -- 如果没有前一个 |，跳转到上一行的最后一个单元格
      vim.cmd("normal! k$")
      local prev_line = vim.fn.getline(".")
      local last_pipe_prev = prev_line:find("|[^|]*$")
      if last_pipe_prev then
        vim.fn.cursor(vim.fn.line("."), last_pipe_prev + 1)
      end
    end
  else
    -- 如果当前行不是表格，正常执行 Shift+Tab 功能
    vim.cmd("normal! <S-Tab>")
  end
end
