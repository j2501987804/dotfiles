return {
    'nvim-tree/nvim-web-devicons',
    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        opts = {
            commentStyle = { italic = true },
            overrides = function(colors)
                local theme = colors.theme
                return {
                    NormalFloat = { bg = "none" },
                    FloatBorder = { bg = "none" },
                    FloatTitle = { bg = "none" },


                    Pmenu = { bg = "none" },              -- add `blend = vim.o.pumblend` to enable transparency
                    BlinkCmpMenuBorder = { bg = "none" }, -- add `blend = vim.o.pumblend` to enable transparency
                    BlinkCmpMenuSelection = { bg = "#82c092", fg = "black" }
                }
            end,
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "meuter/lualine-so-fancy.nvim",
            'AndreM222/copilot-lualine',
        },
        opts = {
            options = {
                theme = "seoul256",
                component_separators = { left = "│", right = "│" },
                section_separators = { left = "", right = "" },
                globalstatus = true,
                refresh = {
                    statusline = 100,
                },
            },
            sections = {
                lualine_a = {
                    { "fancy_mode", width = 3 }
                },
                lualine_b = {
                    { "fancy_branch" },
                },
                lualine_c = {
                    { "fancy_diff" },
                    { "fancy_cwd", substitute_home = true }
                },
                lualine_x = {
                    { "copilot" },
                    { "fancy_macro" },
                    { "fancy_diagnostics" },
                    { "fancy_searchcount" },
                    { "fancy_location" },
                },
                lualine_y = {
                    { "fancy_filetype", ts_icon = "" }
                },
                lualine_z = {
                    { "fancy_lsp_servers" }
                },
            }
        },
    },
    {
        "folke/which-key.nvim",
        opts = {
            preset = "helix",
            spec = {
                {
                    mode = { "n", "v" },
                    { "<leader><tab>", group = "tabs" },
                    { "<leader>c", group = "code" },
                    { "<leader>d", group = "debug" },
                    { "<leader>dp", group = "profiler" },
                    { "<leader>f", group = "file/find" },
                    { "<leader>g", group = "git" },
                    { "<leader>gh", group = "hunks" },
                    { "<leader>q", group = "quit/session" },
                    { "<leader>s", group = "search" },
                    { "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
                    { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
                    { "[", group = "prev" },
                    { "]", group = "next" },
                    { "g", group = "goto" },
                    { "gs", group = "surround" },
                    { "z", group = "fold" },
                    {
                        "<leader>b",
                        group = "buffer",
                        expand = function()
                            return require("which-key.extras").expand.buf()
                        end,
                    },
                }
            },
        },
    },
    { 'akinsho/bufferline.nvim', opts = {} },
}
