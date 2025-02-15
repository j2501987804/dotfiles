-- stylua: ignore
return {
    dap = {  "delve" },
    mason = {
        "lua-language-server","stylua",
        "gomodifytags", "impl", "goimports", "gofumpt","gopls",
    },
	nonels = function()
		local nls = require("null-ls")
		return {
			nls.builtins.code_actions.gomodifytags,
			nls.builtins.code_actions.impl,
			nls.builtins.formatting.goimports,
			nls.builtins.formatting.gofumpt,
		}
	end,
    treesitter = {
        "bash", "c", "diff", "html", "javascript", "jsdoc",
        "json", "jsonc", "lua", "luadoc", "luap", "markdown",
        "markdown_inline", "printf", "python", "query", "regex", "toml",
        "tsx", "typescript", "vim", "vimdoc", "xml", "yaml",
        "go", "gomod", "gowork", "gosum",
    },
	lsp_server = {
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
	},
}
