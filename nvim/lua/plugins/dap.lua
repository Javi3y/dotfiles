-- ~/.config/nvim/lua/plugins/dap.lua
return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "mfussenegger/nvim-dap-python", -- For Python debugging
      "nvim-neotest/nvim-nio",
      -- Add other language DAP adapters here as needed, e.g.:
      -- "leoluz/nvim-dap-go",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      local dap_python = require("dap-python")

      require("dapui").setup({})
      require("nvim-dap-virtual-text").setup({
        commented = true, -- Show virtual text alongside comment
      })

      dap_python.setup("python3")

      vim.fn.sign_define("DapBreakpoint", {
        text = "",
        texthl = "DiagnosticSignError",
        linehl = "",
        numhl = "",
      })

      vim.fn.sign_define("DapBreakpointRejected", {
        text = "", -- or "❌"
        texthl = "DiagnosticSignError",
        linehl = "",
        numhl = "",
      })

      vim.fn.sign_define("DapStopped", {
        text = "", -- or "→"
        texthl = "DiagnosticSignWarn",
        linehl = "Visual",
        numhl = "DiagnosticSignWarn",
      })

      -- Automatically open/close DAP UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      -- If you want the UI to close when session ends
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      local opts = { noremap = true, silent = true }

      -- Keymaps
      vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, opts)
      vim.keymap.set("n", "<leader>dc", function() dap.continue() end, opts)
      vim.keymap.set("n", "<leader>do", function() dap.step_over() end, opts)
      vim.keymap.set("n", "<leader>di", function() dap.step_into() end, opts)
      vim.keymap.set("n", "<leader>dO", function() dap.step_out() end, opts)
      vim.keymap.set("n", "<leader>dq", function() require("dap").terminate() end, opts)
      vim.keymap.set("n", "<leader>du", function() dapui.toggle() end, opts)
      vim.keymap.set("n", "<leader>dr", function() dap.repl.toggle() end, opts) -- Toggle DAP REPL
      vim.keymap.set("n", "<leader>de", function() dapui.eval() end, opts) -- Evaluate expression
      vim.keymap.set("n", "<leader>dl", function() dap.run_last() end, opts) -- Run last configuration
    end,
  },
}
