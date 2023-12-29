-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "<S-l>")

local map = vim.keymap.set
map("i", "jk", "<ESC>")
map("i", "<C-h>", "<Left>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")
map("i", "<C-l>", "<Right>")

map("n", ";", ":")
map("n", "<leader>q", ":q<cr>", { desc = "Quit" })

map({ "n", "v", "x" }, "<S-h>", "^")
map({ "n", "v", "x" }, "<S-l>", "$")

map("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })

map("c", "<C-j>", "<C-n>")
map("c", "<C-k>", "<C-p>")
