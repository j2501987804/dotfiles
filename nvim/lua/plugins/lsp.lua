local M = {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	dependencies = {
		"williamboman/mason.nvim",
		"ray-x/lsp_signature.nvim",
		"j-hui/fidget.nvim",
		"RRethy/vim-illuminate",
		"jose-elias-alvarez/null-ls.nvim",
	},
}

M.config = function()
	require("mason").setup()
	require("lsp_signature").setup()
	require("fidget").setup({})

	-- mason
	local ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- go
		"gopls",
		"golines",
		"golangci-lint",

		-- php
		"intelephense",

		-- rust
		"rust-analyzer",

		-- yaml
		"yaml-language-server",
		"yamlfmt",
		"yamllint",

		-- web dev
		-- "css-lsp",
		-- "html-lsp",
		-- "typescript-language-server",
		-- "deno",
		-- "emmet-ls",
		-- "json-lsp",

		-- shell
		"shfmt",
		"shellcheck",

		-- bash
		"bash-language-server",
	}
	vim.api.nvim_create_user_command("MasonInstallAll", function()
		vim.cmd("MasonInstall " .. table.concat(ensure_installed, " "))
	end, {})

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	-- 	border = "rounded",
	-- })
	-- Use an on_attach function to only map the following keys
	-- after the language server attaches to the current buffer
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
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
		-- vim.keymap.set("n", "<space>lw", "<cmd>TroubleToggle workspace_diagnostics<CR>", bufopts)
		vim.keymap.set("n", "<space>lr", "<cmd>LspRestart<CR>", bufopts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
		-- vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
		-- vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
		-- vim.keymap.set("n", "gr", "<cmd>TroubleToggle lsp_references<cr>", bufopts)
		vim.keymap.set("n", "<space>lf", function()
			vim.lsp.buf.format({ async = true })
		end, bufopts)
	end

	local lsp_flags = {
		-- This is the default in Nvim 0.7+
		debounce_text_changes = 150,
	}
	local lspconfig = require("lspconfig")
	local capabilities = vim.lsp.protocol.make_client_capabilities()

	capabilities.textDocument.completion.completionItem = {
		documentationFormat = { "markdown", "plaintext" },
		snippetSupport = true,
		preselectSupport = true,
		insertReplaceSupport = true,
		labelDetailsSupport = true,
		deprecatedSupport = true,
		commitCharactersSupport = true,
		tagSupport = { valueSet = { 1 } },
		resolveSupport = {
			properties = {
				"documentation",
				"detail",
				"additionalTextEdits",
			},
		},
	}

	local lsp_settings = {
		sumneko_lua = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			},
		},
	}

	local servers = {
		"sumneko_lua",
		"html",
		"cssls",
		"gopls",
		"rust_analyzer",
		"intelephense",
		"jsonls",
		"bashls",
		"yamlls",
		"bufls",
	}

	for _, lsp in ipairs(servers) do
		lspconfig[lsp].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = lsp_settings[lsp],
			flags = lsp_flags,
		})
	end

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