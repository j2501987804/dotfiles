require("snacks").setup({
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = {
        enabled = true,
        timeout = 3000,
    },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
        notification = {
            -- wo = { wrap = true } -- Wrap notifications
        }
    },
    picker = {
        actions = require("trouble.sources.snacks").actions,
        win = {
            input = {
                keys = {
                    ["<c-q>"] = {
                        "trouble_open",
                        mode = { "n", "i" },
                    },
                },
            },
        },
    }
})

vim.api.nvim_set_hl(0, "SnacksPickerListCursorLine", {link = "PmenuSel"})
