-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
map("n", "<leader>qt", ":q<cr>", { desc = "quit", remap = true })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

map("n", ";", ":")

map({ "n", "v", "x" }, "<S-h>", "^", { desc = "^" })
map({ "n", "v", "x" }, "<S-l>", "$", { desc = "$" })
map("i", "<c-j>", "<down>")
map("i", "<c-k>", "<up>")
map("i", "<c-h>", "<left>")
map("i", "<c-l>", "<right>")
map("i", "jk", "<esc>")
