return {
  {
    "OXY2DEV/markview.nvim",
    lazy = false, -- 不建议懒加载
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- 确保安装了 Tree-sitter
      "nvim-tree/nvim-web-devicons", -- 图标支持
    },
  },
  {
    "tadmccorkle/markdown.nvim",
    ft = "markdown", -- 仅在 markdown 文件类型时启用
    config = function()
      require("markdown").setup({
        -- 在这里可以添加其他配置选项
        mappings = {
          inline_surround_toggle = "gs", -- 切换行内强调
          link_add = "gl", -- 添加链接
          link_follow = "gx", -- 跟随链接
          go_curr_heading = "]c", -- 跳转到当前标题
          go_next_heading = "]]", -- 跳转到下一个标题
          go_prev_heading = "[[", -- 跳转到上一个标题
        },
      })
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
  },
}
