return {
    -- theme
    -- {
    --   "catppuccin/nvim",
    --   name = "catppuccin",
    --   opts = {
    --     integrations = {
    --       notify = true,
    --       mini = true,
    --     },
    --   },
    -- },
    -- {
    --   "LazyVim/LazyVim",
    --   opts = {
    --     colorscheme = "catppuccin",
    --   },
    -- },

    {
        "NvChad/nvim-colorizer.lua",
        event = { "BufReadPre", "BufNewFile" },
        config = true,
    },
}
