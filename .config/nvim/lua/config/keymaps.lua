-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- 设置插入模式和可视模式下的快捷键
map(
  "i",
  "<C-m>",
  "<Esc><cmd>exec 'r!inkscape-figures-manager new -f -d figures -l \"'.getline('.').'\"'<CR>kkkkkkddjjjf{a",
  opts
)

-- which-key 添加快捷键
require("which-key").add({
  { "m", "<cmd>WhichKey m<cr>", desc = "󰬔 trigger" },
  { "mm", "<cmd>CompilerOpen<cr>", desc = "CompilerOpen" },
  { "mt", "<cmd>CompilerToggleResults<cr>", desc = "CompilerToggleResults" },
})

-- 创建图形文件的快捷键
map("i", "<C-f>", function()
  local filename = vim.fn.input("Figure name: ", "", "file")
  vim.cmd(string.format("exec 'r!inkscape-figures-manager new figures/%s.svg'", filename))
end, opts)

-- Telescope 映射
map("n", "<leader>so", ":Telescope vim_options<CR>", { desc = "Options" })
map("n", "<leader>se", ":Telescope diagnostics<CR>", { desc = "View Errors" })
map("i", "<C-e>", "<C-o>A", opts)

-- 删除插入模式下的 <Tab> 映射（UltiSnips 用法）
-- vim.api.nvim_del_keymap("i", "<Tab>")
-- vim.api.nvim_del_keymap("s", "<Tab>")

-- 绑定 <Tab> 键用于 UltiSnips 扩展或跳转
-- map("i", "<Tab>", "v:lua.MaybeExpandOrJump()", { expr = true, noremap = true, silent = true })
-- map("s", "<Tab>", "v:lua.MaybeExpandOrJump()", { expr = true, noremap = true, silent = true })

-- Lua 函数实现 UltiSnips 扩展或跳转
-- function MaybeExpandOrJump()
--   if vim.fn["UltiSnips#CanExpandSnippet"]() == 1 or vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
--     return vim.api.nvim_replace_termcodes("<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>", true, true, true)
--   else
--     return vim.api.nvim_replace_termcodes("<Tab>", true, true, true)
--   end
-- end

map("i", "<C-l>", "<Right>", opts)

map("i", "<C-h>", "<Left>", opts)

-- -- 使用 <C-l> 前向跳出
-- map("i", "<C-l>", "<Plug>(Tabout)", opts)
-- -- 使用 <C-h> 反向跳出
-- map("i", "<C-h>", "<Plug>(TaboutBack)", opts)

-- 将 Tab 键绑定到表格单元格跳转
map("n", "<Tab>", ":lua jump_to_next_cell()<CR>", opts)
map("n", "<S-Tab>", ":lua jump_to_previous_cell()<CR>", opts)

-- Table Mode 快捷键设置
map("n", "<leader>mm", ":TableModeToggle<CR>", { desc = "Toggle Table Mode" })
map("n", "<leader>mr", ":TableModeRealign<CR>", { desc = "Realign Table" })
map("n", "<leader>mdd", ":TableDeleteRow<CR>", { desc = "Delete Row" })
map("n", "<leader>mdc", ":TableDeleteColumn<CR>", { desc = "Delete Column" })
map("n", "<leader>mic", ":TableInsertColumnAfter<CR>", { desc = "Insert Column After" })
map("n", "<leader>miC", ":TableInsertColumnBefore<CR>", { desc = "Insert Column Before" })
map("n", "<leader>mir", ":lua InsertTableRowBelow()<CR>", { desc = "Insert Table Row Below" })
