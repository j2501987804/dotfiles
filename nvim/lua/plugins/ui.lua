return {
	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 3000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
		},
	},

	{
		"akinsho/nvim-bufferline.lua",
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
		event = "BufReadPre",
		opts = {
			-- char = "▏",
			char = "│",
			filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
			show_trailing_blankline_indent = false,
			show_current_context = true,
		},
	},

	{
		"folke/noice.nvim",
		opts = {
			views = {
				notify = {
					merge = true,
				},
			},
			presets = {
				lsp_doc_border = true,
			},
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				hover = {
					enabled = false,
				},
				signature = {
					enabled = false,
				},
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = false,
				},
			},
		},
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},

	{
		"feline-nvim/feline.nvim",
		config = function()
			local line_ok, feline = pcall(require, "feline")
			if not line_ok then
				return
			end
			local c = {
				vim_mode = {
					provider = {
						name = "vi_mode",
						opts = {
							show_mode_name = true,
							-- padding = "center", -- Uncomment for extra padding.
						},
					},
					left_sep = "block",
					right_sep = "block",
				},
				gitBranch = {
					provider = "git_branch",
					left_sep = "block",
					right_sep = "block",
				},
				gitDiffAdded = {
					provider = "git_diff_added",
					left_sep = "block",
					right_sep = "block",
				},
				gitDiffRemoved = {
					provider = "git_diff_removed",
					left_sep = "block",
					right_sep = "block",
				},
				gitDiffChanged = {
					provider = "git_diff_changed",
					left_sep = "block",
					right_sep = "right_filled",
				},
				separator = {
					provider = "",
				},
				diagnostic_errors = {
					provider = "diagnostic_errors",
				},
				diagnostic_warnings = {
					provider = "diagnostic_warnings",
				},
				diagnostic_hints = {
					provider = "diagnostic_hints",
				},
				diagnostic_info = {
					provider = "diagnostic_info",
				},
				lsp_client_names = {
					provider = "lsp_client_names",
					left_sep = "left_filled",
					right_sep = "block",
				},
				file_type = {
					provider = {
						name = "file_type",
						opts = {
							filetype_icon = true,
							case = "titlecase",
						},
					},
					left_sep = "block",
					right_sep = "block",
				},
				file_encoding = {
					provider = "file_encoding",
					left_sep = "block",
					right_sep = "block",
				},
				position = {
					provider = "position",
					left_sep = "block",
					right_sep = "block",
				},
				line_percentage = {
					provider = "line_percentage",
					left_sep = "block",
					right_sep = "block",
				},
				scroll_bar = {
					provider = "scroll_bar",
				},
			}

			local left = {
				c.vim_mode,
				c.gitBranch,
				c.gitDiffAdded,
				c.gitDiffRemoved,
				c.gitDiffChanged,
				c.separator,
			}

			local middle = {}

			local right = {
				c.diagnostic_errors,
				c.diagnostic_warnings,
				c.diagnostic_info,
				c.diagnostic_hints,

				c.file_type,
				c.file_encoding,
				c.position,
				c.line_percentage,
				c.scroll_bar,
			}

			local components = {
				active = {
					left,
					middle,
					right,
				},
				inactive = {
					left,
					middle,
					right,
				},
			}

			feline.setup({
				components = components,
			})
		end,
	},
	{ "vimpostor/vim-tpipeline" },

	{
		"glepnir/lspsaga.nvim",
		event = "BufReadPre",
		keys = {
			{ "<leader>lo", "<cmd>Lspsaga outline<CR>", desc = "outline" },
			{ "<leader>lr", "<cmd>Lspsaga rename<CR>", desc = "rename" },
			{ "<leader>la", "<cmd>Lspsaga code_action<CR>", desc = "code action" },
			{ "gh", "<cmd>Lspsaga lsp_finder<CR>", desc = "lsp finder" },
			{ "K", "<cmd>Lspsaga hover_doc<CR>", desc = "hover_doc" },
		},
		config = function()
			require("lspsaga").setup({
				ui = {
					-- currently only round theme
					theme = "round",
					-- border type can be single,double,rounded,solid,shadow.
					border = vim.g.border_style,
				},
				symbol_in_winbar = {
					enable = true,
					separator = " ",
					hide_keyword = true,
					show_file = true,
					folder_level = 2,
					respect_root = false,
					color_mode = false,
				},
			})
		end,
	},

	{
		"goolord/alpha-nvim",
		config = function()
			local status_ok, alpha = pcall(require, "alpha")
			if not status_ok then
				return
			end

			local dashboard = require("alpha.themes.dashboard")

			-- Footer
			local function footer()
				local version = vim.version()
				local print_version = "v" .. version.major .. "." .. version.minor .. "." .. version.patch
				local datetime = os.date("%Y/%m/%d %H:%M:%S")

				return print_version .. " " .. datetime
			end

			-- Banner
			local banner = {
				"                                                    ",
				" ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
				" ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
				" ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
				" ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
				" ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
				" ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
				"                                                    ",
			}

			dashboard.section.header.val = banner
			dashboard.section.footer.opts.hl = "Type"
			dashboard.section.header.opts.hl = "AlphaHeader"
			dashboard.section.buttons.opts.hl = "AlphaButtons"
			dashboard.opts.layout[1].val = 8

			-- Menu
			dashboard.section.buttons.val = {
				dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
				-- dashboard.button("P", "  Find project", ":Telescope projects previewer=false theme=dropdown<CR>"),
				dashboard.button("F", "  Find Text", "<cmd>Telescope live_grep theme=ivy<cr>"),
				dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
				dashboard.button("s", "  Settings", ":e $MYVIMRC<CR>"),
				dashboard.button("u", "  Update plugins", ":Lazy sync<CR>"),
				dashboard.button("q", "  Quit", ":qa<CR>"),
			}

			for _, button in ipairs(dashboard.section.buttons.val) do
				button.opts.hl = "AlphaButtons"
				button.opts.hl_shortcut = "AlphaShortcut"
			end

			dashboard.section.footer.val = footer()

			alpha.setup(dashboard.config)
		end,
	},
}
