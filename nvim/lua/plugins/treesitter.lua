return {
	"nvim-treesitter/nvim-treesitter",
	version = false, -- last release is way too old and doesn't work on Windows
	build = ":TSUpdate",
	opts_extend = { "ensure_installed" },
	opts = {
		highlight = { enable = true },
		indent = { enable = true },
        -- stylua: ignore
		ensure_installed = {
			"bash", "c", "diff", "html", "javascript", "jsdoc",
			"json", "jsonc", "lua", "luadoc", "luap", "markdown",
			"markdown_inline", "printf", "python", "query", "regex", "toml",
			"tsx", "typescript", "vim", "vimdoc", "xml", "yaml",
			"go", "gomod", "gowork", "gosum",
        },
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<cr>",
				node_incremental = "<cr>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
