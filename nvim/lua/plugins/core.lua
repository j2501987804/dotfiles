return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                pyright = {},
                gopls = {},
            },
        },
    },

    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "stylua",
                "shellcheck",
                "shfmt",
                "flake8",

                -- go
                "goimports-reviser",
            },
        },
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "mason.nvim" },
        opts = function()
            local nls = require("null-ls")
            local d = nls.builtins.diagnostics
            local f = nls.builtins.formatting
            return {
                root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
                sources = {
                    f.stylua,
                    f.shfmt,
                    f.goimports_reviser,
                    d.flake8,
                },
            }
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "go",
                "gomod",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<Enter>",
                    node_incremental = "<Enter>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
        },
    },

    {
        "telescope.nvim",
        dependencies = {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            config = function()
                require("telescope").load_extension("fzf")
            end,
        },
        keys = function()
            return {
                { "<leader>f", "<cmd>Telescope fd<cr>", desc = "find files" },
                { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "find buffers" },
                { "<leader>F", "<cmd>Telescope live_grep theme=ivy<cr>", desc = "find text" },
            }
        end,
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        keys = function()
            return {
                {
                    "<leader>e",
                    function()
                        require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })
                    end,
                    desc = "Explorer neotree",
                },
            }
        end,
    },
}
