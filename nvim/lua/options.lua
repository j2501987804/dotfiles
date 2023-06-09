local opt = vim.opt

opt.laststatus = 3 -- global statusline
opt.showmode = false

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
opt.updatetime = 450

-- 屏蔽启动页面板
opt.shortmess:append("I")

