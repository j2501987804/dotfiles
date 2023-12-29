-- if true then return {} end
return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        -- priority = 1000,
        opts = {
            flavour = "macchiato",
            integrations = {
                -- telescope = {
                --     enabled = true,
                --     style = "nvchad"
                -- }
            },
        },
    },

    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin",
        },
    },

    {
        "telescope.nvim",
        dependencies = {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            config = function()
                require("telescope").load_extension("fzf")
            end,
        },
    },
}
