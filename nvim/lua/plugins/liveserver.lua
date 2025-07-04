return {
  "aurum77/live-server.nvim",
  build = function()
    require("live_server.util").install()
  end,
  cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
  -- If this plugin needs a config table, add opts = {} or config = function() end
}
