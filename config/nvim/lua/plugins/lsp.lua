return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
        },
        config = function()
            -- lsp
            require("mason").setup()
            local mr = require("mason-registry")
            mr.refresh(function()
                -- stylua: ignore
                local ensure_installed = {
                    -- lua
                    "lua-language-server", "stylua",
                    -- sh
                    "bash-language-server", "shfmt", "cspell",
                    -- go
                    "gopls", "gomodifytags", "impl", "goimports", "gofumpt", "golangci-lint",
                }

                for _, tool in ipairs(ensure_installed) do
                    local p = mr.get_package(tool)
                    if not p:is_installed() then
                        p:install()
                    end
                end
            end)
            vim.lsp.enable({ 'gopls', 'lua_ls', "bashls" })
        end,
    },

    {
        'stevearc/conform.nvim',
        opts = {
            notify_on_error = false,
            format_on_save = function(bufnr)
                return {
                    timeout_ms = 500,
                    lsp_format = 'fallback',
                }
            end,
            formatters_by_ft = {
                go = { "goimports", "gofumpt" },
            },

        }
    },

    {
        "nvimtools/none-ls.nvim",
        config = function()
            local nls = require("null-ls")
            nls.setup({
                sources = {
                    nls.builtins.code_actions.gomodifytags,
                    nls.builtins.code_actions.impl,
                    -- nls.builtins.formatting.goimports,
                    -- nls.builtins.formatting.gofumpt,
                },
            })
        end
    },

    {
        "mfussenegger/nvim-lint",
        config = function()
            require('lint').linters_by_ft = {
                go = { "golangcilint" },
            }
            -- 自动检测go
            vim.api.nvim_create_autocmd("BufWritePost", {
                -- pattern = "*.go",
                callback = function()
                    local lint = require("lint")
                    lint.try_lint()
                    lint.try_lint("cspell")
                end,
            })
        end
    },
    { "j-hui/fidget.nvim", opts = {} }
}
