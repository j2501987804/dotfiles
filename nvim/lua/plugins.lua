local pack = require("pack")
local plugins = {
	"wbthomason/packer.nvim",
	"lewis6991/impatient.nvim",
	"nathom/filetype.nvim",
	"nvim-lua/plenary.nvim",

	-----------------------------------------------------------
	-- UI
	-----------------------------------------------------------
	-- theme
	-- 'navarasu/onedark.nvim',
	-- "projekt0n/github-nvim-theme",
	"folke/tokyonight.nvim",
	-- "tomasiser/vim-code-dark",
	-- "lunarvim/darkplus.nvim",
	-- "sainnhe/sonokai",
	-- 'olimorris/onedarkpro.nvim',
	-- 'catppuccin/nvim',

	"kyazdani42/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",
	"akinsho/bufferline.nvim",
	"moll/vim-bbye",
	"lukas-reineke/indent-blankline.nvim",
	"goolord/alpha-nvim",
	{
		"nvim-treesitter/nvim-treesitter",
		run = function()
			pcall(require('nvim-treesitter.install').update { with_sync = true })
		end,
	},
	{ -- Additional text objects via treesitter
		'nvim-treesitter/nvim-treesitter-textobjects',
		after = 'nvim-treesitter',
	},

	-- vim and tmux statusline merge
	"vimpostor/vim-tpipeline",

	-- quickfix ui
	"kevinhwang91/nvim-bqf",


	-----------------------------------------------------------
	-- LSP
	-----------------------------------------------------------
	"hrsh7th/cmp-nvim-lsp",
	"rrethy/vim-illuminate",
	"neovim/nvim-lspconfig",
	"ray-x/lsp_signature.nvim",
	"glepnir/lspsaga.nvim",
	"williamboman/mason-lspconfig.nvim",
	"williamboman/mason.nvim",
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	'j-hui/fidget.nvim',

	-----------------------------------------------------------
	-- CMP
	-----------------------------------------------------------
	"rafamadriz/friendly-snippets",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	-- {
	-- 	"tzachar/cmp-tabnine",
	-- 	run = "./install.sh"
	-- },
	"hrsh7th/nvim-cmp",
	"windwp/nvim-autopairs",

	-----------------------------------------------------------
	-- git stuff
	-----------------------------------------------------------
	"lewis6991/gitsigns.nvim",
	"sindrets/diffview.nvim",
	"f-person/git-blame.nvim",

	-----------------------------------------------------------
	-- telescope
	-----------------------------------------------------------
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	},
	"nvim-telescope/telescope.nvim",
	"ahmedkhalf/project.nvim",

	-----------------------------------------------------------
	-- navigation
	-----------------------------------------------------------
	"kyazdani42/nvim-tree.lua",
	"akinsho/toggleterm.nvim",
	"folke/trouble.nvim",
	"windwp/nvim-spectre",
	"mbbill/undotree",


	-----------------------------------------------------------
	-- others
	-----------------------------------------------------------
	"folke/which-key.nvim",
	"norcalli/nvim-colorizer.lua",
	"Pocco81/AutoSave.nvim",
	-- last read
	"ethanholz/nvim-lastplace",
	"numToStr/Comment.nvim",
	"karb94/neoscroll.nvim",
	"ggandor/leap.nvim",
	"dstein64/vim-startuptime",
	"brglng/vim-im-select",
	"folke/todo-comments.nvim",

	-----------------------------------------------------------
	-- lang
	-----------------------------------------------------------
	{
		"ray-x/go.nvim",
		ft = "go",
		config = [[ require("go").setup()]],
	},
}

pack.run(plugins)

local defualt = { 'neoscroll', 'bufferline', 'colorizer', 'gitsigns', 'todo-comments' }
for _, value in pairs(defualt) do
	local ok, plugin = pcall(require, value)
	if ok then
		plugin.setup()
	end
end

local conf_names = { "alpha", "cmp", "lualine", "mason", "nvimtree", "telescope",
	"toggleterm", "treesitter", "whichkey", 'null-ls', 'lsp', 'lspsaga', 'common' }
for _, value in pairs(conf_names) do
	require("conf." .. value)
end
