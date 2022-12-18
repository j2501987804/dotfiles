local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

lspconfig.setup = function()
	local signs = {

		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		virtual_text = false, -- disable virtual text
		signs = {
			active = signs, -- show signs
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

-- local function lsp_keymaps(bufnr)
-- 	local opts = { noremap = true, silent = true }
-- 	local keymap = vim.api.nvim_buf_set_keymap
-- 	-- keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
-- 	-- keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
-- 	-- -- keymap(bufnr, "n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
-- 	-- keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
-- 	-- keymap(bufnr, "n", "gr", "<cmd>TroubleToggle lsp_references<cr>", opts)
-- 	-- keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
-- 	-- keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ buffer = " .. bufnr .. " }<cr>", opts)
-- 	-- keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
-- 	-- keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
-- 	-- keymap(bufnr, "n", "<leader>la", "<cmd>Lspsaga code_action<CR>", opts)
-- 	-- keymap(bufnr, "n", "<leader>lj", '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
-- 	-- keymap(bufnr, "n", "<leader>lk", '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
-- 	-- keymap(bufnr, "n", "<leader>lr", "<cmd>Lspsaga rename<CR>", opts)
-- 	-- keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
-- 	-- keymap(bufnr, "n", "<leader>ls", "<cmd>LspRestart<cr>", opts)
-- 	-- keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
-- end

local on_attach = function(client, _)
	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end

	-- if client.name == "sumneko_lua" then
	-- 	client.server_capabilities.documentFormattingProvider = false
	-- end

	-- lsp_keymaps(bufnr)
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
end

local servers = vim.g.lsp_servers


-- Example custom configuration for lua
--
-- Make runtime files discoverable to the server
-- doc: https://github.com/glepnir/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')
local lsp_settings = {
	-- lua
	sumneko_lua = {
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT)
					version = 'LuaJIT',
					-- Setup your lua path
					path = runtime_path,
				},
				diagnostics = {
					globals = { 'vim' },
				},
				workspace = { library = vim.api.nvim_get_runtime_file('', true) },
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = { enable = false },
			},
		}
	},

	-- golang
	-- ['gopls'] = {filetypes={"go", "gomod", "gowork", "gotmpl"}},
}

for _, lsp in ipairs(servers) do
	local options = {
		on_attach = on_attach,
		capabilities = capabilities,
	}
	if lsp_settings[lsp] then
		options = vim.tbl_extend('force', options, lsp_settings[lsp])
	end
	require('lspconfig')[lsp].setup(options)
end

-- Turn on lsp status information
require('fidget').setup()
