-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "down", expr = true, silent = true })
map({ "n", "x" }, "<down>", "v:count == 0 ? 'gj' : 'j'", { desc = "down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "up", expr = true, silent = true })
map({ "n", "x" }, "<up>", "v:count == 0 ? 'gk' : 'k'", { desc = "up", expr = true, silent = true })

-- resize window using <ctrl> arrow keys
map("n", "<c-up>", "<cmd>resize +2<cr>", { desc = "increase window height" })
map("n", "<c-down>", "<cmd>resize -2<cr>", { desc = "decrease window height" })
map("n", "<c-left>", "<cmd>vertical resize -2<cr>", { desc = "decrease window width" })
map("n", "<c-right>", "<cmd>vertical resize +2<cr>", { desc = "increase window width" })

-- 基础快捷键
map("n", "<esc>", ":nohl<cr><esc>", { desc = "清除搜索高亮", silent = true })
map({ "n", "v", "x" }, "<s-h>", "^", { desc = "^" })
map({ "n", "v", "x" }, "<s-l>", "$", { desc = "$" })
map("n", ";", ":")
vim.keymap.set({ "n", "v" }, "x", '"_x')
vim.keymap.set("x", "p", '"_dp')


-- buffer 切换
map("n", "<tab>", ":bnext<cr>", { desc = "下一个 buffer" })
map("n", "<s-tab>", ":bprevious<cr>", { desc = "上一个 buffer" })

-- 保存/退出
map("n", "<c-s>", ":w<cr>", { desc = "保存文件" })
map("n", "<leader>q", ":q<cr>", { desc = "退出文件" })

-- 插入模式退出
map("i", "jk", "<esc>", { desc = "插入模式快速退出" })
map("i", "<c-h>", "<left>")
map("i", "<c-j>", "<down>")
map("i", "<c-k>", "<up>")
map("i", "<c-l>", "<right>")

-- 可视模式缩进保持选中
map("v", "<", "<gv", { desc = "左缩进" })
map("v", ">", ">gv", { desc = "右缩进" })

-- 上下移动代码
map("x", "J", ":move '>+1<cr>gv=gv")
map("x", "K", ":move '<-2<cr>gv=gv")


map("i", "jk", "<esc>")
map("n", ";", ":")
