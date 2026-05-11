local opt = vim.opt
local g = vim.g

-- leader 键（必须最先）
g.mapleader = ' '
g.maplocalleader = ' '

-- UI
opt.number = true         -- 绝对行号
opt.relativenumber = true -- 相对行号
opt.cursorline = true     -- 高亮当前行
opt.signcolumn = 'yes'    -- 始终显示符号列
opt.termguicolors = true  -- 真彩色
opt.wrap = false          -- 禁止自动换行
opt.shortmess:append("I") -- 禁止 Neovim 内置的欢迎界面

opt.scrolloff = 8         -- 上下保留 8 行
opt.sidescrolloff = 8     -- 左右保留 8 列

opt.splitright = true     -- 垂直分屏向右
opt.splitbelow = true     -- 水平分屏向下

opt.showmode = false      -- 不显示模式
opt.laststatus = 3        -- 全局状态栏
opt.pumheight = 10        -- 补全菜单高度
opt.winborder = 'rounded' -- 浮窗圆角边框

-- 缩进
opt.expandtab = true   -- tab 转空格
opt.tabstop = 4        -- tab 宽度
opt.shiftwidth = 4     -- 缩进宽度
opt.softtabstop = 4    -- 编辑时 tab 宽度

opt.smartindent = true -- 智能缩进
opt.autoindent = true  -- 自动继承缩进

-- 搜索
opt.ignorecase = true -- 忽略大小写
opt.smartcase = true  -- 智能大小写
opt.hlsearch = false  -- 不高亮搜索
opt.incsearch = true  -- 增量搜索

-- 鼠标
opt.mouse = 'a'

-- 系统剪贴板
opt.clipboard = 'unnamedplus'

-- 文件
opt.swapfile = false -- 不创建 swap
opt.backup = false   -- 不创建 backup
opt.undofile = true  -- 启用持久 undo

opt.updatetime = 250 -- 更新时间
opt.timeoutlen = 400 -- 按键等待时间

opt.confirm = true   -- 退出前确认
opt.autoread = true  -- 文件变更自动读取

-- 补全
opt.completeopt = {
    'menu',
    'menuone',
    'noselect',
    'popup',
    'fuzzy',
}

-- 折叠（treesitter）
opt.foldmethod = 'expr'
opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
opt.foldlevel = 99

-- 空白字符
opt.list = true
opt.listchars = {
    tab = '→ ',
    trail = '·',
    nbsp = '␣',
}

-- 命令行
opt.cmdheight = 1
opt.shortmess:append('c')


-- 使用 rg 作为 grep
if vim.fn.executable('rg') == 1 then
    opt.grepprg = 'rg --vimgrep'
    opt.grepformat = '%f:%l:%c:%m'
end

-- 自定义文件类型
vim.filetype.add({
    extension = {
        templ = 'templ',
    },
})

-- WSL 剪贴板兼容
if vim.fn.has('wsl') == 1 then
    opt.clipboard = 'unnamedplus'
end
