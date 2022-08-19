return {
	-- lsp extra --
	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require("custom.plugins.null-ls").setup()
		end,
	},

	-- cmp extra --
	["rafamadriz/friendly-snippets"] = {
		module = "cmp_nvim_lsp",
		event = { "InsertEnter", "CmdlineEnter" },
	},

	["hrsh7th/cmp-cmdline"] = {
		after = "cmp-path",
	},

	["tzachar/cmp-tabnine"] = {
		after = "cmp-cmdline",
		run = "./install.sh",
	},

	-- telescope extra --
	-- ["nvim-telescope/telescope.nvim"] = {
	--     cmd = "Telescope",
	--     config = function()
	--         require "plugins.configs.telescope"
	--     end,
	--     requires = {
	--         "nvim-telescope/telescope-dap.nvim",
	--         "nvim-telescope/telescope-ui-select.nvim",
	--     },
	-- },
	["nvim-telescope/telescope-dap.nvim"] = {
		setup = function()
			require("core.utils").packer_lazy_load("telescope-dap.nvim")
		end,
	},
	["nvim-telescope/telescope-ui-select.nvim"] = {
		setup = function()
			require("core.utils").packer_lazy_load("telescope-ui-select.nvim")
		end,
	},
	["nvim-telescope/telescope-fzf-native.nvim"] = {
		run = "make",
		setup = function()
			require("core.utils").packer_lazy_load("telescope-fzf-native.nvim")
		end,
	},

	-- git --
	["sindrets/diffview.nvim"] = { cmd = { "DiffviewOpen", "DiffviewFileHistory" } },

	["f-person/git-blame.nvim"] = {
		event = { "BufRead", "BufNewFile" },
	},

	-- dap --
	["theHamsta/nvim-dap-virtual-text"] = {
		module = "dap",
	},
	["rcarriga/nvim-dap-ui"] = {
		after = "nvim-dap-virtual-text",
	},
	["mfussenegger/nvim-dap"] = {
		after = "nvim-dap-ui",
		config = [[require "custom.plugins.nvim-dap"]],
	},

	-- other --
	["Pocco81/AutoSave.nvim"] = {
		event = { "TextChanged", "TextChangedI" },
		config = [[require("autosave").setup()]],
	},

	["ethanholz/nvim-lastplace"] = {
		event = { "BufRead", "BufNewFile" },
		config = [[require("custom.plugins.others").lastplace()]],
	},

	["folke/trouble.nvim"] = {
		cmd = { "TroubleToggle" },
		config = [[require("trouble").setup()]],
	},

	["rcarriga/nvim-notify"] = {
		setup = function()
			require("core.utils").packer_lazy_load("nvim-notify")
		end,
		config = function()
			vim.notify = require("notify")
		end,
	},

	["akinsho/toggleterm.nvim"] = {
		setup = function()
			require("core.utils").packer_lazy_load("toggleterm.nvim")
		end,
		config = function()
			require("custom.plugins.toggleterm")
		end,
	},

	["stevearc/aerial.nvim"] = {
		cmd = "AerialToggle",
		config = [[require("aerial").setup()]],
	},

	["karb94/neoscroll.nvim"] = {
		setup = function()
			require("core.utils").packer_lazy_load("neoscroll.nvim")
		end,
		config = [[require 'neoscroll'.setup()]],
	},

	["phaazon/hop.nvim"] = {
		cmd = "HopWord",
		config = "require 'hop'.setup{}",
	},

	["kevinhwang91/nvim-hlslens"] = { event = "CmdlineEnter" },

	["dstein64/vim-startuptime"] = { cmd = "StartupTime" },

	["windwp/nvim-spectre"] = {
		module = "spectre",
		config = [[require 'spectre'.setup()]],
	},

	["mbbill/undotree"] = {
		cmd = "UndotreeToggle",
		config = require("custom.plugins.others").undotree,
	},

	["brglng/vim-im-select"] = {
		event = { "BufRead", "BufNewFile" },
	},

	-- lang --
	["ray-x/go.nvim"] = {
		ft = "go",
		config = function()
			require("go").setup()
		end,
	},
}
