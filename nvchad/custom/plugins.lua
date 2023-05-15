local overrides = require("custom.configs.overrides")

local plugins = {

	-- Override plugin definition options

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		keys = {
			{ "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find files" },
			{ "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
			{ "<leader>F", "<cmd>Telescope live_grep theme=ivy<cr>", desc = "Find Text" },
		},
		opts = overrides.telescope,
	},

	{
		"hrsh7th/nvim-cmp",
		opts = overrides.cmp,
	},

	{
		"hrsh7th/cmp-cmdline",
		event = { "CmdlineEnter" },
		dependencies = { "hrsh7th/nvim-cmp" },
		config = function()
			require("cmp").setup.cmdline({ "/", "?" }, {
				mapping = require("cmp").mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})
			require("cmp").setup.cmdline(":", {
				mapping = require("cmp").mapping.preset.cmdline(),
				sources = require("cmp").config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
		end,
	},

	-- Install a plugin
	-- {
	-- 	"max397574/better-escape.nvim",
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		require("better_escape").setup()
	-- 	end,
	-- },

	{
		"mbbill/undotree",
		keys = { { "<leader>2", ":UndotreeToggle<cr>", desc = "Undo" } },
	},

	{
		"Pocco81/AutoSave.nvim",
		event = { "InsertLeave", "TextChanged" },
		opts = {
			execution_message = { message = "" },
		},
	},

	{
		"simrat39/symbols-outline.nvim",
		config = true,
		keys = { { "<leader>3", ":SymbolsOutline<CR>", desc = "SymbolsOutline" } },
	},

	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		opts = { delay = 200 },
		config = overrides.illuminate,
		keys = {
			{ "]]", desc = "Next Reference" },
			{ "[[", desc = "Prev Reference" },
		},
	},

	{ "f-person/git-blame.nvim", event = "BufReadPre" },
	{ "ethanholz/nvim-lastplace", config = true, event = "BufReadPre" },
	{ "karb94/neoscroll.nvim", config = true, event = "BufReadPre" },

	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
		},
	},

	{
		"zbirenbaum/copilot-cmp",
		event = { "InsertEnter", "LspAttach" },
		opts = {
			fix_pairs = true,
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
		"folke/trouble.nvim",
		keys = {
			{ "gr", "<cmd>TroubleToggle lsp_references<cr>", desc = "references" },
			{ "gI", "<cmd>TroubleToggle lsp_implementations<CR>", desc = "impl" },
			{ "<space>lw", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "document_diagnostics" },
			{ "<space>lW", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "workspace_diagnostics" },
		},
	},

	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},

	{
		"nvim-pack/nvim-spectre",
		keys = {
			{ "<leader>sp", "<cmd>lua require('spectre').open()<CR>", desc = "spectre" },
			{ "<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", desc = "search word" },
			{
				"<leader>sf",
				"viw:lua require('spectre').open_file_search()<cr>",
				desc = "open_file_search",
			},
		},
	},

	{
		"folke/noice.nvim",
		event = "CmdlineEnter",
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},

	-- {
	--     "folke/persistence.nvim",
	--     opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help" } },
	--     lazy = false,
	-- },
	--
	-- {
	--     "glepnir/dashboard-nvim",
	--     lazy = false,
	--     opts = {
	--         theme = "hyper",
	--         config = {
	--             week_header = {
	--                 enable = true,
	--             },
	--             shortcut = {
	--                 { desc = " Update", group = "@property", action = "Lazy update", key = "u" },
	--                 {
	--                     icon = " ",
	--                     icon_hl = "@variable",
	--                     desc = "Files",
	--                     group = "Label",
	--                     action = "Telescope find_files",
	--                     key = "f",
	--                 },
	--                 {
	--                     desc = " Sessions",
	--                     group = "DiagnosticHint",
	--                     action = function()
	--                         require("persistence").load()
	--                     end,
	--                     key = "s",
	--                 },
	--                 {
	--                     desc = " New file",
	--                     group = "Number",
	--                     action = "enew",
	--                     key = "e",
	--                 },
	--             },
	--         },
	--     },
	-- },

	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },

	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	-- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
	-- {
	--   "mg979/vim-visual-multi",
	--   lazy = false,
	-- }
	require("custom.configs.dap"),
}

return plugins
