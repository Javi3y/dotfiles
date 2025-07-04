return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use the mini.nvim suite
  --@module 'render-markdown'
  --@type render.md.UserConfig
  opts = {}, -- Add any specific options for render-markdown here
  config = function(_, opts)
    require("render-markdown").setup(opts)
  end,
}
