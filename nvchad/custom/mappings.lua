---@type MappingsTable
local M = {}

M.disabled = {
    n = {
        ["<leader>ff"] = "",
        ["<leader>fa"] = "",
        ["<leader>fw"] = "",
        ["<leader>fb"] = "",
        ["<leader>fh"] = "",
        ["<leader>fo"] = "",
        ["<leader>fz"] = "",
        ["<leader>fm"] = "",
    },
}

M.general = {
    n = {
        [";"] = { ":", "enter command mode", opts = { nowait = true } },
        ["<leader>q"] = { ":q<CR>", "Quit" },
        ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
    },
}

M.lspconfig = {
    n = {
        ["<leader>lf"] = {
            function()
                vim.lsp.buf.format { async = true }
            end,
            "lsp formatting",
        },
        ["<leader>ls"] = { ":LspRestart<CR>", "LspRestart" },
    },
}
return M
