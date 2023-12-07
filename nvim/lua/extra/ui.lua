return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = "meuter/lualine-so-fancy.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                theme = "auto",
                globalstatus = true,
                refresh = {
                    statusline = 100,
                },
            },
            sections = {
                lualine_a = {
                    { "fancy_mode", width = 6 },
                },
                lualine_b = {
                    { "fancy_branch" },
                },
                lualine_c = {
                    { "fancy_diff" },
                    { "fancy_cwd", substitute_home = true }
                },
                lualine_x = {
                    { "fancy_macro" },
                    { "fancy_diagnostics" },
                    { "fancy_searchcount" },
                    { "fancy_location" },
                },
                lualine_y = {
                    { "fancy_filetype", ts_icon = "" },
                },
                lualine_z = {
                    { "fancy_lsp_servers" }
                },
            }
        },
    },

    -- indent guides for Neovim
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            indent = {
                char = "│",
                tab_char = "│",
            },
            scope = { enabled = false },
        },
        main = "ibl",
    },

    -- active indent guide and indent text objects
    {
        "echasnovski/mini.indentscope",
        version = false, -- wait till new 0.7.0 release to put it back on semver
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            -- symbol = "▏",
            symbol = "│",
            options = { try_as_border = true },
        },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "help",
                    "alpha",
                    "dashboard",
                    "NvimTree",
                    "Trouble",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                    "lazyterm",
                },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
        end,
    },

    {
        'akinsho/bufferline.nvim',
        opts = {
            options = {
                close_command = "bdelete!",
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        text_align = "left",
                        separator = true,
                    }
                },
            }
        },
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {}
    },

    {
        'lewis6991/gitsigns.nvim',
        event = { "BufReadPre", "BufNewFile" },
        config = true,
        keys = require("keymaps").gitsigns
    }
}
