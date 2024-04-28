return {
    {
        "stevearc/conform.nvim",
        event = 'BufWritePre', -- uncomment for format on save
        config = function()
            require "configs.conform"
        end,
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- require("nvchad.configs.lspconfig").defaults()
            require "configs.lspconfig"
        end,
    },

    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "lua-language-server",
                "stylua",
                "gopls",
                "goimports",
                "pyright",
                "black",
            },
        },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim",
                "lua",
                "vimdoc",
                "go",
                "gomod",
            },
        },
    },

    {
        "nvim-telescope/telescope.nvim",
        opts = function()
            local conf = require "nvchad.configs.telescope"
            conf.defaults.mappings.i = {
                ["<C-n>"] = require("telescope.actions").cycle_history_next,
                ["<C-p>"] = require("telescope.actions").cycle_history_prev,
                ["<C-j>"] = require("telescope.actions").move_selection_next,
                ["<C-k>"] = require("telescope.actions").move_selection_previous,
            }
            return conf
        end,
    },

    {
        "hrsh7th/nvim-cmp",
        dependencies = { "hrsh7th/cmp-cmdline" },
        opts = function()
            local cmp = require "cmp"
            local conf = require "nvchad.configs.cmp"

            local mapping = {
                ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
                ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
            }
            conf.mapping = vim.tbl_extend("keep", mapping, conf.mapping)
            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })

            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    { name = "cmdline" },
                }),
                matching = { disallow_symbol_nonprefix_matching = false },
            })
            return conf
        end,
    },

    {
        "ggandor/leap.nvim",
        keys = {
            {
                "s",
                function()
                    require("leap").leap {
                        target_windows = require("leap.user").get_focusable_windows(),
                    }
                end,
            },
        },
    },

    {
        "nvim-pack/nvim-spectre",
        keys = {
            {
                "<leader>R",
                "<cmd>lua require('spectre').open_visual({select_word=true}) <CR>",
                desc = "Replace in projects",
            },
        },
    },
}
