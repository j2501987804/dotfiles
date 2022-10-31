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
	"projekt0n/github-nvim-theme",
	"folke/tokyonight.nvim",
	"tomasiser/vim-code-dark",
	"lunarvim/darkplus.nvim",
	"sainnhe/sonokai",
	'olimorris/onedarkpro.nvim',
	'catppuccin/nvim',

	"kyazdani42/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",
	"akinsho/bufferline.nvim",
	'fgheng/winbar.nvim',
	'SmiteshP/nvim-gps',
	"moll/vim-bbye",
	"lukas-reineke/indent-blankline.nvim",
	"goolord/alpha-nvim",
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
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
	"tami5/lspsaga.nvim",
	"williamboman/mason-lspconfig.nvim",
	"williamboman/mason.nvim",
	"jose-elias-alvarez/null-ls.nvim",

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
	{
		"tzachar/cmp-tabnine",
		run = "./install.sh"
	},
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
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	"kyazdani42/nvim-tree.lua",
	"akinsho/toggleterm.nvim",
	"folke/trouble.nvim",
	"stevearc/aerial.nvim",
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
	"phaazon/hop.nvim",
	"dstein64/vim-startuptime",
	{
		"brglng/vim-im-select",
		cond = pack.is_mac,
	},

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

-- load config
local defualt = { 'hop', 'neoscroll', 'bufferline', 'colorizer', 'auto-save', 'aerial', 'gitsigns', 'nvim-gps',
	'project_nvim' }
for _, value in pairs(defualt) do
	local ok, plugin = pcall(require, value)
	if ok then
		plugin.setup()
	end
end

local conf_names = { "alpha", "cmp", "lualine", "mason", "nvimtree", "telescope",
	"toggleterm", "treesitter", "whichkey", 'winbar', 'null-ls' }
for _, value in pairs(conf_names) do
	require("conf." .. value)
end

local common = require("conf.common")
for _, value in pairs(common) do
	value()
end
