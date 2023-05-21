return {
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			require("lspsaga").setup({})
		end,
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			--Please make sure you install markdown and markdown_inline parser
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},

	{
		"nvim-pack/nvim-spectre",
		keys = {
			{
				"<leader>sp",
				":lua require('spectre').open_visual({select_word=true}) <CR>",
				desc = "Replace in projects",
			},
			{
				"<leader>sf",
				":lua require('spectre').open_file_search({select_word=true}) <CR>",
				desc = "Replace in files (Spectre)",
			},
		},
	},

	{
		"folke/todo-comments.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = true,
		keys = { { "<leader>td", "<cmd>TodoTelescope<cr>", desc = "Todo" } },
	},

	{
		"ggandor/leap.nvim",
		config = true,
		keys = {
			{ "f", "<Plug>(leap-forward-till)", mode = { "v", "n", "x" } },
			{ "F", "<Plug>(leap-backward-till)", mode = { "v", "n", "x" } },
		},
	},
}
