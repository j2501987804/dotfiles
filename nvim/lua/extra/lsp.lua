local M = {
    'neovim/nvim-lspconfig',
    dependencies = {
        "williamboman/mason.nvim",
        opts = {}
    },
}

M.config = function()
    require 'lspconfig'.pyright.setup {}
    require 'lspconfig'.lua_ls.setup {
        settings = {
            Lua = {
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { 'vim' },
                },
                workspace = { checkThirdParty = false },
                telemetry = { enable = false },
            },
        },
    }

    -- Use LspAttach autocommand to only map the following keys
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
            -- Enable completion triggered by <c-x><c-o>
            vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

            local opts = { buffer = ev.buf }
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
            vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
            vim.keymap.set("n", "<space>lf", function()
                vim.lsp.buf.format { async = true }
            end, opts)
        end,
    })

    vim.api.nvim_create_user_command("MasonInstallAll", function()
        vim.cmd "MasonInstall lua-language-server pyright"
    end, {})
end

return M
