return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"williamboman/mason.nvim",
			opts_extend = { "ensure_installed" },
			opts = {
                -- stylua: ignore
				ensure_installed = {
                    "lua-language-server","stylua",
					"gomodifytags", "impl", "goimports", "gofumpt","gopls",
				},
			},
			config = function(_, opts)
				require("mason").setup(opts)
				local mr = require("mason-registry")
				mr:on("package:install:success", function()
					vim.defer_fn(function()
						-- trigger FileType event to possibly load this newly installed LSP server
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
		-- "williamboman/mason-lspconfig.nvim",
		-- "WhoIsSethDaniel/mason-tool-installer.nvim",

		-- Useful status updates for LSP.
		{ "j-hui/fidget.nvim", opts = {} },
		-- { "saghen/blink.cmp" },

		-- Allows extra capabilities provided by nvim-cmp
		-- 'hrsh7th/cmp-nvim-lsp',
	},
	config = function()
		local signs = { ERROR = "", WARN = "", INFO = "", HINT = "" }
		local diagnostic_signs = {}
		for type, icon in pairs(signs) do
			diagnostic_signs[vim.diagnostic.severity[type]] = icon
		end
		vim.diagnostic.config({ signs = { text = diagnostic_signs } })
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		local servers = {
			-- clangd = {},
			gopls = {
				settings = {
					gopls = {
						gofumpt = true,
						codelenses = {
							gc_details = false,
							generate = true,
							regenerate_cgo = true,
							run_govulncheck = true,
							test = true,
							tidy = true,
							upgrade_dependency = true,
							vendor = true,
						},
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
						-- analyses = {
						-- 	fieldalignment = true,
						-- 	nilness = true,
						-- 	unusedparams = true,
						-- 	unusedwrite = true,
						-- 	useany = true,
						-- },
						usePlaceholders = true,
						completeUnimported = true,
						staticcheck = true,
						directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
						semanticTokens = true,
					},
				},
			},
			pyright = {},
			rust_analyzer = {},
			-- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
			--
			-- Some languages (like typescript) have entire language plugins that can be useful:
			--    https://github.com/pmizio/typescript-tools.nvim
			--
			-- But for many setups, the LSP (`ts_ls`) will work just fine
			-- ts_ls = {},
			--

			lua_ls = {
				-- cmd = { ... },
				-- filetypes = { ... },
				-- capabilities = {},
				settings = {
					Lua = {
						workspace = {
							checkThirdParty = false,
						},
						codeLens = {
							enable = true,
						},
						completion = {
							callSnippet = "Replace",
						},
						doc = {
							privateName = { "^_" },
						},
						hint = {
							enable = true,
							setType = false,
							paramType = true,
							paramName = "Disable",
							semicolon = "Disable",
							arrayIndex = "Disable",
						},
					},
				},
			},
		}
		for server, server_opts in pairs(servers) do
			server_opts.capabilities = capabilities
			require("lspconfig")[server].setup(server_opts)
		end
	end,
}
