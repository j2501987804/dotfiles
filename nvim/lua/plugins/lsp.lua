local M = {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	dependencies = {
		"ray-x/lsp_signature.nvim",
		"jose-elias-alvarez/null-ls.nvim",
		"hrsh7th/cmp-nvim-lsp",
		{ "j-hui/fidget.nvim", config = true },
	},
}

local servers = {
	sumneko_lua = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
	gopls = {},
	rust_analyzer = {},
	intelephense = {},
}

M.config = function()
	local on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false

		-- Enable completion triggered by <c-x><c-o>
		vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

		-- Mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local bufopts = { noremap = true, silent = true, buffer = bufnr }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
		-- vim.keymap.set("n", "gI", "<cmd>TroubleToggle lsp_implementations<CR>", bufopts)
		-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
		-- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
		-- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
		-- vim.keymap.set("n", "<space>lw", "<cmd>TroubleToggle workspace_diagnostics<CR>", bufopts)
		vim.keymap.set("n", "<space>ls", "<cmd>LspRestart<CR>", bufopts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
		vim.keymap.set("n", "<space>lr", vim.lsp.buf.rename, bufopts)
		vim.keymap.set("n", "<space>la", vim.lsp.buf.code_action, bufopts)
		vim.keymap.set("n", "<space>lf", function()
			vim.lsp.buf.format({ async = true })
		end, bufopts)
	end
	local lspconfig = require("lspconfig")
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	for name, settings in pairs(servers) do
		lspconfig[name].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = settings,
		})
	end

	require("lsp_signature").setup()

	-- null-ls
	local null_ls = require("null-ls")
	local b = null_ls.builtins
	local sources = {
		-- webdev stuff
		b.formatting.deno_fmt,
		b.formatting.prettier.with({ filetypes = { "html", "markdown", "css" } }),

		-- Lua
		b.formatting.stylua,

		-- Shell
		b.formatting.shfmt,
		b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),

		-- cpp
		b.formatting.clang_format,
		b.formatting.rustfmt,

		-- golang
		b.formatting.goimports,
		b.diagnostics.golangci_lint,

		-- yaml
		b.formatting.yamlfmt,
		b.diagnostics.yamllint,
	}
	null_ls.setup({
		debug = true,
		sources = sources,
	})
end
return M
