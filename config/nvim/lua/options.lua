vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

-- 状态栏
opt.laststatus = 3
opt.showmode = false
opt.cmdheight = 0

opt.clipboard = "unnamedplus"

-- buffer
opt.backup = false
opt.swapfile = false

-- Indenting
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"
opt.scrolloff = 8

-- Numbers
opt.number = true
opt.ruler = false
opt.relativenumber = true

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.undofile = true

opt.timeoutlen = 300
opt.updatetime = 300

-- 屏蔽启动页面板
opt.shortmess:append("I")

-- 滚动而不是换行
opt.wrap = false
opt.scroll = 1

opt.jumpoptions = "view" -- c-o跳转
