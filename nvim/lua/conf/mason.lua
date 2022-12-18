require("mason").setup({
	ui = {
		border = "rounded",
	}
})

require('mason-tool-installer').setup {
	ensure_installed = {
		'stylua',
		'json-to-struct',
		'shellcheck',
		'shfmt',

		-- go
		'golangci-lint',
		'goimports',
	},
}

-- Ensure the servers above are installed
require('mason-lspconfig').setup {
    ensure_installed = vim.g.lsp_servers,
}