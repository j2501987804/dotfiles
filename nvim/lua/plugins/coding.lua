return {
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
				list = { selection = { preselect = false, auto_insert = true } },
				menu = {
					enabled = true,
					min_width = 30,
					max_height = 10,
					border = "rounded",
					-- border = {
					--     "♥",
					--     "─",
					--     "╮",
					--     "│",
					--     "╯",
					--     "─",
					--     "╰",
					--     "│",
					-- },
					winblend = 10,
					-- winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
					auto_show = true,
				},
				documentation = {
					-- -- Controls whether the documentation window will automatically show when selecting a completion item
					-- auto_show = true,
					-- -- Delay before showing the documentation window
					-- auto_show_delay_ms = 500,
					-- -- Delay before updating the documentation window when selecting a new item,
					-- -- while an existing item is still visible
					-- update_delay_ms = 50,
					-- -- Whether to use treesitter highlighting, disable if you run into performance issues
					treesitter_highlighting = true,
					window = {
						min_width = 10,
						max_width = 80,
						max_height = 20,
						border = "rounded",
						winblend = 10,
						-- winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
						-- scrollbar = true,
						-- direction_priority = {
						--     menu_north = { "e", "w", "n", "s" },
						--     menu_south = { "e", "w", "s", "n" },
						-- },
					},
				},
			},
		},
	},
}
