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
		"rust",
		"bash",
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

		-- web dev stuff
		-- "css-lsp",
		-- "html-lsp",
		-- "typescript-language-server",
		-- "deno",
		-- "prettier",

		-- c/cpp stuff
		-- "clangd",
		-- "clang-format",

		-- go
		"gopls",
		"golines",
		"golangci-lint",
		"go-debug-adapter",

		-- php
		"intelephense",

		-- rust
		"rust-analyzer",
		"codelldb",

		-- yaml
		-- "yaml-language-server",
		-- "yamlfmt",
		-- "yamllint",

		-- shell
		"shfmt",
		"shellcheck",
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

M.telescope = {
	defaults = {
		mappings = {
			i = {
				["<C-n>"] = require("telescope.actions").cycle_history_next,
				["<C-p>"] = require("telescope.actions").cycle_history_prev,
				["<C-j>"] = require("telescope.actions").move_selection_next,
				["<C-k>"] = require("telescope.actions").move_selection_previous,
			},
		},
	},
}

M.cmp = {
	mapping = require("cmp").mapping.preset.insert({
		["<C-k>"] = require("cmp").mapping(require("cmp").mapping.select_prev_item(), { "i", "c" }),
		["<C-j>"] = require("cmp").mapping(require("cmp").mapping.select_next_item(), { "i", "c" }),
	}),
	sources = {
        { name = "copilot", group_index = 2 },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
		{ name = "path" },
	},
}

M.illuminate = function(_, opts)
	require("illuminate").configure(opts)

	local function map(key, dir, buffer)
		vim.keymap.set("n", key, function()
			require("illuminate")["goto_" .. dir .. "_reference"](false)
		end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
	end

	map("]]", "next")
	map("[[", "prev")

	-- also set it after loading ftplugins, since a lot overwrite [[ and ]]
	vim.api.nvim_create_autocmd("FileType", {
		callback = function()
			local buffer = vim.api.nvim_get_current_buf()
			map("]]", "next", buffer)
			map("[[", "prev", buffer)
		end,
	})
end
return M
