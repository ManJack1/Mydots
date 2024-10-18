return {
  enabled = true,
  "lewis6991/gitsigns.nvim",
  dependencies = { "nvim-lua/plenary.nvim" }, -- `gitsigns.nvim` 的依赖
  config = function()
    vim.diagnostic.config({ virtual_text = false })
    require("gitsigns").setup()
  end,
}
