-- 基础选项配置
local opt = vim.opt

-- 行号
opt.number = true -- 显示当前行号
opt.relativenumber = true -- 显示相对行号

-- 缩进与制表符
opt.tabstop = 4 -- 一个 tab 占用 4 个空格
opt.shiftwidth = 4 -- >> << 操作时移动长度
opt.expandtab = true -- 使用空格代替 tab
opt.smartindent = true -- 智能缩进

-- 搜索
opt.ignorecase = true -- 忽略大小写
opt.smartcase = true -- 如果包含大写字母，则不忽略大小写
opt.incsearch = true -- 输入时即时搜索
opt.hlsearch = true -- 高亮搜索结果

-- 文件编码
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- 行结尾和文件保存
opt.backup = false
opt.swapfile = false
opt.undofile = true -- 启用 undo 文件

-- 显示设置
opt.cursorline = true -- 高亮当前行
opt.termguicolors = true -- 启用 24bit 真彩色
opt.scrolloff = 8 -- 光标上下保留8行
opt.signcolumn = "yes" -- 显示诊断符号列
opt.winborder = "single"

-- 状态栏
opt.laststatus = 3 -- 全局状态栏
-- opt.showmode = false -- 不显示 -- INSERT --

-- 鼠标支持
opt.mouse = "a" -- 启用鼠标

-- 剪贴板
opt.clipboard = "unnamedplus" -- 使用系统剪贴板

-- 其他
opt.wrap = false -- 不换行
opt.timeoutlen = 300 -- 按键映射等待时间（ms）

-- 设置 leader 键
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ╭────────────────────────────────────────────╮
-- │                 PLUGINS                    │
-- ╰────────────────────────────────────────────╯
vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"

vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	-- lsp
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/nvimtools/none-ls.nvim",
	"https://github.com/mason-org/mason.nvim",

	-- tools
	"https://github.com/stevearc/overseer.nvim",
	"https://github.com/folke/which-key.nvim",
	"https://github.com/folke/snacks.nvim",
	"https://github.com/folke/todo-comments.nvim",
	"https://github.com/folke/flash.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",

	-- cmp
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/rafamadriz/friendly-snippets",
	{ src = "https://github.com/Saghen/blink.cmp", version = "v1.6.0" },

	-- ui
	"https://github.com/nvchad/ui",
	"https://github.com/nvchad/base46",
	"https://github.com/tiagovla/scope.nvim",
})

-- nvchad
require("nvchad")

-- vim.cmd.colorscheme("everforest")
require("snacks").setup({
	bigfile = { enabled = true },
	dashboard = { enabled = false },
	explorer = { enabled = true },
	indent = { enabled = true },
	input = { enabled = true },
	notifier = {
		enabled = true,
		timeout = 3000,
	},
	picker = { enabled = true },
	quickfile = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },
	styles = {
		notification = {
			wo = { wrap = false }, -- Wrap notifications
		},
	},
})
require("todo-comments").setup()
-- require("bufferline").setup()
require("scope").setup()
require("nvim-autopairs").setup()
require("gitsigns").setup()

require("overseer").setup({
	task_list = {
		bindings = {
			["<C-h>"] = false,
			["<C-j>"] = false,
			["<C-k>"] = false,
			["<C-l>"] = false,
		},
	},
})
require("nvim-treesitter.configs").setup({
    -- stylua: ignore
	ensure_installed = {
        "go", "gomod", "gowork", "gosum",
		"lua", "vim", "bash", "json", "yaml", "markdown","toml",
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true },
})

local wk = require("which-key")
wk.setup({ preset = "helix" })
wk.add({
	{ "<leader>f", group = "file" }, -- group
	{ "<leader>s", group = "search" }, -- group
	{ "<leader>o", group = "tasks" }, -- group
	{ "<leader>t", group = "test" }, -- group
	{ "<leader>g", group = "git" }, -- group
	{ "<leader><tab>", group = "tab" }, -- group
	{ "<leader>w", group = "windows" }, -- group
	{ "<leader>u", group = "ui" }, -- group
	{ "<leader>c", group = "code" }, -- group
})

