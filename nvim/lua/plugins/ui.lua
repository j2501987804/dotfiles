return {
	"vimpostor/vim-tpipeline",
	"stevearc/dressing.nvim",
	"nvim-tree/nvim-web-devicons",
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup()
			vim.cmd("colorscheme kanagawa")
		end,
	},

	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				always_show_bufferline = false,
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
					},
				},
			},
		},
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPost",
		opts = {
			-- char = "▏",
			char = "│",
			filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
			show_trailing_blankline_indent = true,
			show_current_context = true,
			show_current_context_start = true,
		},
	},

	{
		"folke/persistence.nvim",
		opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help" } },
	},

	{
		"glepnir/dashboard-nvim",
		opts = {
			theme = "hyper",
			config = {
				week_header = {
					enable = true,
				},
				shortcut = {
					{ desc = " Update", group = "@property", action = "Lazy update", key = "u" },
					{
						icon = " ",
						icon_hl = "@variable",
						desc = "Files",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
					{
						desc = " Sessions",
						group = "DiagnosticHint",
						action = function()
							require("persistence").load()
						end,
						key = "s",
					},
					{
						desc = " New file",
						group = "Number",
						action = "enew",
						key = "e",
					},
				},
			},
		},
	},
}
