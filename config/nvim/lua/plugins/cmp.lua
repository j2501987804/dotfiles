return {
    "saghen/blink.cmp",
    opts = {
        keymap = {
            -- preset = "enter",
            ["<c-k>"] = { "select_prev", "fallback" },
            ["<c-j>"] = { "select_next", "fallback" },
        },
        -- cmdline = {
        --     enabled = true,
        --     keymap = {
        --         preset = "cmdline",
        --         ["<c-k>"] = { "select_prev", "fallback" },
        --         ["<c-j>"] = { "select_next", "fallback" },
        --     },
        --     sources = function()
        --         local type = vim.fn.getcmdtype()
        --         -- Search forward and backward
        --         if type == "/" or type == "?" then
        --             return { "buffer" }
        --         end
        --         -- Commands
        --         if type == ":" or type == "@" then
        --             return { "cmdline" }
        --         end
        --         return {}
        --     end,
        --     completion = {
        --         trigger = {
        --             show_on_blocked_trigger_characters = {},
        --             show_on_x_blocked_trigger_characters = {},
        --         },
        --         list = {
        --             selection = { preselect = true, auto_insert = false },
        --         },
        --         menu = { auto_show = true },
        --         ghost_text = { enabled = true },
        --     },
        -- },
        sources = {
            default = { "lsp", "snippets", "buffer", "path" },
        },
        completion = {
            list = { selection = { preselect = true, auto_insert = false } },
            menu = {
                enabled = true,
                min_width = 30,
                max_height = 10,
                border = {
                    "♥",
                    "─",
                    "╮",
                    "│",
                    "╯",
                    "─",
                    "╰",
                    "│",
                },
                -- winblend = 10,
                -- winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
                auto_show = true,
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
                update_delay_ms = 50,
                treesitter_highlighting = true,
                window = {
                    min_width = 10,
                    max_width = 80,
                    max_height = 20,
                    border = "rounded",
                    -- winblend = 10,
                },
            },
        },
    },
}
