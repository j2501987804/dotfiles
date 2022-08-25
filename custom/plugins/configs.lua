local M = {}

M.treesitter = {
	ensure_installed = {
		"lua",
		"html",
		"css",
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			node_incremental = "<CR>",
			scope_incremental = "<tab>",
			node_decremental = "<bs>",
		},
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		"deno",
		"emmet-ls",
		"json-lsp",

		-- shell
		"shfmt",
		"shellcheck",
	},
}

M.telescope = function()
	local actions = require("telescope.actions")
	return {
		defaults = {
			mappings = {
				i = {
					["<C-n>"] = actions.cycle_history_next,
					["<C-p>"] = actions.cycle_history_prev,
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
				},
			},
		},
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			},
		},
		extensions_list = { "themes", "terms", "fzf" },
	}
end

M.cmp = function()
	return require("custom.plugins.cmp")
end

M.nvimtree = function()
	return require("custom.plugins.nvimtree")
end

M.nvterrm = {
	terminals = {
		list = {},
		type_opts = {
			float = {
				relative = "editor",
				row = 0.1,
				col = 0.05,
				width = 0.9,
				height = 0.8,
				border = "single",
			},
			horizontal = { location = "rightbelow", split_ratio = 0.3 },
			vertical = { location = "rightbelow", split_ratio = 0.5 },
		},
	},
}

return M
