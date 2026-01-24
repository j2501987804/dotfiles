-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- 缩进与制表符
vim.opt.tabstop = 4        -- 一个 Tab 显示为 2 个空格宽度
vim.opt.shiftwidth = 4     -- 自动缩进宽度为 2 个空格
vim.opt.expandtab = true   -- 将 Tab 转换为空格
vim.opt.smartindent = true -- 智能缩进（比如在函数或 if 内自动缩进）

-- 显示相关
-- vim.opt.number = true         -- 显示行号
-- vim.opt.relativenumber = true -- 显示相对行号（便于跳转）
-- vim.opt.cursorline = true     -- 高亮当前行
-- vim.opt.signcolumn = "yes"    -- 始终显示符号栏（诊断提示等）
-- vim.opt.termguicolors = true  -- 启用真彩色显示
-- vim.opt.wrap = false          -- 不自动换行
-- -- vim.opt.scrolloff = 5         -- 光标上下保留 5 行滚动边距
--
-- -- 性能优化
-- -- vim.opt.lazyredraw = true -- 执行宏时不刷新界面，加快性能
-- -- vim.opt.updatetime = 300 -- CursorHold 事件触发时间，默认 4000ms
-- -- vim.opt.timeoutlen = 400 -- 按键组合等待时间（默认 1000ms）
-- vim.opt.swapfile = false -- 禁用交换文件
-- vim.opt.backup = false   -- 禁用备份文件
-- vim.opt.undofile = true  -- 启用持久化撤销（退出后也能撤销）
--
-- -- 文件与编码
-- vim.opt.encoding = "utf-8"                     -- 设置内部编码
-- vim.opt.fileencoding = "utf-8"                 -- 文件保存编码
-- vim.opt.fileformats = { "unix", "dos", "mac" } -- 自动识别文件换行符
--
--
-- -- 自动补全与 LSP 体验优化
-- vim.opt.completeopt = { "menu", "menuone", "noselect" } -- 补全行为优化
-- vim.opt.signcolumn = "yes"                              -- 显示诊断图标列
-- vim.opt.shortmess:append("c")                           -- 补全时不显示多余信息
--
-- -- 折叠设置（推荐配合 LSP 或 treesitter）
-- -- vim.opt.foldmethod = "expr"
-- -- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- -- vim.opt.foldenable = false -- 默认不折叠
-- -- vim.opt.foldlevel = 99     -- 打开文件时展开所有折叠
--
-- -- 其他偏好
-- vim.opt.autoread = true -- 文件在外部修改时自动重新加载
-- vim.opt.hidden = true   -- 允许在未保存时切换 buffer
-- vim.opt.pumheight = 10  -- 补全菜单最大显示项数
-- vim.opt.showtabline = 1 -- 仅在多标签时显示标签栏
-- vim.o.winborder = "single"
-- vim.g.tpipeline_autoembed = 0
