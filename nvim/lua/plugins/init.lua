return {
	"nvim-lua/plenary.nvim",
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				-- lua stuff
				"lua-language-server",
				"stylua",

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

				-- bash
				-- "bash-language-server",
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			for _, tool in ipairs(opts.ensure_installed) do
				local p = mr.get_package(tool)
				if not p:is_installed() then
					p:install()
				end
			end
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

	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},

	{
		"numToStr/Comment.nvim",
		keys = {
			{
				"<leader>/",
				function()
					require("Comment.api").toggle.linewise.current()
				end,
			},
			{
				"<leader>/",
				"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
				mode = "v",
			},
		},
	},
}
