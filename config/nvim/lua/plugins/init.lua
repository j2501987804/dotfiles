return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                ['*'] = {
                    keys = {
                        { "<c-k>", false,                                              mode = "i" },
                        -- Capability-based keymap (only set if server supports it)
                        { "<c-s>", function() return vim.lsp.buf.signature_help() end, mode = "i", desc = "Signature Help", has = "signatureHelp" },
                    },
                },
            },
        },
    },

    {
        'saghen/blink.cmp',
        opts = {
            keymap = {
                preset = "enter",
                ["<C-j>"] = { "select_next", "fallback" },
                ["<C-k>"] = { "select_prev", "fallback" },
            },
            signature = { enabled = true },
            completion = {
                -- documentation = {
                --     auto_show = true,
                --     auto_show_delay_ms = 500,
                -- },
                menu = {
                    auto_show = true,
                    draw = {
                        treesitter = { "lsp" },
                        columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
                    },
                },
            },
        }
    },
}
