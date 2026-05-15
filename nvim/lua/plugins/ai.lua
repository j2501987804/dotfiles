return {
    {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        opts = {
            suggestion = {
                enabled = false,
                auto_trigger = true,
                hide_during_completion = true,
                keymap = {
                    accept = false, -- handled by nvim-cmp / blink.cmp
                    next = "<M-]>",
                    prev = "<M-[>",
                },
            },
            panel = { enabled = false },
            filetypes = {
                markdown = true,
                help = true,
            },
        }
    },

    {
        "yetone/avante.nvim",
        build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
            or "make",
        dependencies = {
            "zbirenbaum/copilot.lua",
            "MunifTanjim/nui.nvim",
            {"MeanderingProgrammer/render-markdown.nvim",opts ={}},
            {"HakonHarnes/img-clip.nvim",opts ={}},
        },
        opts = {
            provider = "copilot",
            selection = {
                hint_display = "none",
            },
            behaviour = {
                auto_set_keymaps = false,
            },
        },
        keys = {
            { "<leader>aa", "<cmd>AvanteAsk<CR>",            desc = "Ask Avante" },
            { "<leader>ac", "<cmd>AvanteChat<CR>",           desc = "Chat with Avante" },
            { "<leader>ae", "<cmd>AvanteEdit<CR>",           desc = "Edit Avante" },
            { "<leader>af", "<cmd>AvanteFocus<CR>",          desc = "Focus Avante" },
            { "<leader>ah", "<cmd>AvanteHistory<CR>",        desc = "Avante History" },
            { "<leader>am", "<cmd>AvanteModels<CR>",         desc = "Select Avante Model" },
            { "<leader>an", "<cmd>AvanteChatNew<CR>",        desc = "New Avante Chat" },
            { "<leader>ap", "<cmd>AvanteSwitchProvider<CR>", desc = "Switch Avante Provider" },
            { "<leader>ar", "<cmd>AvanteRefresh<CR>",        desc = "Refresh Avante" },
            { "<leader>as", "<cmd>AvanteStop<CR>",           desc = "Stop Avante" },
            { "<leader>at", "<cmd>AvanteToggle<CR>",         desc = "Toggle Avante" },
        },
    }
}
