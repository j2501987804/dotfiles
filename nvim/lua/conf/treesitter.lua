local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup {
    ensure_installed = { "c", "lua", "rust", "go" },

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            scope_incremental = "<tab>",
            node_decremental = "<bs>",
        },
    },
}
