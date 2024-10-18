return {
  "gbprod/nord.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("nord").setup({})
    vim.cmd.colorscheme("nord")
    vim.cmd([[highlight Visual cterm=bold ctermbg=NONE ctermfg=NONE guibg=#565f89  guifg=NONE]])
  end,
}

-- •	Black: #000000
-- •	White: #FFFFFF
-- •	Red: #FF0000
-- •	Green: #00FF00
-- •	Blue: #0000FF
-- •	Yellow: #FFFF00
-- •	Magenta: #FF00FF
-- •	Cyan: #00FFFF
-- •	Grey: #808080
-- •	Orange: #FFA500
-- •	Purple: #800080
-- •	Pink: #FFC0CB
-- •	Brown: #A52A2A
-- •	Beige: #F5F5DC
-- •	Gold: #FFD700
-- •	Silver: #C0C0C0
-- •	Teal: #008080
-- •	Navy: #000080
-- •	Lime: #00FF00
-- •	Olive: #808000
-- •	Maroon: #800000
