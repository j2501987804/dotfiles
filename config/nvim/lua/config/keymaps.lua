local map = vim.keymap.set


-- 基础快捷键
map("n", "<esc>", ":nohl<CR><esc>", { desc = "清除搜索高亮", silent = true })
map({ "n", "v", "x" }, "<s-h>", "^", { desc = "^" })
map({ "n", "v", "x" }, "<s-l>", "$", { desc = "$" })
map("n", ";", ":")

-- 窗口管理
map("n", "<leader>w|", "<C-w>v", { desc = "垂直分割窗口" })
map("n", "<leader>w-", "<C-w>s", { desc = "水平分割窗口" })
map("n", "<leader>we", "<C-w>=", { desc = "平均调整窗口大小" })
map("n", "<leader>wx", ":close<CR>", { desc = "关闭当前窗口" })

-- 标签页管理
map("n", "<leader><tab>c", ":tabnew<CR>", { desc = "打开新标签页" })
map("n", "<leader><tab>d", ":tabclose<CR>", { desc = "关闭当前标签页" })
map("n", "<leader><tab>n", ":tabn<CR>", { desc = "下一个标签页" })
map("n", "<leader><tab>p", ":tabp<CR>", { desc = "上一个标签页" })

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


-- lsp
map("n", "K", vim.lsp.buf.hover, { desc = "悬浮文档" })
map("i", "<C-s>", vim.lsp.buf.signature_help, { desc = "函数签名帮助" })
map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "重命名符号" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "代码修复" })
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "浮动诊断信息" })
map("n", "<leader>cf", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "格式化代码" })


-- overseer
map("n", "<leader>oo", "<cmd>OverseerRun<cr>", { desc = "运行任务" })
map("n", "<leader>op", "<cmd>OverseerOpen<cr>", { desc = "任务面板" })
map("n", "<leader>ol", "<cmd>OverseerLoadBundle<cr>", { desc = "加载任务列表" })
map("n", "<leader>oq", "<cmd>OverseerQuickAction<cr>", { desc = "任务修复" })


map("i", "jk", "<Esc>")
map("n", ";", ":")
