return {
	"vimpostor/vim-tpipeline",
	"stevearc/dressing.nvim",
	"kyazdani42/nvim-web-devicons",
	{
		"rebelot/kanagawa.nvim",
		config = function()
			local c = require("kanagawa.colors").setup()
			local prompt = c.sumiInk2
			local overrides = {
				TelescopeNormal = { bg = c.winterBlue, fg = c.fg_dark },
				TelescopeBorder = { bg = c.winterBlue, fg = c.winterBlue },
				TelescopePromptNormal = { bg = prompt },
				TelescopePromptBorder = { bg = prompt, fg = prompt },
				TelescopePromptTitle = { bg = c.autumnRed },
				TelescopePreviewTitle = { bg = c.autumnGreen },
				TelescopeResultsTitle = { bg = c.winterBlue, fg = c.winterBlue },
			}

			require("kanagawa").setup({ overrides = overrides })
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
}
