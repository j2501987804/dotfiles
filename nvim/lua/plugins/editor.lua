return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		cmd = "Telescope",
		keys = {
			{ "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find files" },
			{ "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
			{ "<leader>F", "<cmd>Telescope live_grep theme=ivy<cr>", desc = "Find Text" },
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local options = {
				defaults = {
					mappings = {
						i = {
							["<C-n>"] = actions.cycle_history_next,
							["<C-p>"] = actions.cycle_history_prev,
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
						},
						n = { ["q"] = require("telescope.actions").close },
					},
					vimgrep_arguments = {
						"rg",
						"-L",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
					},
					prompt_prefix = "   ",
					selection_caret = "  ",
					entry_prefix = "  ",
					initial_mode = "insert",
					selection_strategy = "reset",
					sorting_strategy = "ascending",
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.55,
							results_width = 0.8,
						},
						vertical = {
							mirror = false,
						},
						width = 0.87,
						height = 0.80,
						preview_cutoff = 120,
					},
					file_sorter = require("telescope.sorters").get_fuzzy_file,
					file_ignore_patterns = { "node_modules" },
					generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
					path_display = { "truncate" },
					winblend = 0,
					border = {},
					borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					color_devicons = true,
					set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
					file_previewer = require("telescope.previewers").vim_buffer_cat.new,
					grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
					qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
					-- Developer configurations: Not meant for general override
					buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
				},
			}
			telescope.setup(options)
			telescope.load_extension("fzf")
		end,
	},

	{ "folke/which-key.nvim", event = "VeryLazy", config = true },

	{
		"folke/trouble.nvim",
		keys = {
			{ "gI", "<cmd>TroubleToggle lsp_implementations<CR>", desc = "impl" },
			{ "<space>lw", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "document_diagnostics" },
			{ "<space>lW", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "workspace_diagnostics" },
		},
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

	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "契" },
				topdelete = { text = "契" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
				end

				map("n", "]h", gs.next_hunk, "Next Hunk")
				map("n", "[h", gs.prev_hunk, "Prev Hunk")
				map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
				map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
				map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
				map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
				map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
				map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
				map("n", "<leader>ghb", function()
					gs.blame_line({ full = true })
				end, "Blame Line")
				map("n", "<leader>ghd", gs.diffthis, "Diff This")
				map("n", "<leader>ghD", function()
					gs.diffthis("~")
				end, "Diff This ~")
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
			end,
		},
		dependencies = {
			"f-person/git-blame.nvim",
			{ "NvChad/nvim-colorizer.lua", config = true },
			{ "ethanholz/nvim-lastplace", config = true },
			{ "karb94/neoscroll.nvim", config = true },
		},
	},

	{
		"RRethy/vim-illuminate",
		event = "BufReadPost",
		opts = { delay = 200 },
		config = function(_, opts)
			require("illuminate").configure(opts)
		end,
		keys = {
			{
				"]]",
				function()
					require("illuminate").goto_next_reference(false)
				end,
				desc = "Next Reference",
			},
			{
				"[[",
				function()
					require("illuminate").goto_prev_reference(false)
				end,
				desc = "Prev Reference",
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		-- dependencies = "p00f/nvim-ts-rainbow",
		config = function()
			local treesitter = require("nvim-treesitter.configs")
			treesitter.setup({
				ensure_installed = { "go", "lua", "rust", "vim", "regex", "lua", "bash", "markdown", "markdown_inline" },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<CR>",
						node_incremental = "<CR>",
						scope_incremental = "<tab>",
						node_decremental = "<bs>",
					},
				},

				highlight = {
					enable = true,
					use_languagetree = true,
				},

				indent = {
					enable = true,
				},

				rainbow = {
					enable = true,
					-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
					extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
					max_file_lines = nil, -- Do not enable for files with more than n lines, int
					-- colors = {}, -- table of hex strings
					-- termcolors = {} -- table of colour name strings
				},
			})
		end,
	},

	-- {
	-- 	"jackMort/ChatGPT.nvim",
	-- 	config = function()
	-- 		require("chatgpt").setup({
	-- 			-- optional configuration
	-- 		})
	-- 	end,
	-- 	dependencies = {
	-- 		"MunifTanjim/nui.nvim",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-telescope/telescope.nvim",
	-- 	},
	-- },
}
