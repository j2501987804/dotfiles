require 'options'
require 'autocmds'
local map = require 'keymaps'
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    'nvim-lua/plenary.nvim',
    "nvim-tree/nvim-web-devicons",
    {
        'folke/tokyonight.nvim',
        priority = 1000,
        config = function()
            vim.cmd.colorscheme 'tokyonight'
        end,
    },

    { 'nvim-telescope/telescope.nvim', keys = map.telescope },
    { 'numToStr/Comment.nvim',         opts = {},           keys = map.comment },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = { 'bash', 'go', 'python' },
                highlight = {
                    enable = true,
                    use_languagetree = true,
                },
                indent = { enable = true },
            }
        end
    },

    {
        "nvim-tree/nvim-tree.lua",
        keys = map.nvimtree,
        opts = {},
    },

    {
        "glepnir/lspsaga.nvim",
        event = "LspAttach",
        opts = {},
        keys = map.lspsaga,
    },

    {
        "nvim-pack/nvim-spectre",
        keys = map.spectre,
    },

    { "echasnovski/mini.statusline", opts = {} },

    { 'echasnovski/mini.pairs',      opts = {} },



    { import = 'extra.cmp' },
    { import = 'extra.lsp' },
})
