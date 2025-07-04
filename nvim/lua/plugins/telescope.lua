return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
      vim.keymap.set("n", "<leader>pg", builtin.git_files, {})
      vim.keymap.set("n", "<leader>pd", builtin.lsp_document_symbols, {})
      vim.keymap.set("n", "<leader>pm", builtin.marks, {})
      vim.keymap.set("n", "<leader>pa", builtin.fd, {})
      vim.keymap.set("n", "<leader>ps", function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end)

      local function get_visual_selection()
        return table.concat(vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos(".")), "\n")
      end

      vim.keymap.set("v", "<leader>ps", function()
        local selected_text = get_visual_selection()
        builtin.grep_string({ search = selected_text })
      end)
    end,
  },
}
