return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- NvimTree needs web-devicons for icons
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.opt.termguicolors = true -- Ensure this is enabled for icons

    require("nvim-tree").setup({
      renderer = {
        icons = {
          show = {
            git = true,
            file = true,
            folder = true,
            folder_arrow = true,
          },
          glyphs = {
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "⌥",
              renamed = "➜",
              untracked = "★",
              deleted = "⊖",
              ignored = "◌",
            },
          },
        },
      },
    })

    local api = require("nvim-tree.api")
    vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<Cr>")
    vim.keymap.set("n", "<leader>pv", function()
      vim.cmd("NvimTreeClose")
      api.tree.open({ current_window = true })
    end, { noremap = true })
  end,
}
