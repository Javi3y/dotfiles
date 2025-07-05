require("mason").setup({})

local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup({})

require("lspconfig").gopls.setup({})
require("lspconfig").lua_ls.setup({})
require("lspconfig").pyright.setup({})
require("lspconfig").elixirls.setup({})
require("lspconfig").clangd.setup({})
require("lspconfig").html.setup({})
-- require("lspconfig").vuels.setup({})
require("lspconfig").ts_ls.setup({})

local cmp = require('cmp')

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-y'] = cmp.mapping.confirm(),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'luasnip', max_item_count = 10 },
    }),
})
lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "]d", function() vim.lsp.buf.goto_next() end, opts)
    vim.keymap.set("n", "[d", function() vim.lsp.buf.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
end)
