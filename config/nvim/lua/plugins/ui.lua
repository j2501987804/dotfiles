return {
    { "nvim-tree/nvim-web-devicons", lazy = true },
    {
        'akinsho/bufferline.nvim',
        version = "*",
        opts = {
            options = {
                -- VSCode 样式：底部细线
                indicator = {
                    style = "underline",
                },

                -- 不要厚重的分隔
                separator_style = "thin",

                -- 行为更像 VSCode
                always_show_bufferline = true,
                show_buffer_close_icons = true,
                show_close_icon = false,
                enforce_regular_tabs = false,

                -- 鼠标也能点
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = { "close" },
                },
            },

            highlights = {
                -- 当前 buffer：只显示 underline
                buffer_selected = {
                    bold = false,
                    italic = false,
                },

                -- 下划线颜色（核心）
                -- indicator_selected = {
                --     fg = "#569CD6", -- VSCode 蓝（可换）
                -- },

                -- 背景全部透明
                fill = {
                    bg = "NONE",
                },
                background = {
                    bg = "NONE",
                },
                tab = {
                    bg = "NONE",
                },
                tab_selected = {
                    bg = "NONE",
                },

                -- 未选中 buffer
                buffer_visible = {
                    bg = "NONE",
                },

                -- 分隔线也透明
                separator = {
                    fg = "NONE",
                    bg = "NONE",
                },
                separator_selected = {
                    fg = "NONE",
                    bg = "NONE",
                },
                separator_visible = {
                    fg = "NONE",
                    bg = "NONE",
                },
            },
        },
    },
    { "tiagovla/scope.nvim",         opts = {} },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "meuter/lualine-so-fancy.nvim",
        },
        opts = {
            options = {
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
                    { "fancy_diff" },
                },
                lualine_c = {
                    -- { "fancy_cwd", substitute_home = true }
                    {
                        "filename",
                        path = 1, -- 0: 仅文件名 | 1: 相对路径 | 2: 绝对路径
                        symbols = {
                            modified = " ●",
                            readonly = " ",
                            unnamed = "[No Name]",
                            newfile = "[New]",
                        },
                    },
                },
                lualine_x = {
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

    -- 'vimpostor/vim-tpipeline',
    {
        "esmuellert/vscode-diff.nvim",
        dependencies = { "MunifTanjim/nui.nvim" },
    },
}
