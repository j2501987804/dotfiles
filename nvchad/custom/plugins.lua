local overrides = require("custom.configs.overrides")

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
                    require("custom.configs.null-ls")
                end,
            },
        },
        config = function()
            require("plugins.configs.lspconfig")
            require("custom.configs.lspconfig")
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

    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        keys = {
            { "<leader>f", "<cmd>Telescope find_files<cr>",          desc = "Find files" },
            { "<leader>b", "<cmd>Telescope buffers<cr>",             desc = "Find buffers" },
            { "<leader>F", "<cmd>Telescope live_grep theme=ivy<cr>", desc = "Find Text" },
        },
        opts = overrides.telescope,
    },

    {
        "hrsh7th/nvim-cmp",
        opts = overrides.cmp,
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
        "mbbill/undotree",
        keys = { { "<leader>2", ":UndotreeToggle<cr>", desc = "Undo" } },
    },

    {
        "Pocco81/AutoSave.nvim",
        event = { "InsertLeave", "TextChanged" },
    },

    {
        "simrat39/symbols-outline.nvim",
        config = true,
        keys = { { "<leader>3", ":SymbolsOutline<CR>", desc = "SymbolsOutline" } },
    },

    {
        "RRethy/vim-illuminate",
        event = "BufReadPost",
        opts = { delay = 200 },
        config = function(_, opts)
            require("illuminate").configure(opts)
        end,
        keys = {
            {
                "]]",
                function()
                    require("illuminate").goto_next_reference(false)
                end,
                desc = "Next Reference",
            },
            {
                "[[",
                function()
                    require("illuminate").goto_prev_reference(false)
                end,
                desc = "Prev Reference",
            },
        },
    },

    { "f-person/git-blame.nvim", event = "BufReadPre" },

    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        build = ":Copilot auth",
        opts = {
            suggestion = { enabled = false },
            panel = { enabled = false },
        },
    },
    -- To make a plugin not be loaded
    -- {
    --   "NvChad/nvim-colorizer.lua",
    --   enabled = false
    -- },

    -- All NvChad plugins are lazy-loaded by default
    -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
    -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
    -- {
    --   "mg979/vim-visual-multi",
    --   lazy = false,
    -- }
}

return plugins
