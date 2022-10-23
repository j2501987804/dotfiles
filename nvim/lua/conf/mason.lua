require("mason").setup({
	ui = {
		border = "rounded",
	}
})

local servers = { "gopls", "sumneko_lua", "bashls", "intelephense", "rust_analyzer", "pyright", "clangd" }

require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("conf.lsp").on_attach,
		capabilities = require("conf.lsp").capabilities,
	}

	server = vim.split(server, "@")[1]

	if server == "sumneko_lua" then
		opts = vim.tbl_deep_extend("force", {
			settings = {

				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			}
		}, opts)
	end

	lspconfig[server].setup(opts)
end
