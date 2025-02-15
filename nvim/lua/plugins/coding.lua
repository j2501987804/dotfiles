return {
	-- ai
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		event = "BufReadPost",
		opts = {
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<tab>", -- handled by nvim-cmp / blink.cmp
					next = "<M-]>",
					prev = "<M-[>",
				},
			},
			panel = { enabled = false },
			filetypes = {
				markdown = true,
				help = true,
			},
		},
	},

	{
		"saghen/blink.cmp",
		version = "*",
		opts_extend = { "sources.default" },
		dependencies = {
			"rafamadriz/friendly-snippets",
			{
				"windwp/nvim-autopairs",
				config = true,
			},
		},
		event = "InsertEnter",
		opts = {
			keymap = {
				preset = "enter",
				["<c-k>"] = { "select_prev", "fallback" },
				["<c-j>"] = { "select_next", "fallback" },
			},
			sources = {
				default = { "lsp", "snippets", "buffer", "path" },
				cmdline = function()
					local type = vim.fn.getcmdtype()
					-- Search forward and backward
					if type == "/" or type == "?" then
						return { "buffer" }
					end
					-- Commands
					if type == ":" or type == "@" then
						return { "cmdline" }
					end
					return {}
				end,
			},
			completion = {
				list = { selection = { preselect = true, auto_insert = true } },
				menu = {
					enabled = true,
					min_width = 30,
					max_height = 10,
					-- border = "rounded",
					border = {
						"󱐋",
						"─",
						"╮",
						"│",
						"╯",
						"─",
						"╰",
						"│",
					},
					winblend = 10,
					-- winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
					auto_show = true,
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 500,
					update_delay_ms = 50,
					treesitter_highlighting = true,
					window = {
						min_width = 10,
						max_width = 80,
						max_height = 20,
						border = "rounded",
						winblend = 10,
						-- winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
						scrollbar = true,
						direction_priority = {
							menu_north = { "e", "w", "n", "s" },
							menu_south = { "e", "w", "s", "n" },
						},
					},
				},
			},
		},
	},
}