-- lsp
require("mason").setup()
local mr = require("mason-registry")
mr.refresh(function()
    -- stylua: ignore
    local ensure_installed = {
			-- lua
			"lua-language-server", "stylua",
			-- sh
			"bash-language-server","shfmt",
			-- go
			"delve", "gopls", "gomodifytags", "impl", "goimports", "gofumpt",
    }

	for _, tool in ipairs(ensure_installed) do
		local p = mr.get_package(tool)
		if not p:is_installed() then
			p:install()
		end
	end
end)
vim.lsp.enable({ "gopls", "lua_ls", "bashls" })

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "goimports", "gofumpt" },
		sh = { "shfmt" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

local nls = require("null-ls")
nls.setup({
	sources = {
		nls.builtins.code_actions.gomodifytags,
		nls.builtins.code_actions.impl,
		nls.builtins.formatting.goimports,
		nls.builtins.formatting.gofumpt,
	},
})

require("blink.cmp").setup({
	keymap = {
		preset = "enter",
		["<C-j>"] = { "select_next", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },
	},
	signature = { enabled = true },
	completion = {
		documentation = { auto_show = true, auto_show_delay_ms = 500 },
		menu = {
			auto_show = true,
			draw = {
				treesitter = { "lsp" },
				columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
			},
		},
	},
})

dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")
require("base46").load_all_highlights()

-- ╭────────────────────────────────────────────╮
-- │                 KEYMAPS                    │
-- ╰────────────────────────────────────────────╯
-- stylua: ignore start
local map = vim.keymap.set
map("n", "<leader>q", ":q<cr>", { desc = "退出" })
map({ "n" }, "<leader>un", function() Snacks.picker.notifications() end, { desc = "Notification History" })
map({ "n" }, "<leader>e", function() Snacks.explorer() end, { desc = "Explorer" })
map({ "n" }, "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Buffers" })
map({ "n" }, "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Find Config File" })
map({ "n" }, "<leader>ff", function() Snacks.picker.files() end, { desc = "Find Files" })
map({ "n" }, "<leader>fg", function() Snacks.picker.git_files() end, { desc = "Find Git Files" })
map({ "n" }, "<leader>fp", function() Snacks.picker.projects() end, { desc = "Projects" })
map({ "n" }, "<leader>gb", function() Snacks.picker.git_branches() end, { desc = "Git Branches" })
map({ "n" }, "<leader>gl", function() Snacks.picker.git_log() end, { desc = "Git Log" })
map({ "n" }, "<leader>gL", function() Snacks.picker.git_log_line() end, { desc = "Git Log Line" })
map({ "n" }, "<leader>gs", function() Snacks.picker.git_status() end, { desc = "Git Status" })
map({ "n" }, "<leader>gS", function() Snacks.picker.git_stash() end, { desc = "Git Stash" })
map({ "n" }, "<leader>gd", function() Snacks.picker.git_diff() end, { desc = "Git Diff (Hunks)" })
map({ "n" }, "<leader>gf", function() Snacks.picker.git_log_file() end, { desc = "Git Log File" })
map({ "n" }, "<leader>sg", function() Snacks.picker.grep() end, { desc = "Grep" })
map({ "n", "x" }, "<leader>sw", function() Snacks.picker.grep_word() end, { desc = "Visual selection or word" })
map({ "n" }, '<leader>s"', function() Snacks.picker.registers() end, { desc = "Registers" })
map({ "n" }, "<leader>sd", function() Snacks.picker.diagnostics() end, { desc = "Diagnostics" })
map({ "n" }, "<leader>si", function() Snacks.picker.icons() end, { desc = "Icons" })
map({ "n" }, "<leader>sl", function() Snacks.picker.loclist() end, { desc = "Location List" })
map({ "n" }, "<leader>sm", function() Snacks.picker.marks() end, { desc = "Marks" })
map({ "n" }, "<leader>sq", function() Snacks.picker.qflist() end, { desc = "Quickfix List" })
map({ "n" }, "<leader>su", function() Snacks.picker.undo() end, { desc = "Undo History" })
map({ "n" }, "<leader>uC", function() Snacks.picker.colorschemes() end, { desc = "Colorschemes" })
map({ "n" }, "<leader>st", function() Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, { desc = "Todo/Fix/Fixme" })
map({ "n" }, "gd", function() Snacks.picker.lsp_definitions() end, { desc = "跳转定义" })
map({ "n" }, "gD", function() Snacks.picker.lsp_declarations() end, { desc = "跳转声明" })
map({ "n" }, "gr", function() Snacks.picker.lsp_references() end, { nowait = true, desc = "查找引用" })
map({ "n" }, "gI", function() Snacks.picker.lsp_implementations() end, { desc = "查找接口实现" })
map({ "n" }, "gy", function() Snacks.picker.lsp_type_definitions() end, { desc = "跳转类型定义" })
map({ "n" }, "<leader>cs", function() Snacks.picker.lsp_symbols() end, { desc = "文件大纲" })
map({ "n" }, "<leader>cS", function() Snacks.picker.lsp_workspace_symbols() end, { desc = "项目大纲" })
map({ "n" }, "<leader>uz", function() Snacks.zen() end, { desc = "Toggle Zen Mode" })
map({ "n" }, "<leader>uZ", function() Snacks.zen.zoom() end, { desc = "Toggle Zoom" })
map({ "n" }, "<leader>us", function() Snacks.scratch() end, { desc = "Toggle Scratch Buffer" })
map({ "n" }, "<leader>un", function() Snacks.notifier.show_history() end, { desc = "Notification History" })
map({ "n" }, "<leader>x", function() Snacks.bufdelete() end, { desc = "Delete Buffer" })
map({ "n" }, "<leader>cR", function() Snacks.rename.rename_file() end, { desc = "Rename File" })
map({ "n", "v" }, "<leader>gB", function() Snacks.gitbrowse() end, { desc = "Git Browse" })
map({ "n" }, "<leader>gg", function() Snacks.lazygit() end, { desc = "Lazygit" })
map({ "n", "t" }, "<C-/>", function() Snacks.terminal() end, { desc = "Toggle Terminal" })
map({ "n", "t" }, "<C-_>", function() Snacks.terminal() end, { desc = "which_key_ignore" })
map({ "n", "t" }, "]]", function() Snacks.words.jump(vim.v.count1) end, { desc = "Next Reference" })
map({ "n", "t" }, "[[", function() Snacks.words.jump(-vim.v.count1) end, { desc = "Prev Reference" })

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

