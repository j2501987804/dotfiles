local pack = require("pack")
local plugins = {
	["wbthomason/packer.nvim"] = {},
	["nvim-lua/plenary.nvim"] = {},

	-----------------------------------------------------------
	-- UI
	-----------------------------------------------------------
	["projekt0n/github-nvim-theme"] = {
		config = function()
			require("github-theme").setup()
		end
	},

	["kyazdani42/nvim-web-devicons"] = {},

	["goolord/alpha-nvim"] = {
		config = function()
			require("conf.alpha")
		end
	},

	["nvim-lualine/lualine.nvim"] = {
		after = "nvim-web-devicons",
		config = function()
			require("conf.lualine")
		end
	},

	["akinsho/bufferline.nvim"] = {
		event = "BufRead",
		config = function()
			require("bufferline").setup()
		end,
	},

	["moll/vim-bbye"] = {
		cmd = "Bdelete"
	},

	["lukas-reineke/indent-blankline.nvim"] = {
		event = "BufRead",
		config = function()
			require("conf.others").blankline()
		end,
	},

	["nvim-treesitter/nvim-treesitter"] = {
		event = { "BufRead", "BufNewFile" },
		run = ":TSUpdate",
		config = function()
			require "conf.treesitter"
		end,
	},

	-- vim and tmux statusline merge
	["vimpostor/vim-tpipeline"] = {
	},

	-- quickfix ui
	["kevinhwang91/nvim-bqf"] = { ft = "qf" },


	-----------------------------------------------------------
	-- LSP
	-----------------------------------------------------------
	["hrsh7th/cmp-nvim-lsp"] = {},

	-- automatically highlighting other uses
	["rrethy/vim-illuminate"] = {
		after = "cmp-nvim-lsp",
	},

	["neovim/nvim-lspconfig"] = {
		after = "vim-illuminate",
		config = function()
			require("conf.lspconfig")
		end,
	},

	["ray-x/lsp_signature.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require("conf.others").signature()
		end,
	},

	["tami5/lspsaga.nvim"] = {
		after = "lsp_signature.nvim",
		config = function()
			require("conf.others").lspsaga()
		end
	},

	-----------------------------------------------------------
	-- CMP
	-----------------------------------------------------------
	["rafamadriz/friendly-snippets"] = {
		module = "cmp_nvim_lsp",
		event = { "InsertEnter", "CmdlineEnter" },
	},

	["hrsh7th/nvim-cmp"] = {
		after = "friendly-snippets",
		config = function()
			require("conf.cmp")
		end,
	},

	["L3MON4D3/LuaSnip"] = {
		wants = "friendly-snippets",
		after = "nvim-cmp",
		config = function()
			require("conf.others").luasnip()
		end,
	},

	["saadparwaiz1/cmp_luasnip"] = {
		after = "LuaSnip",
	},

	["hrsh7th/cmp-nvim-lua"] = {
		after = "cmp_luasnip",
	},

	["hrsh7th/cmp-buffer"] = {
		after = "cmp-nvim-lua",
	},

	["hrsh7th/cmp-path"] = {
		after = "cmp-buffer",
	},

	["hrsh7th/cmp-cmdline"] = {
		after = "cmp-path",
	},

	["tzachar/cmp-tabnine"] = {
		after = "cmp-cmdline",
		run = "./install.sh"
	},

	["windwp/nvim-autopairs"] = {
		after = "nvim-cmp",
		config = function()
			require("conf.others").autopairs()
		end,
	},

	-----------------------------------------------------------
	-- git stuff
	-----------------------------------------------------------
	["lewis6991/gitsigns.nvim"] = {
		event = { "BufRead", "BufNewFile" },
		config = function()
			require('gitsigns').setup()
		end,
	},

	["sindrets/diffview.nvim"] = { cmd = { "DiffviewOpen", "DiffviewFileHistory" } },

	["f-person/git-blame.nvim"] = {
		event = { "BufRead", "BufNewFile" },
	},


	-----------------------------------------------------------
	-- telescope
	-----------------------------------------------------------
	["nvim-telescope/telescope.nvim"] = {
		cmd = "Telescope",
		config = function()
			require "conf.telescope"
		end,
	},

	["nvim-telescope/telescope-fzf-native.nvim"] = {
		run = "make",
		setup = function()
			require("pack").packer_lazy_load("telescope-fzf-native.nvim")
		end,
	},

	-----------------------------------------------------------
	-- navigation
	-----------------------------------------------------------
	["williamboman/mason.nvim"] = {
		config = function()

		end
	},

	["WhoIsSethDaniel/mason-tool-installer.nvim"] = {
		config = function()
			require("conf.mason")
		end
	},

	["kyazdani42/nvim-tree.lua"] = {
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		config = function()
			require "conf.nvimtree"
		end,
	},

	["akinsho/toggleterm.nvim"] = {
		setup = function()
			require("pack").packer_lazy_load("toggleterm.nvim")
		end,
		config = function()
			require("conf.toggleterm")
		end
	},

	["folke/trouble.nvim"] = {
		cmd = { "TroubleToggle" },
		config = [[require("trouble").setup()]],
	},

	["stevearc/aerial.nvim"] = {
		cmd = "AerialToggle",
		config = [[require("aerial").setup()]],
	},

	["windwp/nvim-spectre"] = {
		module = "spectre",
		config = [[require 'spectre'.setup()]],
	},

	["mbbill/undotree"] = {
		cmd = "UndotreeToggle",
		config = require("conf.others").undotree,
	},


	-----------------------------------------------------------
	-- others
	-----------------------------------------------------------
	["folke/which-key.nvim"] = {
		setup = function()
			require("pack").packer_lazy_load "which-key.nvim"
		end,
		config = function()
			require "conf.whichkey"
		end,
	},

	["norcalli/nvim-colorizer.lua"] = {
		event = "BufRead",
		config = [[require'colorizer'.setup()]],
	},

	["Pocco81/AutoSave.nvim"] = {
		config = function()
			require("auto-save").setup {}
		end,
	},

	-- last read
	["ethanholz/nvim-lastplace"] = {
		event = { "BufRead", "BufNewFile" },
		config = [[require("conf.others").lastplace()]]
	},

	["numToStr/Comment.nvim"] = {
		module = "Comment",
		config = function()
			require("conf.others").comment()
		end,
	},

	["karb94/neoscroll.nvim"] = {
		event = { "BufRead", "BufNewFile" },
		config = [[require 'neoscroll'.setup()]],
	},

	["phaazon/hop.nvim"] = {
		cmd = "HopWord",
		config = "require 'hop'.setup{}",
	},

	["dstein64/vim-startuptime"] = { cmd = "StartupTime" },

	["brglng/vim-im-select"] = {
		event = { "InsertEnter" },
		cond = pack.is_mac,
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

pack.run(plugins)
