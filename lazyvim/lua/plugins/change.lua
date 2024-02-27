return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "hrsh7th/cmp-cmdline" },
        opts = function(_, opts)
            local function border(hl_name)
                return {
                    { "╭", hl_name },
                    { "─", hl_name },
                    { "╮", hl_name },
                    { "│", hl_name },
                    { "╯", hl_name },
                    { "─", hl_name },
                    { "╰", hl_name },
                    { "│", hl_name },
                }
            end
            local selectColor = { bg = "#a6e3a1", fg = "#1c1018" }
            vim.api.nvim_set_hl(0, "CmpBorder", { fg = "#4e5882" })
            vim.api.nvim_set_hl(0, "CmpDocBorder", { fg = "#4e5882" })
            vim.api.nvim_set_hl(0, "TelescopeSelection", selectColor)
            vim.api.nvim_set_hl(0, "PmenuSel", selectColor)
            vim.api.nvim_set_hl(0, "Pmenu", selectColor)

            opts.window = {
                completion = {
                    border = border("CmpBorder"),
                    winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
                },
                documentation = {
                    border = border("CmpDocBorder"),
                    winhighlight = "Normal:CmpDoc",
                },
            }

            local cmp = require("cmp")
            opts.mapping = vim.tbl_extend("force", opts.mapping, {
                ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
                ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
            })

            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    { name = "cmdline" },
                }),
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",
        init = function()
            local keys = require("lazyvim.plugins.lsp.keymaps").get()
            -- change a keymap
            -- keys[#keys + 1] = { "K", "<cmd>echo 'hello'<cr>" }
            -- disable a keymap
            keys[#keys + 1] = { "<c-k>", false }
            -- add a keymap
            -- keys[#keys + 1] = { "H", "<cmd>echo 'hello'<cr>" }
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        opts = {
            defaults = {
                prompt_prefix = " ",
                selection_caret = " ",
                mappings = {
                    i = {
                        ["<C-n>"] = require("telescope.actions").cycle_history_next,
                        ["<C-p>"] = require("telescope.actions").cycle_history_prev,
                        ["<C-j>"] = require("telescope.actions").move_selection_next,
                        ["<C-k>"] = require("telescope.actions").move_selection_previous,
                    },
                },
                layout_strategy = "horizontal",
                sorting_strategy = "ascending",
                winblend = 0,
                layout_config = {
                    prompt_position = "top",
                    horizontal = {
                        preview_width = 0.6,
                        results_width = 0.8,
                    },
                    -- vertical = {
                    --     mirror = false,
                    -- },
                },
            },
        },
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        opts = {
            window = {
                mappings = {
                    ["<c-x>"] = "open_split",
                    ["<c-v>"] = "open_vsplit",
                    ["l"] = "open",
                    ["h"] = "close_node",
                },
            },
        },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<CR>",
                    node_incremental = "<CR>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
        },
    },
}
