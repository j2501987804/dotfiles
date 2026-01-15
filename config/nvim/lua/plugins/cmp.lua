return {
    {
        'saghen/blink.cmp',
        version = '1.7.*',
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            'rafamadriz/friendly-snippets',
        },
        opts = {
            keymap = {
                preset = "enter",
                ["<C-j>"] = { "select_next", "fallback" },
                ["<C-k>"] = { "select_prev", "fallback" },
            },
            signature = { enabled = true },
            completion = {
                documentation = { auto_show = true, auto_show_delay_ms = 500 },
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
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    }
}
