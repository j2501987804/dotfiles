vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.keymap.set

-- general mappings
map("n", "<C-s>", "<cmd> w <CR>")
map("i", "<C-s>", "<ESC><cmd> w <CR>")
map("n", "<leader>q", "<cmd> q <CR>")
map("n", ";", ":")

-- Clear highlights
map("n", "<ESC>", "<cmd>nohlsearch<CR>")

-- Better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Resize with arrows
map("n", "<S-Up>", ":resize -2<CR>")
map("n", "<S-Down>", ":resize +2<CR>")
map("n", "<S-Left>", ":vertical resize -2<CR>")
map("n", "<S-Right>", ":vertical resize +2<CR>")

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")
map("v", "p", '"_dP')
map('v', 'H', '^')
map('v', 'L', '$')
map('n', 'H', '^')
map('n', 'L', '$')

-- insert --
map("i", "jk", "<ESC>")
map("i", "<C-h>", "<Left>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")
map("i", "<C-l>", "<Right>")

local M = {}
M.telescope = {
    { '<leader>f', ':Telescope fd<CR>' },
    { '<leader>b', ':Telescope buffers<CR>' },
    { '<leader>F', ':Telescope live_grep<CR>' },
}

M.nvimtree = { { '<leader>e', ':NvimTreeToggle<CR>' } }

M.comment = {
    { "<leader>/", function()
        require("Comment.api").toggle.linewise.current()
    end },

    { "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", mode = 'v' },
}

M.lspsaga = {
    { "K",          "<cmd>Lspsaga hover_doc<CR>", },
    { "gh",         "<cmd>Lspsaga lsp_finder<CR>", },
    { "gd",         "<cmd>Lspsaga goto_definition<CR>", },
    { "<leader>ca", "<cmd>Lspsaga code_action<CR>", },
    { "gr",         "<cmd>Lspsaga rename<CR>", },
    { "<leader>o",  "<cmd>Lspsaga outline<CR>", },
    { "<leader>lw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", },
    { "<leader>lc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", },
    { "<A-d>",      "<cmd>Lspsaga term_toggle<CR>",                mode = { 'n', 't' } },
}

M.specte = {
    {
        "<leader>s",
        ":lua require('spectre').open_visual({select_word=true}) <CR>",
        desc = "Replace in projects",
    },
}
return M
