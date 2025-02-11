return {
    -- "tomasiser/vim-code-dark",
    -- "navarasu/onedark.nvim",
    -- { "EdenEast/nightfox.nvim" },
    {
        "sainnhe/everforest",
        lazy = false,
        priority = 1000,
        config = function()
            -- Optionally configure and load the colorscheme
            -- directly inside the plugin declaration.
            vim.g.everforest_enable_italic = true
            -- vim.cmd.colorscheme("everforest")
        end,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "everforest",
        },
    },

    -- tab单独buff
    { "tiagovla/scope.nvim", config = true },
    -- {
    --     "folke/tokyonight.nvim",
    --     opts = {
    --         styles = {
    --             comments = { italic = true, bold = false },
    --         },
    --         on_highlights = function(hl, c)
    --             local prompt = "#2d3149"
    --             hl.TelescopeNormal = {
    --                 bg = c.bg_dark,
    --                 fg = c.fg_dark,
    --             }
    --             hl.TelescopeBorder = {
    --                 bg = c.bg_dark,
    --                 fg = c.bg_dark,
    --             }
    --             hl.TelescopePromptNormal = {
    --                 bg = prompt,
    --             }
    --             hl.TelescopePromptBorder = {
    --                 bg = prompt,
    --                 fg = prompt,
    --             }
    --             hl.TelescopePromptTitle = {
    --                 bg = prompt,
    --                 fg = prompt,
    --             }
    --             hl.TelescopePreviewTitle = {
    --                 bg = c.bg_dark,
    --                 fg = c.bg_dark,
    --             }
    --             hl.TelescopeResultsTitle = {
    --                 bg = c.bg_dark,
    --                 fg = c.bg_dark,
    --             }
    --             hl.Pmenu = { bg = "none" }
    --             hl.BlinkCmpMenuBorder = { bg = "none", fg = "#42464e" }
    --             hl.BlinkCmpDocBorder = { bg = "none", fg = "#42464e" }
    --             hl.BlinkCmpMenuSelection = { bg = "#82c092", fg = "black" }
    --         end,
    --     },
    -- },
    {
        "zbirenbaum/copilot.lua",
        opts = {
            suggestion = {
                keymap = {
                    accept = "<tab>", -- handled by nvim-cmp / blink.cmp
                },
            },
        },
    },
    {
        "saghen/blink.cmp",
        opts = {
            keymap = {
                ["<c-k>"] = { "select_prev", "fallback" },
                ["<c-j>"] = { "select_next", "fallback" },
            },
            sources = {
                default = { "lsp", "snippets", "buffer", "path" },
                cmdline = function()
                    local type = vim.fn.getcmdtype()
                    -- Search forward and backward
                    if type == "/" or type == "?" then
                        return { "buffer" }
                    end
                    -- Commands
                    if type == ":" or type == "@" then
                        return { "cmdline" }
                    end
                    return {}
                end,
            },
            completion = {
                list = { selection = { preselect = true, auto_insert = true } },
                menu = {
                    enabled = true,
                    min_width = 30,
                    max_height = 10,
                    border = "rounded",
                    -- border = {
                    --     "♥",
                    --     "─",
                    --     "╮",
                    --     "│",
                    --     "╯",
                    --     "─",
                    --     "╰",
                    --     "│",
                    -- },
                    winblend = 10,
                    -- winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
                    auto_show = true,
                },
                documentation = {
                    -- -- Controls whether the documentation window will automatically show when selecting a completion item
                    -- auto_show = true,
                    -- -- Delay before showing the documentation window
                    -- auto_show_delay_ms = 500,
                    -- -- Delay before updating the documentation window when selecting a new item,
                    -- -- while an existing item is still visible
                    -- update_delay_ms = 50,
                    -- -- Whether to use treesitter highlighting, disable if you run into performance issues
                    treesitter_highlighting = true,
                    window = {
                        min_width = 10,
                        max_width = 80,
                        max_height = 20,
                        border = "rounded",
                        winblend = 10,
                        -- winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
                        -- scrollbar = true,
                        -- direction_priority = {
                        --     menu_north = { "e", "w", "n", "s" },
                        --     menu_south = { "e", "w", "s", "n" },
                        -- },
                    },
                },
            },
        },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {},
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<cr>",
                    node_incremental = "<cr>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        opts = function()
            local keys = require("lazyvim.plugins.lsp.keymaps").get()
            -- disable a keymap
            keys[#keys + 1] = { "<c-k>", mode = "i", false }
        end,
    },
    {
        "ibhagwan/fzf-lua",
        keys = {
            { "<leader>/", false },
            { "<leader>,", false },
            { "<leader>:", false },
            { "<leader>sc", false },
            { "<leader>sC", false },
            { "<leader>sh", false },
            { "<leader>sH", false },
        },
    },
    {
        "stevearc/overseer.nvim",
        opts = {
            templates = { "user.go_build", "user.run", "builtin" },
        },
    },
    {
        "keaising/im-select.nvim",
        opts = {},
    },
}
