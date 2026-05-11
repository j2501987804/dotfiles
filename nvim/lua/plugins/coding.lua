require("mini.pairs").setup()
require('blink.cmp').setup({
    keymap = {
        preset = 'enter',
        ['<c-k>'] = { 'select_prev', 'fallback' },
        ['<c-j>'] = { 'select_next', 'fallback' },
    },
    completion = {
        documentation = { auto_show = true, window = { winblend = 0 } },
        menu = { winblend = 0 },
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    signature = {
        enabled = true,
    }
})
