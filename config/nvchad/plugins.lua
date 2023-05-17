local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

    -- Override plugin definition options

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- format & linting
            {
                "jose-elias-alvarez/null-ls.nvim",
                config = function()
                    require "custom.configs.null-ls"
                end,
            },
        },
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end, -- Override to setup mason-lspconfig
    },

    -- override plugin configs
    {
        "williamboman/mason.nvim",
        opts = overrides.mason,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = overrides.treesitter,
    },

    {
        "nvim-tree/nvim-tree.lua",
        opts = overrides.nvimtree,
    },

    -- Install a plugin
    {
        "max397574/better-escape.nvim",
        event = "InsertEnter",
        config = function()
            require("better_escape").setup()
        end,
    },

    {
        "glepnir/lspsaga.nvim",
        event = "LspAttach",
        config = function()
            require("lspsaga").setup {}
        end,
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
            --Please make sure you install markdown and markdown_inline parser
            { "nvim-treesitter/nvim-treesitter" },
        },
    },

    {
        "nvim-pack/nvim-spectre",
        keys = {
            {
                "<leader>sp",
                ":lua require('spectre').open_visual({select_word=true}) <CR>",
                desc = "Replace in projects",
            },
            {
                "<leader>sf",
                ":lua require('spectre').open_file_search({select_word=true}) <CR>",
                desc = "Replace in files (Spectre)",
            },
        },
    },

    {
        "folke/todo-comments.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = true,
        keys = { { "<leader>td", "<cmd>TodoTelescope<cr>", desc = "Todo" } },
    },

    {
        "ggandor/leap.nvim",
        config = true,
        keys = {
            { "f", "<Plug>(leap-forward-till)" },
            { "F", "<Plug>(leap-backward-till)" },
        },
    },
}

return plugins
