require'nvim-treesitter.configs'.setup {
  ensure_installed = { "python", "c", "lua", "markdown", "elixir", "heex", "eex" , "bash", "yaml", "toml"},
  sync_install = true,
  auto_install = true,

  ignore_install = { "javascript" },

  highlight = {
    enable = true,
    disable = { },
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  },
}
