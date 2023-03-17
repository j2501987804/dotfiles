return {
	"vimpostor/vim-tpipeline",
	"stevearc/dressing.nvim",
	"nvim-tree/nvim-web-devicons",
	{
		"rebelot/kanagawa.nvim",
		tag = "faeef985abd6f32cdc2e3c2cce89469060b9c74a",
		config = function()
			local overrides = function(colors)
				local c = colors.palette
				local prompt = c.sumiInk2
				return {
					TelescopeNormal = { bg = c.winterBlue, fg = c.fg_dark },
					TelescopeBorder = { bg = c.winterBlue, fg = c.winterBlue },
					TelescopePromptNormal = { bg = prompt },
					TelescopePromptBorder = { bg = prompt, fg = prompt },
					TelescopePromptTitle = { bg = c.autumnRed },
					TelescopePreviewTitle = { bg = c.autumnGreen },
					TelescopeResultsTitle = { bg = c.winterBlue, fg = c.winterBlue },

					-- cmp
					CmpBorder = { fg = "#42464e" },
					CmpDocBorder = { link = "CmpBorder" },
					FloatBorder = { bg = c.sumiInk1 },
					Pmenu = { bg = c.sumiInk1 },
					NormalFloat = { link = "Pmenu" },
				}
			end
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
