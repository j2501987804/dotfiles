require 'options'
require 'autocmds'
local map = require 'keymaps'
local conf = require 'conf'
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system { 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable',
        lazypath }
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
    'nvim-lua/plenary.nvim',
    "nvim-tree/nvim-web-devicons",
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme 'catppuccin'
        end,
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = { "BufReadPost", "BufNewFile" },
        config = conf.treesitter,
    },

    {
        "glepnir/lspsaga.nvim",
        event = "LspAttach",
        opts = {},
        keys = map.lspsaga,
    },

    {
        "RRethy/vim-illuminate",
        event = { "BufReadPost", "BufNewFile" },
        config = conf.illuminate,
    },

    {
        'nvim-telescope/telescope.nvim',
        keys = map.telescope,
        config = conf.telescope,
    },

    {
        "nvim-tree/nvim-tree.lua",
        keys = map.nvimtree,
        opts = {
            update_focused_file = {
                enable = true,
                update_cwd = true,
            },
        }
    },

    { "ggandor/leap.nvim",        keys = map.leap },
    { "nvim-pack/nvim-spectre",   keys = map.specte },
    { 'numToStr/Comment.nvim',    keys = map.comment, opts = {} },
    { "folke/todo-comments.nvim", keys = map.todo,    opts = {} },

    { import = 'extra.cmp' },
    { import = 'extra.lsp' },
    { import = 'extra.ui' },
    { import = 'extra.lang' },
    { import = 'extra.dap' },
})