-- flash
map({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
map({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })
map("o", "r", function() require("flash").remote() end, { desc = "Remote Flash" })
map({ "o", "x" }, "R", function() require("flash").treesitter_search() end, { desc = "Treesitter Search" })
map("c", "<c-s>", function() require("flash").toggle() end, { desc = "Toggle Flash Search" })

-- overseer
map("n", "<leader>oo", "<cmd>OverseerRun<cr>", { desc = "运行任务" })
map("n", "<leader>op", "<cmd>OverseerOpen<cr>", { desc = "任务面板" })
map("n", "<leader>ol", "<cmd>OverseerLoadBundle<cr>", { desc = "加载任务列表" })
map("n", "<leader>oq", "<cmd>OverseerQuickAction<cr>", { desc = "任务修复" })
-- stylua: ignore end

-- ╭────────────────────────────────────────────╮
-- │                 AUTOCMDS                   │
-- ╰────────────────────────────────────────────╯
vim.diagnostic.config({
	virtual_text = { source = "if_many" },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚",
			[vim.diagnostic.severity.WARN] = "󰀪",
			[vim.diagnostic.severity.INFO] = "󰋽",
			[vim.diagnostic.severity.HINT] = "󰌶",
		},
	},
	severity_sort = true,
})

if vim.fn.has("wsl") == 1 then
	vim.g.clipboard = {
		name = "WslClipboard",
		copy = {
			["+"] = "clip.exe",
			["*"] = "clip.exe",
		},
		paste = {
			["+"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
			["*"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		},
		cache_enabled = 0,
	}
end

vim.api.nvim_create_autocmd({ "PackChanged", "PackChangedPre" }, {
	callback = function()
		print("插件安装完成，执行构建任务...")
		vim.fn.cmd([[TSUpdate]])
	end,
})

-- 记录光标上次浏览位置
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- 禁止自动注释新行
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	command = "set formatoptions-=cro",
})

-- 自动保存
vim.api.nvim_create_autocmd("BufLeave", {
	pattern = "*",
	callback = function(args)
		-- 获取当前缓冲区信息
		local bufnr = args.buf
		local bufname = vim.api.nvim_buf_get_name(bufnr)
		-- 排除特殊缓冲区（无文件名/终端等）
		if
			vim.api.nvim_buf_get_option(bufnr, "modified") -- 检查是否被修改
			and vim.api.nvim_buf_get_option(bufnr, "modifiable") -- 检查可修改性
			and not vim.api.nvim_buf_get_option(bufnr, "readonly") -- 检查只读状态
			and bufname ~= "" -- 排除无名缓冲区
			and vim.api.nvim_buf_get_option(bufnr, "buftype") == "" -- 排除特殊类型（终端等）
		then
			vim.cmd("silent! update") -- 静默保存（仅在修改时写入）
		end
	end,
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	callback = function()
		if vim.o.buftype ~= "nofile" then
			vim.cmd("checktime")
		end
	end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		(vim.hl or vim.highlight).on_yank()
	end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd("tabdo wincmd =")
		vim.cmd("tabnext " .. current_tab)
	end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
    -- stylua: ignore
	pattern = {
		"PlenaryTestPopup", "checkhealth", "dbout", "gitsigns-blame",
		"grug-far", "help", "lspinfo", "neotest-output", "neotest-output-panel",
		"neotest-summary", "notify", "qf", "spectre_panel", "startuptime", "tsplayground",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.schedule(function()
			vim.keymap.set("n", "q", function()
				vim.cmd("close")
				pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
			end, {
				buffer = event.buf,
				silent = true,
				desc = "Quit buffer",
			})
		end)
	end,
})

-- 保存文件自动创建路径
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	callback = function(event)
		if event.match:match("^%w%w+:[\\/][\\/]") then
			return
		end
		local file = vim.uv.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})
