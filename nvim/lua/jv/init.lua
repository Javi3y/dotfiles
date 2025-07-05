require('jv.lazy')
require('jv.plugin')
require('jv.remap')

if vim.g.neovide then
  vim.g.neovide_transparency = 0.9
  vim.cmd('hi Normal guibg=#282828')
  vim.opt.guifont = "FiraCode Nerd Font:h9"
end
