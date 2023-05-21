local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",
		"c",
		"markdown",
		"markdown_inline",

		"go",
		"gomod",
	},
	indent = {
		enable = false,
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

		-- c/cpp stuff
		"clangd",
		"clang-format",

		"gopls",
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

-- M.cmp = function()
-- 	local cmp = require("cmp")
-- 	cmp.setup.cmdline({ "/", "?" }, {
-- 		mapping = cmp.mapping.preset.cmdline(),
-- 		sources = {
-- 			{ name = "buffer" },
-- 		},
-- 	})
--
-- 	cmp.setup.cmdline(":", {
-- 		mapping = cmp.mapping.preset.cmdline(),
-- 		sources = cmp.config.sources({
-- 			{ name = "path" },
-- 		}, {
-- 			{ name = "cmdline" },
-- 		}),
-- 	})
-- end

M.cmp = {
	sources = {
		{ name = "copilot" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
		{ name = "path" },
	},
}
return M
