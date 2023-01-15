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
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
		},
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPost",
	},

	{
		"akinsho/bufferline.nvim",
		event = "BufReadPost",
		opts = {
			options = {
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
			},
		},
	},

	{ "NvChad/nvim-colorizer.lua", event = "BufReadPost" },

	{ "lewis6991/gitsigns.nvim", ft = "gitcommit" },

	{
		"numToStr/Comment.nvim",
		keys = {
			{
				"<C-/>",
				function()
					require("Comment.api").toggle.linewise.current()
				end,
			},
			{ "<C-/>", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", mode = "v" },
		},
	},

	{
		"mbbill/undotree",
		keys = { { "<leader>2", ":UndotreeToggle<cr>", desc = "Undo" } },
	},

	"folke/which-key.nvim",

	"vimpostor/vim-tpipeline",

	{
		"folke/trouble.nvim",
		keys = {
			{ "gI", "<cmd>TroubleToggle lsp_implementations<CR>", desc = "impl" },
			{ "<space>lw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "workspace_diagnostics" },
		},
	},

	{
		"Pocco81/AutoSave.nvim",
		event = { "TextChanged", "TextChangedI" },
	},

	-- last read
	{
		"ethanholz/nvim-lastplace",
		event = { "BufRead", "BufNewFile" },
	},

	{ "karb94/neoscroll.nvim", event = { "BufRead", "BufNewFile" } },

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
		keys = { { ";t", "<cmd>TodoTrouble<cr>", "Todo" } },
	},

	{
		"moll/vim-bbye",
		keys = { { "<leader>x", "<cmd>Bdelete!<CR>", desc = "Close buffers" } },
	},

	{ "dstein64/vim-startuptime", cmd = "StartupTime" },

	{ "ray-x/go.nvim", ft = "go" },
}
