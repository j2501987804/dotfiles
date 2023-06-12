local M = {
    'neovim/nvim-lspconfig',
    dependencies = {
        { "williamboman/mason.nvim", opts = {} },
        'hrsh7th/cmp-nvim-lsp',
    },
    event = 'VeryLazy',
}

M.config = function()
    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local servers = {
        pyright = {},
        gopls = {},
        rust_analyzer = {},
        lua_ls = {
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
    }
    for server, conf in pairs(servers) do
        local opts = vim.tbl_extend("keep", { capabilities = capabilities }, conf)
        lspconfig[server].setup(opts)
    end

    -- Use LspAttach autocommand to only map the following keys
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
            -- Enable completion triggered by <c-x><c-o>
            vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

            local opts = { buffer = ev.buf }
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
            vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
            vim.keymap.set("n", "<space>ls", ":LspRestart<CR>", opts)
            vim.keymap.set("n", "<space>lf", function()
                vim.lsp.buf.format { async = true }
            end, opts)
        end,
    })

    vim.api.nvim_create_user_command("MasonInstallAll", function()
        vim.cmd "MasonInstall lua-language-server pyright gopls rust-analyzer"
    end, {})
end

return M
