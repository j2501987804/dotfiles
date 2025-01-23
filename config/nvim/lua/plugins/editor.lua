return {
    {
        'numToStr/Comment.nvim',
        opts = {}
    },
    {
        "folke/flash.nvim",
        opts = {},
        keys = {
            { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S",     mode = { "n", "o", "x" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
    },
    {
        'lewis6991/gitsigns.nvim',
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
    },

    {
        "folke/todo-comments.nvim",
        lazy = false,
        opts = {},
        keys = { { '<leader>st', '<cmd>TodoTelescope<CR>', desc = 'todo' } }
    },
    { "NvChad/nvim-colorizer.lua", opts = {} },
    -- copilot
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        build = ":Copilot auth",
        event = "InsertEnter",
        opts = {
            suggestion = {
                auto_trigger = true,
                keymap = {
                    accept = '<tab>', -- handled by nvim-cmp / blink.cmp
                    next = "<M-]>",
                    prev = "<M-[>",
                },
            },
            panel = { enabled = false },
            filetypes = {
                markdown = true,
                help = true,
            },
        },
    },
}
