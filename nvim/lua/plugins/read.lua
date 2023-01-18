local M = {
	"glepnir/lspsaga.nvim",
	event = "BufRead",
	keys = {
		{ "<leader>o", "<cmd>Lspsaga outline<CR>", desc = "outline" },
		{ "<leader>rn", "<cmd>Lspsaga rename<CR>", desc = "rename" },
		{ "<leader>ca", "<cmd>Lspsaga code_action<CR>", desc = "code action" },
		{ "gh", "<cmd>Lspsaga lsp_finder<CR>", desc = "lsp finder" },
		{ "K", "<cmd>Lspsaga hover_doc<CR>", desc = "hover_doc" },
	},
	dependencies = {
		"lukas-reineke/indent-blankline.nvim",
		"akinsho/bufferline.nvim",
		"f-person/git-blame.nvim",
		{ "NvChad/nvim-colorizer.lua", config = true },
		{ "lewis6991/gitsigns.nvim", config = true },
		{ "ethanholz/nvim-lastplace", config = true },
		{ "karb94/neoscroll.nvim", config = true },
	},
}
M.config = function()
	require("lspsaga").setup({
		ui = {
			-- currently only round theme
			theme = "round",
			-- border type can be single,double,rounded,solid,shadow.
			border = vim.g.border_style,
		},
		symbol_in_winbar = {
			enable = true,
			separator = " ",
			hide_keyword = true,
			show_file = true,
			folder_level = 2,
			respect_root = false,
			color_mode = false,
		},
	})
	vim.wo.winbar = require("lspsaga.symbolwinbar"):get_winbar()

	require("bufferline").setup({
		options = {
			indicator = {
				style = "underline",
			},
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
				},
			},
		},
	})
end
return M
