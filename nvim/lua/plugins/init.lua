return {
	"nvim-lua/plenary.nvim",
	"kyazdani42/nvim-web-devicons",
	{
		"rebelot/kanagawa.nvim",
		config = function()
			vim.cmd("colorscheme kanagawa")
		end,
	},

	{
		"mbbill/undotree",
		keys = { { "<leader>2", ":UndotreeToggle<cr>", desc = "Undo" } },
	},

	{
		"Pocco81/AutoSave.nvim",
		opts = {
			execution_message = { message = "" },
		},
	},

	{
		"brglng/vim-im-select",
		event = { "InsertEnter" },
		cond = vim.fn.has("mac") == 1,
	},

	{ "ray-x/go.nvim", config = true, ft = "go" },
}
