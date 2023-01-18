return {
	"nvim-lua/plenary.nvim",
	"kyazdani42/nvim-web-devicons",
	{
		"rebelot/kanagawa.nvim",
		config = function()
			vim.cmd("colorscheme kanagawa")
		end,
	},

	{
		"numToStr/Comment.nvim",
		keys = {
			{
				"<leader>/",
				function()
					require("Comment.api").toggle.linewise.current()
				end,
			},
			{
				"<leader>/",
				"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
				mode = "v",
			},
		},
	},

	{
		"mbbill/undotree",
		keys = { { "<leader>2", ":UndotreeToggle<cr>", desc = "Undo" } },
	},

	{ "folke/which-key.nvim", event = "VeryLazy", config = true },

	{
		"folke/trouble.nvim",
		keys = {
			{ "gI", "<cmd>TroubleToggle lsp_implementations<CR>", desc = "impl" },
			{ "<space>lw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "workspace_diagnostics" },
		},
	},

	{
		"Pocco81/AutoSave.nvim",
		opts = {
			execution_message = { message = "" },
		},
	},

	{
		"brglng/vim-im-select",
		event = { "InsertEnter" },
		cond = vim.fn.has("mac") == 1,
	},

	{
		"ggandor/leap.nvim",
		keys = {
			{ "f", "<Plug>(leap-forward-to)", mode = { "x", "o", "n" } },
			{ "F", "<Plug>(leap-backward-to)", mode = { "x", "o", "n" } },
		},
	},

	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		keys = { { ";t", "<cmd>TodoTrouble<cr>", "Todo" } },
		config = true,
	},

	{
		"nvim-pack/nvim-spectre",
		keys = {
			{ "<leader>sp", "<cmd>lua require('spectre').open()<CR>", desc = "spectre" },
			{ "<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", desc = "search word" },
			{ "<leader>sf", "viw:lua require('spectre').open_file_search()<cr>", desc = "open_file_search" },
		},
	},

	{ "ray-x/go.nvim", config = true, ft = "go" },
}
