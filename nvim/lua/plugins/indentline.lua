return {
  "lukas-reineke/indent-blankline.nvim",
  name = "ibl", -- Indent Blankline is now 'ibl'
  main = "ibl",
  config = function()
    require("ibl").setup()
  end,
}
