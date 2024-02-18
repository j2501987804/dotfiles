-- if true then return {} end
return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        -- priority = 1000,
        opts = {
            flavour = "macchiato",
            integrations = {
                telescope = {
                    enabled = true,
                    style = "nvchad",
                },
            },
            -- transparent_background = true,
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
            "nvim-telescope/telescope-fzy-native.nvim",
            config = function()
                require("telescope").load_extension("fzy_native")
            end,
        },
    },
}
