return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
        },
        { 'nvim-telescope/telescope-ui-select.nvim' },
        {
            'gbprod/yanky.nvim',
            opts = {
                recommended = true,
                desc = "Better Yank/Paste",
                event = "LazyFile",
                opts = {
                    highlight = { timer = 150 },
                },
            }
        },
    },
    opts = {
        extensions = {
            ['ui-select'] = {
                require('telescope.themes').get_dropdown(),
            },
        },
        defaults = {
            prompt_prefix = " ",
            selection_caret = " ",
            mappings = {
                i = {
                    ["<C-n>"] = require "telescope.actions".cycle_history_next,
                    ["<C-p>"] = require "telescope.actions".cycle_history_prev,
                    ["<C-j>"] = require "telescope.actions".move_selection_next,
                    ["<C-k>"] = require "telescope.actions".move_selection_previous,
                }
            },
            layout_config = {
                horizontal = {
                    prompt_position = "top",
                    preview_width = 0.6,
                    results_width = 0.8,
                },
                vertical = {
                    mirror = false,
                },
            },
        },
    },
    init = function()
        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')
        require("telescope").load_extension("yank_history")
    end,
    keys = {
        { "<leader>f",        ":Telescope fd<cr>",                      desc = "search file" },
        { "<leader><leader>", ":Telescope buffers<cr>",                 desc = "search buffers" },
        { "<leader>sw",       ":Telescope live_grep<cr>",               desc = "search word" },
        { "<leader>sm",       ":Telescope marks<cr>",                   desc = "search marks" },
        { "<leader>sq",       ":Telescope quickfix<cr>",                desc = "search quickfix" },
        { "<leader>ss",       ":Telescope lsp_document_symbols<cr>",    desc = "lsp struct" },
        { 'gr',               '<cmd>Telescope lsp_references<CR>',      desc = 'lsp references' },
        { 'gI',               '<cmd>Telescope lsp_implementations<CR>', desc = 'lsp implementations' },
        {
            "<leader>p",
            function()
                require("telescope").extensions.yank_history.yank_history({})
            end,
            mode = { "n", "x" },
            desc = "Open Yank History",
        },
    }
}
