local builtins = require("null-ls").builtins
require("null-ls").setup({
	sources = {
		-- require("null-ls").builtins.formatting.stylua,
		-- require("null-ls").builtins.diagnostics.eslint,
		-- require("null-ls").builtins.completion.spell,

		-- go
		builtins.diagnostics.golangci_lint,
		builtins.formatting.goimports,
	},
})
