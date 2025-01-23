return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    opts = {
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
            "bash", "c", "diff", "html", "javascript", "jsdoc", "json", "jsonc",
            "lua", "luadoc", "luap", "markdown", "markdown_inline", "printf", "python",
            "query", "regex", "toml", "tsx", "typescript", "vim", "vimdoc", "xml", "yaml",
            "go", "gomod", "gosum", "gowork",
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<cr>",
                node_incremental = "<cr>",
                scope_incremental = false,
                node_decremental = "<bs>",
            },
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
