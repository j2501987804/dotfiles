local old_on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = { "html", "cssls", "gopls", "rust_analyzer", "intelephense", "jsonls", "bashls", "yamlls", "bufls" }

local on_attach = function(client, bufnr)
	old_on_attach(client, bufnr)
	require("illuminate").on_attach(client)
end

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
