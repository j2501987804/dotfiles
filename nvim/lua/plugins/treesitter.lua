local M = {
	'nvim-treesitter/nvim-treesitter',
	build = ":TSUpdate",
}
M.config = function()
	local treesitter = require "nvim-treesitter.configs"
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
	})

end

return M
