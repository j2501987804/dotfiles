vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.keymap.set

-- general mappings
map("n", "<C-s>", "<cmd> w <CR>")
map("i", "<C-s>", "<ESC><cmd> w <CR>")
map("n", "<leader>q", "<cmd> q <CR>")
map("n", "<leader>L", "<cmd> Lazy <CR>")
map("n", "<leader>nf", "<cmd> enew <CR>")
map("n", "<leader>x", "<cmd> bdelete! <CR>")
map("n", "<Tab>", "<cmd> BufferLineCycleNext <CR>")
map("n", "<S-Tab>", "<cmd> BufferLineCyclePrev <CR>")
map("n", "<leader>nf", "<cmd> enew <CR>")
map("n", ";", ":")

-- Clear highlights
map("n", "<ESC>", "<cmd>nohlsearch<CR>")

-- Better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Resize with arrows
map("n", "<S-Up>", "<cmd>resize -2<CR>")
map("n", "<S-Down>", "<cmd>resize +2<CR>")
map("n", "<S-Left>", "<cmd>vertical resize -2<CR>")
map("n", "<S-Right>", "<cmd>vertical resize +2<CR>")

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
    { '<leader>f', '<cmd>Telescope fd theme=dropdown previewer=false<CR>',       desc = 'find file' },
    { '<leader>p', '<cmd>Telescope projects theme=dropdown previewer=false<CR>', desc = 'projects' },
    { '<leader>b', '<cmd>Telescope buffers theme=dropdown previewer=false<CR>',  desc = 'find buff' },
    { '<leader>F', '<cmd>Telescope live_grep  theme=ivy<CR>',                    desc = 'find word' },
}

M.nvimtree = {
    { '<leader>e', '<cmd>NvimTreeToggle<CR>', desc = 'nvimtree' },
}

M.comment = {
    {
        "<leader>/",
        function()
            require("Comment.api").toggle.linewise.current()
        end,
        desc = 'comment'
    },
    {
        "<leader>/",
        "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
        mode = 'v',
        desc = 'comment'
    },
}

M.lspsaga = {
    { "K",          "<cmd>Lspsaga hover_doc<CR>",                  desc = 'lsp hover_doc' },
    { "gh",         "<cmd>Lspsaga finder<CR>",                     desc = 'lsp finder' },
    { "gd",         "<cmd>Lspsaga goto_definition<CR>",            desc = 'definition' },
    { "<leader>la", "<cmd>Lspsaga code_action<CR>",                desc = 'code action' },
    { "gr",         "<cmd>Lspsaga rename<CR>",                     desc = 'rename' },
    { "<leader>lo", "<cmd>Lspsaga outline<CR>",                    desc = 'outline' },
    { "<leader>lw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", desc = 'workspace diagnostics' },
    { "<leader>lc", "<cmd>Lspsaga show_cursor_diagnostics<CR>",    desc = 'cursor diagnostics' },
    { "<A-d>",      "<cmd>Lspsaga term_toggle<CR>",                mode = { 'n', 't' },           desc = 'term' },
}

M.specte = {
    {
        "<leader>r",
        "<cmd>lua require('spectre').open_visual({select_word=true}) <CR>",
        desc = "Replace in projects",
    },
}

M.leap = {
    {
        "s",
        function()
            local current_window = vim.fn.win_getid()
            require('leap').leap { target_windows = { current_window } }
        end
    }
}

M.gitsigns = {
    { "[g",         '<cmd>Gitsigns preview_hunk<CR>', desc = 'preview_hunk' },
    { "]g",         '<cmd>Gitsigns next_hunk<CR>',    desc = 'next_hunk' },
    { "<leader>gb", '<cmd>Gitsigns blame_line<CR>',   desc = 'blame_line' },
}

M.todo = { { '<leader>td', '<cmd>TodoTelescope<CR>', desc = 'todo' } }

M.session = { { '<leader>sl', '<cmd>lua require("persistence").load({ last = true })<CR>', desc = 'last session' } }

return M
