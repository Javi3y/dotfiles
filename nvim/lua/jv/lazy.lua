-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- import your plugins
        {
            { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },
            { "luisiacc/gruvbox-baby",    priority = 1000 },
            { "sainnhe/gruvbox-material", priority = 1000 },
            {
                'nvim-telescope/telescope.nvim',
                tag = '0.1.5',
                dependencies = { 'nvim-lua/plenary.nvim' }
            },
            'norcalli/nvim-colorizer.lua',
            -- "heavenshell/vim-jinja",
            -- "https://gitlab.com/HiPhish/jinja.vim",
            'mbbill/undotree',
            'nvim-tree/nvim-tree.lua',
            'nvim-tree/nvim-web-devicons',
            'echasnovski/mini.sessions',
            'echasnovski/mini.ai',
            'echasnovski/mini.starter',
            'lewis6991/gitsigns.nvim',
            'romgrk/barbar.nvim',
            {
                'nvim-lualine/lualine.nvim',
                dependencies = { 'nvim-tree/nvim-web-devicons' }
            },
            -- 'vim-airline/vim-airline',
            -- 'vim-airline/vim-airline-themes',
            'tpope/vim-fugitive',
            {
                'nvim-treesitter/nvim-treesitter',
                build = ':TSUpdate'
            },
            {
                'VonHeikemen/lsp-zero.nvim',
                branch = 'v3.x',
                dependencies = {
                    'williamboman/mason.nvim',
                    'williamboman/mason-lspconfig.nvim',
                    'neovim/nvim-lspconfig',
                    'hrsh7th/nvim-cmp',
                    'hrsh7th/cmp-nvim-lsp',
                    'L3MON4D3/LuaSnip',
                }
            },
            {
                "rezaqomy/leetcode.nvim",
                build = ":TSUpdate html",
                cond = leet_arg ~= vim.fn.argv(0, -1),
                init = function()
                    vim.g.leetcode_nvim_arg = leet_arg
                end,
                dependencies = {
                    "nvim-telescope/telescope.nvim",
                    "nvim-lua/plenary.nvim",
                    "MunifTanjim/nui.nvim",
                },
                config = function()
                    require("leetcode").setup()
                end,
            },

            "lukas-reineke/indent-blankline.nvim",

            {
                "Pocco81/auto-save.nvim"
            },

            'rcarriga/nvim-notify',

            {
                "aurum77/live-server.nvim",
                build = function()
                    require("live_server.util").install()
                end,
                cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
            },

            {
                "aserowy/tmux.nvim",
                config = function()
                    require("tmux").setup()
                end,
            },

            'nvimtools/none-ls.nvim',
            'jay-babu/mason-null-ls.nvim',
            {
                '2kabhishek/exercism.nvim',
                cmd = {
                    'ExercismLanguages',
                    'ExercismList',
                    'ExercismSubmit',
                    'ExercismTest',
                },
                dependencies = {
                    '2kabhishek/utils.nvim',
                    'stevearc/dressing.nvim',
                    '2kabhishek/termim.nvim',
                },
                -- Add your custom configs here, keep it blank for default configs (required)
                opts = {},
            },
            {
                'MeanderingProgrammer/render-markdown.nvim',
                dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use the mini.nvim suite
                ---@module 'render-markdown'
                ---@type render.md.UserConfig
                opts = {},
            },
            {
                "kevinhwang91/nvim-ufo",
                dependencies = { "kevinhwang91/promise-async" },
                config = function()
                    require("ufo").setup()
                end,
            }

        },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "gruvbox-baby" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})
