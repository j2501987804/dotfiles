local M = {}

M.disabled = {
	n = {
		["<leader>h"] = "",
		["<leader>q"] = "",
		["<leader>e"] = "",
		["<leader>f"] = "",
		["<leader>fa"] = "",
		["<leader>fw"] = "",
		["<leader>fb"] = "",
		["<leader>fh"] = "",
		["<leader>fo"] = "",
		["<leader>ff"] = "",
		["<leader>fm"] = "",
		["<C-s>"] = "",
		["<C-n>"] = "",
	},
}

M.general = {
	i = {},

	n = {
		-- git
		["<leader>gd"] = {
			"<cmd>DiffviewOpen<cr>",
			"Diffview",
		},
		["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
		["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "git status" },

		-- Telescope
		["<leader>b"] = { "<cmd>Telescope buffers previewer=false theme=dropdown<cr>", "Buffers" },
		["<leader>f"] = {
			"<cmd>Telescope find_files<cr>",
			"Find files",
		},
		["<leader>F"] = {
			"<cmd>Telescope live_grep theme=ivy<cr>",
			"Find Text",
		},

		-- nvimtree
		["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },

		-- others
		["H"] = { "^", "^" },
		["L"] = { "$", "$" },
		["<leader>q"] = { ":q<cr>", "quit" },
		["<leader>tc"] = { ":tabclose<cr>", "tabclose" },
		[";t"] = { "<cmd>TodoTrouble<cr>", "Todo" },
		[";r"] = { "<cmd>lua _QUICK_RUN()<CR>", "quick run" },
		[";g"] = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "lazygit" },
		[";d"] = { "<cmd>DiffviewOpen<CR>", "DiffviewOpen" },
	},

	v = {
		["H"] = { "^", "^" },
		["L"] = { "$", "$" },
	},
}

M.lspconfig = {
	n = {
		["gr"] = { "<cmd>TroubleToggle lsp_references<cr>", "lsp references" },
		["gh"] = { "<cmd>Lspsaga lsp_finder<CR>", "lsp finder" },
		["gp"] = { "<cmd>Lspsaga peek_definition<CR>", "peek definition" },
		["K"] = { "<cmd>Lspsaga hover_doc<CR>", "hover doc" },
		["<leader>lf"] = {
			function()
				vim.lsp.buf.format({ async = true })
			end,
			"lsp formatting",
		},
		-- ["<leader>ca"] = { "<cmd>Lspsaga code_action<CR>", "code action" },
		["<leader>lr"] = { "<cmd>LspRestart<CR>", "LspRestart" },
		["<leader>lw"] = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "workspace_diagnostics" },
	},
}

M.comment = {
	plugin = true,

	-- toggle comment in both modes
	n = {
		["<C-/>"] = {
			function()
				require("Comment.api").toggle.linewise.current()
			end,
			"toggle comment",
		},
	},

	v = {
		["<C-/>"] = {
			"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
			"toggle comment",
		},
	},
}

M.remap = {
	n = {
		["<S-Up>"] = { "<cmd>resize +4<CR>", "" },
		["<S-Down>"] = { "<cmd>resize -4<CR>", "" },
		["<S-Left>"] = { "<cmd>vertical resize +4<CR>", "" },
		["<S-Right>"] = { "<cmd>vertical resize -4<CR>", "" },
	},

	t = {
		["<S-Up>"] = { "<cmd>resize +4<CR>", "" },
		["<S-Down>"] = { "<cmd>resize -4<CR>", "" },
		["<S-Left>"] = { "<cmd>vertical resize +4<CR>", "" },
		["<S-Right>"] = { "<cmd>vertical resize -4<CR>", "" },
	},

	v = {
		["<"] = { "<gv", "" },
		[">"] = { ">gv", "" },
		["p"] = { '"_dP', "" },
	},
}

vim.keymap.set({ "x", "o", "n" }, "f", "<Plug>(leap-forward-to)")
vim.keymap.set({ "x", "o", "n" }, "F", "<Plug>(leap-backward-to)")
return M
