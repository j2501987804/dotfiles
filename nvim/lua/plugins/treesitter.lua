local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = "p00f/nvim-ts-rainbow",
}
M.config = function()
	local treesitter = require("nvim-treesitter.configs")
	treesitter.setup({
		ensure_installed = { "go", "lua", "rust" },
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
end

return M
