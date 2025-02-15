return {
	"neovim/nvim-lspconfig",
	event = "BufReadPost",
	dependencies = {
		{
			"williamboman/mason.nvim",
			opts_extend = { "ensure_installed" },
			opts = {
				ensure_installed = nv.mason,
			},
			config = function(_, opts)
				require("mason").setup(opts)
				local mr = require("mason-registry")
				mr:on("package:install:success", function()
					vim.defer_fn(function()
						require("lazy.core.handler.event").trigger({
							event = "FileType",
							buf = vim.api.nvim_get_current_buf(),
						})
					end, 100)
				end)

				mr.refresh(function()
					for _, tool in ipairs(opts.ensure_installed) do
						local p = mr.get_package(tool)
						if not p:is_installed() then
							p:install()
						end
					end
				end)
			end,
		},
		{ "j-hui/fidget.nvim", opts = {} },
		"saghen/blink.cmp",
		{
			"ray-x/lsp_signature.nvim",
			opts = { floating_window = false },
		},
	},
	config = function()
		local signs = { ERROR = "", WARN = "", INFO = "", HINT = "" }
		local diagnostic_signs = {}
		for type, icon in pairs(signs) do
			diagnostic_signs[vim.diagnostic.severity[type]] = icon
		end
		vim.diagnostic.config({ signs = { text = diagnostic_signs } })
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
		local lspconfig = require("lspconfig")
		for server, config in pairs(nv.lsp_server) do
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			lspconfig[server].setup(config)
		end
	end,
}
