return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    opts = {
        sources = { "filesystem", "buffers", "git_status" },
        open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
        window = {
            mappings = {
                ["l"] = "open",
                ["h"] = "close_node",
            },
        },
    },
    keys = {
        {
            "<leader>e",
            function()
                require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
            end,
            desc = "Explorer NeoTree (Root Dir)",
        },
        {
            "<leader>ge",
            function()
                require("neo-tree.command").execute({ source = "git_status", toggle = true })
            end,
            desc = "Git Explorer",
        },
        {
            "<leader>be",
            function()
                require("neo-tree.command").execute({ source = "buffers", toggle = true })
            end,
            desc = "Buffer Explorer",
        },
    }
}
