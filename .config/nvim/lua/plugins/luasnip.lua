return {
  "L3MON4D3/LuaSnip",
  -- lazy_load = false,
  -- keys = function()
  --   return {}
  -- end,
  config = function()
    local ls = require("luasnip")
    require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippet" })
    ls.config.setup({ enable_autosnippets = true })
  end,
  -- stylua: ignore
  -- keys = {
  --   { "<tab>", false },
  --   {
  --     "<C-l>",
  --     function()
  --       return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<C-l>"
  --     end,
  --     expr = true,
  --     silent = true,
  --     mode = "i",
  --   },
  --   {
  --     "<C-l>",
  --     function()
  --       require("luasnip").jump(1)
  --     end,
  --     mode = "s",
  --   },
  --   {
  --     "<C-h>",
  --     function()
  --       return require("luasnip").jumpable(-1) and "<Plug>luasnip-jump-prev" or "<C-h>"
  --     end,
  --     expr = true,
  --     silent = true,
  --     mode = "i",
  --   },
  --   {
  --     "<C-h>",
  --     function()
  --       require("luasnip").jump(-1)
  --     end,
  --     mode = { "i", "s" },
  --   },
  -- },
}
