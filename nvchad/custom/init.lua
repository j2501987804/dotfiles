-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--


vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert 2 spaces for a tab
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time


-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }
keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)
keymap("v", "H", "^", opts)
keymap("v", "L", "$", opts)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)