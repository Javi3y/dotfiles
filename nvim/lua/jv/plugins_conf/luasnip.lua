require('luasnip.loaders.from_vscode').lazy_load()

vim.keymap.set({ 'i', 's' }, '<C-J>', '<CMD>lua require("luasnip").jump(1)<CR>')
vim.keymap.set({ 'i', 's' }, '<C-K>', '<CMD>lua require("luasnip").jump(-1)<CR>')

