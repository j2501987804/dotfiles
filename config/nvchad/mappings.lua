---@type MappingsTable
local M = {}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },
		["<leader>q"] = { ":q<CR>", "quit" },
		["<S-Up>"] = { "<cmd>resize +2<cr>", "Increase window height" },
		["<S-Down>"] = { "<cmd>resize -2<cr>", "Decrease window height" },
		["<S-Left>"] = { "<cmd>vertical resize -2<cr>", "Decrease window width" },
		["<S-Right>"] = { "<cmd>vertical resize +2<cr>", "Increase window width" },
		["H"] = { "^", "^" },
		["L"] = { "$", "$" },
	},
	v = {
		["H"] = { "^", "^" },
		["L"] = { "$", "$" },
	},
}

M.lspsaga = {
	n = {
		["K"] = { "<cmd>Lspsaga hover_doc<CR>", "Hover" },
		["gh"] = { "<cmd>Lspsaga lsp_finder<CR>", "Lsp finder" },
		["gd"] = { "<cmd>Lspsaga goto_definition<CR>", "goto_definition" },
		["<leader>ca"] = { "<cmd>Lspsaga code_action<CR>", " code action" },
		["<leader>o"] = { "<cmd>Lspsaga outline<CR>", "Outline" },
		["<leader>lw"] = { "<cmd>Lspsaga show_workspace_diagnostics<CR>", "workspace diagnostics" },
		["<leader>lc"] = { "<cmd>Lspsaga show_cursor_diagnostics<CR>", "cursor diagnostics" },
		["<A-d>"] = { "<cmd>Lspsaga term_toggle<CR>", "term_toggle" },
	},

	t = {
		["<A-d>"] = { "<cmd>Lspsaga term_toggle<CR>", "term_toggle" },
	},
}
return M
