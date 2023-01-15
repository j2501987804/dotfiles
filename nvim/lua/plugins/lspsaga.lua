local M = {
	"glepnir/lspsaga.nvim",
	event = "BufRead",
	keys = {
		{ "<leader>o", "<cmd>Lspsaga outline<CR>", desc = "outline" },
		{ "<leader>rn", "<cmd>Lspsaga rename<CR>", desc = "rename" },
		{ "<leader>ca", "<cmd>Lspsaga code_action<CR>", desc = "code action" },
		{ "gh", "<cmd>Lspsaga lsp_finder<CR>", desc = "lsp finder" },
		-- { "K", "<cmd>Lspsaga hover_doc<CR>", desc = "hover_doc" },
	},
}
M.config = function()
	require("lspsaga").setup({
		ui = {
			-- currently only round theme
			theme = "round",
			-- border type can be single,double,rounded,solid,shadow.
			border = "rounded",
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
end
return M
