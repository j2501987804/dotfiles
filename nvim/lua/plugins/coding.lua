return {
    "Saghen/blink.cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        'rafamadriz/friendly-snippets',
        "Kaiser-Yang/blink-cmp-avante",
        "fang2hou/blink-copilot",
        { "nvim-mini/mini.pairs", opts = {} }
    },
    version = "1.*",
    opts = {
        keymap = {
            preset = 'enter',
            ['<c-k>'] = { 'select_prev', 'fallback' },
            ['<c-j>'] = { 'select_next', 'fallback' },
        },
        completion = {
            documentation = { auto_show = true, window = { winblend = 0 } },
            menu = {
                winblend = 0,
                draw = {
                    columns = {
                        { "kind_icon" },
                        { "label",    "label_description", gap = 1 },
                        { "kind" }
                    },
                }
            },
        },
        sources = {
            default = { "copilot", "avante", 'lsp', 'path', 'snippets', 'buffer' },
            providers = {
                avante = { module = "blink-cmp-avante", name = "Avante" },
                copilot = {
                    name = "copilot",
                    module = "blink-copilot",
                    score_offset = 100,
                    async = true,
                },
            },
        },
        signature = {
            enabled = true,
        }
    },
    config = function(_, opts)
        dofile(vim.g.base46_cache .. "blink")
        require('blink.cmp').setup(opts)
    end
}
