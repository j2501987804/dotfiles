local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"markdown",
		"markdown_inline",

		"go",
		"gomod",
	},
	indent = {
		enable = true,
		-- disable = {
		--   "python"
		-- },
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- go
		"gopls",
		"goimports-reviser",

		-- python
		"pyright",
		"black",
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}
return M
