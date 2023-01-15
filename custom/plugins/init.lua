local overrides = require("custom.plugins.overrides")

return {
	-- ["goolord/alpha-nvim"] = {
	-- 	disable = false,
	-- }, -- enables dashboard

	["folke/which-key.nvim"] = {
		disable = false,
		keys = { "<leader>", '"', "'", "`", "g", ";" },
	},

	["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.plugins.lspconfig")
		end,
	},

	-- code formatting, linting etc
	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require("custom.plugins.null-ls")
		end,
	},

	-- vim and tmux statusline merge
	["vimpostor/vim-tpipeline"] = {},

	["RRethy/vim-illuminate"] = {},

	-- Override plugin definition options
	["nvim-treesitter/nvim-treesitter"] = {
		override_options = overrides.treesitter,
	},

	["NvChad/nvterm"] = false,

	["williamboman/mason.nvim"] = {
		override_options = overrides.mason,
	},

	["kyazdani42/nvim-tree.lua"] = {
		override_options = overrides.nvimtree,
	},

	["nvim-telescope/telescope.nvim"] = {
		override_options = overrides.telescope,
		requires = {
			"nvim-telescope/telescope-fzf-native.nvim",
			run = "make",
		},
	},

	["hrsh7th/nvim-cmp"] = {
		override_options = overrides.cmp,
	},
	["hrsh7th/cmp-cmdline"] = { after = "cmp-buffer" },

	-- Install a plugin
	["max397574/better-escape.nvim"] = {
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	["folke/trouble.nvim"] = {
		cmd = { "TroubleToggle" },
		config = [[require("trouble").setup()]],
	},

	-----------------------------------------------------------
	-- git stuff
	-----------------------------------------------------------
	["sindrets/diffview.nvim"] = { cmd = { "DiffviewOpen", "DiffviewFileHistory" } },

	["f-person/git-blame.nvim"] = {
		event = { "BufRead", "BufNewFile" },
	},

	-----------------------------------------------------------
	-- others
	-----------------------------------------------------------
	["Pocco81/AutoSave.nvim"] = {
		event = { "TextChanged", "TextChangedI" },
		config = function()
			require("auto-save").setup({})
		end,
	},

	-- last read
	["ethanholz/nvim-lastplace"] = {
		event = { "BufRead", "BufNewFile" },
		config = [[require("nvim-lastplace").setup()]],
	},

	["karb94/neoscroll.nvim"] = {
		event = { "BufRead", "BufNewFile" },
		config = [[require 'neoscroll'.setup()]],
	},

	["brglng/vim-im-select"] = {
		event = { "InsertEnter" },
		cond = vim.fn.has("mac") == 1,
	},

	["ggandor/leap.nvim"] = {},

	["folke/todo-comments.nvim"] = {
		config = [[require('todo-comments').setup()]],
	},

	-- ["glepnir/lspsaga.nvim"] = {
	-- 	branch = "main",
	-- 	config = [[require("custom.plugins.lspsaga")]],
	-- },

	["j-hui/fidget.nvim"] = {
		config = [[require 'fidget'.setup()]],
	},

	["akinsho/toggleterm.nvim"] = {
		config = [[require 'custom.plugins.toggleterm']],
	},

	["dstein64/vim-startuptime"] = {
		cmd = "StartupTime",
	},

	-----------------------------------------------------------
	-- lang
	-----------------------------------------------------------
	["ray-x/go.nvim"] = {
		ft = "go",
		config = function()
			require("go").setup()
		end,
	},
}
