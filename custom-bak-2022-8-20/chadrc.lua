local M = {}

M.options = {
	user = function()
		local opt = vim.opt
		opt.expandtab = true
		opt.shiftwidth = 4
		opt.smartindent = true
		opt.tabstop = 4 -- 为制表符插入 2 个空格
		opt.expandtab = true -- 将制表符转换为空格
		opt.foldenable = true
		opt.foldmethod = "indent"
		opt.foldlevel = 100
		opt.scrolloff = 10
		opt.backup = false
		opt.swapfile = false
		opt.list = true
		opt.autoindent = true
		vim.g.undotree_dir = vim.fn.stdpath("config") .. "/undodir"
	end,
}

---- UI -----

M.ui = {
	hl_override = {},
	changed_themes = {},
	theme_toggle = { "onedark", "one_light" },
	theme = "gruvchad", -- default theme
	transparency = false,
}

M.plugins = {
	override = require("custom.override"),
	remove = {
		"NvChad/nvterm",
	},

	options = {
		lspconfig = {
			setup_lspconf = "custom.override.lspconfig", -- path of lspconfig file
		},
		statusline = {
			separator_style = "default", -- default/round/slant/block/arrow
		},
	},

	-- add, modify, remove plugins
	user = require("custom.plugins"),
}

-- check core.mappings for table structure
M.mappings = require("custom.mappings")

M.dap = require("custom.dap")
return M
