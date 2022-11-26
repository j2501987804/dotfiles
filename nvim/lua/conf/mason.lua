require("mason").setup({
	ui = {
		border = "rounded",
	}
})

require('mason-tool-installer').setup {
	ensure_installed = {
		{ 'bash-language-server', auto_update = true },
		'lua-language-server',
		'vim-language-server',
		'stylua',
		'json-to-struct',
		'shellcheck',
		'shfmt',

		-- go
		'gopls',
		'golangci-lint',
		'goimports',

		-- php
		'intelephense',
	},
}
