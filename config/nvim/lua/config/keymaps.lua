local map = vim.keymap.set

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- 基础快捷键
map("n", "<esc>", ":nohl<CR><esc>", { desc = "清除搜索高亮", silent = true })
map({ "n", "v", "x" }, "<s-h>", "^", { desc = "^" })
map({ "n", "v", "x" }, "<s-l>", "$", { desc = "$" })
map("n", ";", ":")
vim.keymap.set({ "n", "v" }, "x", '"_x')
vim.keymap.set("x", "p", '"_dP')

-- 窗口管理
map("n", "<leader>w|", "<C-w>v", { desc = " 垂直分割" })
map("n", "<leader>w-", "<C-w>s", { desc = " 水平分割" })
map("n", "<leader>we", "<C-w>=", { desc = "平均调整窗口大小" })
map("n", "<leader>wx", ":close<CR>", { desc = "colse windows" })

-- 标签页管理
map("n", "<leader><tab>c", ":tabnew<CR>", { desc = "new tab" })
map("n", "<leader><tab>d", ":tabclose<CR>", { desc = "close tab" })
map("n", "<leader><tab>n", ":tabn<CR>", { desc = "next tab" })
map("n", "<leader><tab>p", ":tabp<CR>", { desc = "prev tab" })

-- 窗口切换
map("n", "<C-h>", "<C-w>h", { desc = "切换到左边窗口" })
map("n", "<C-j>", "<C-w>j", { desc = "切换到下边窗口" })
map("n", "<C-k>", "<C-w>k", { desc = "切换到上边窗口" })
map("n", "<C-l>", "<C-w>l", { desc = "切换到右边窗口" })

-- buffer 切换
map("n", "<tab>", ":bnext<CR>", { desc = "下一个 buffer" })
map("n", "<S-tab>", ":bprevious<CR>", { desc = "上一个 buffer" })

-- 保存/退出
map("n", "<c-s>", ":w<CR>", { desc = "保存文件" })
map("n", "<leader>q", ":q<CR>", { desc = "退出文件" })

-- 插入模式退出
map("i", "jk", "<ESC>", { desc = "插入模式快速退出" })
map("i", "<C-h>", "<left>")
map("i", "<C-j>", "<down>")
map("i", "<C-k>", "<up>")
map("i", "<C-l>", "<right>")

-- 可视模式缩进保持选中
map("v", "<", "<gv", { desc = "左缩进" })
map("v", ">", ">gv", { desc = "右缩进" })

-- 上下移动代码
map("x", "J", ":move '>+1<CR>gv=gv")
map("x", "K", ":move '<-2<CR>gv=gv")

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })


-- lsp
map("n", "K", vim.lsp.buf.hover, { desc = "hover" })
map("i", "<C-s>", vim.lsp.buf.signature_help, { desc = "signature" })
map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "code rename" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "code action" })
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "float diagnostic" })
map("n", "<leader>cf", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "code format" })


map("i", "jk", "<Esc>")
map("n", ";", ":")
