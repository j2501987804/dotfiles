return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim",
        "nvimtools/none-ls.nvim",
        {
            "mfussenegger/nvim-lint",
            opts = {
                linters_by_ft = {
                    go = { "golangcilint" },
                },
            },
            config = function(_, opts)
                require("lint").linters_by_ft = opts.linters_by_ft
            end,
        },
    },
    config = function()
        dofile(vim.g.base46_cache .. "lsp")
        require("nvchad.lsp").diagnostic_config()
        require("mason").setup()

        local ensure_installed = {
            "lua-language-server",
            -- go
            'gopls', "gomodifytags", 'goimports', 'gofumpt',"golangci-lint",
        }
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
            for _, tool in ipairs(ensure_installed) do
                local p = mr.get_package(tool)
                if not p:is_installed() then
                    p:install()
                end
            end
        end)

        vim.lsp.enable({ 'lua_ls', "gopls" })

        local nls = require("null-ls")

        nls.setup({
            sources = {
                -- nls.builtins.code_actions.impl,
                nls.builtins.code_actions.gomodifytags,

                nls.builtins.formatting.goimports,
                nls.builtins.formatting.gofumpt,
            },
        })
    end,
}
