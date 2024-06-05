require "nvchad.options"

local opt = vim.opt

-- 状态栏
-- opt.laststatus = 0
-- opt.showmode = false
-- opt.cmdheight = 0

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

-- opt.timeoutlen = 300
-- opt.updatetime = 300
--
-- 屏蔽启动页面板
-- opt.shortmess:append("I")

-- 滚动而不是换行
opt.wrap = false
opt.scroll = 1
-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

local autocmd = vim.api.nvim_create_autocmd
-- 自动保存
autocmd({ "BufLeave" }, {
  pattern = "*.go,*.py,*.lua,*rust",
  callback = function()
    local bufner = vim.api.nvim_get_current_buf()
    if vim.api.nvim_buf_get_option(bufner, "modified") then
      -- vim.lsp.buf.format(nil, bufner)
      vim.fn.execute "silent! write"
      -- vim.cmd("silent! wall")
    end
  end,
})

-- 自动重载文件
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  command = "checktime",
})

-- 窗口变小时,自动调整布局
vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

-- 记住最后一次光标浏览
autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- 保存时目录不存在自动创建
autocmd({ "BufWritePre" }, {
  callback = function(event)
    if event.match:match "^%w%w+://" then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- 高亮复制内容
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank {
      higroup = "IncSearch",
      timeout = 300,
    }
  end,
})

-- 换行时不自动注释
autocmd({ "BufEnter", "BufNewFile" }, {
  callback = function()
    vim.bo.formatoptions = vim.bo.formatoptions:gsub("[cro]", "")
  end,
})
