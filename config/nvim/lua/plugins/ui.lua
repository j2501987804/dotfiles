return {
    { "tiagovla/scope.nvim", opts = {} },
    {
        "catppuccin/nvim",
        lazy = true,
        name = "catppuccin",
    },

    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin",
        },
    }
}
