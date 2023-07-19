local M = {
    'neovim/nvim-lspconfig',
    dependencies = {
        { "williamboman/mason.nvim", opts = {} },
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/cmp-nvim-lsp',
    },
    event = { "BufReadPre", "BufNewFile" },
}

M.config = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local servers = {
        pylsp = {},
        gopls = {},
        rust_analyzer = {},
        lua_ls = {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' },
                    },
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                },
            },
        }
    }

    local mason_lspconfig = require 'mason-lspconfig'
    mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(servers),
    }

    mason_lspconfig.setup_handlers {
        function(server_name)
            local opts = vim.tbl_extend("keep", { capabilities = capabilities }, servers[server_name])
            require('lspconfig')[server_name].setup(opts)
        end,
    }

    -- Use LspAttach autocommand to only map the following keys
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
            -- Enable completion triggered by <c-x><c-o>
            vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

            local opts = { buffer = ev.buf }
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
            vim.keymap.set("n", "<space>lD", vim.lsp.buf.type_definition, opts)
            vim.keymap.set("n", "<space>ls", ":LspRestart<CR>", opts)
            vim.keymap.set("n", "<space>lf", function()
                vim.lsp.buf.format { async = true }
            end, opts)
        end,
    })
end

return M
