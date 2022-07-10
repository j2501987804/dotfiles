local lspconfig = require "lspconfig"

local opts = { noremap = true, silent = true }
local function lsp_keymaps(bufnr)
    local nmap = function(key, value)
        vim.api.nvim_buf_set_keymap(bufnr, "n", key, value, opts)
    end
    nmap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
    nmap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
    nmap("K", "<cmd>Lspsaga hover_doc<CR>")
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "i", "<C-j>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    nmap("<leader>ln", "<cmd>Lspsaga rename<CR>")
    nmap("gr", "<cmd>TroubleToggle lsp_references<cr>")
    nmap("<leader>la", "<cmd>Lspsaga code_action<CR>")
    nmap("<leader>ld", "<cmd>lua vim.diagnostic.open_float()<CR>")
    nmap("[d", '<cmd>Lspsaga diagnostic_jump_prev<CR>')
    nmap("gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>')
    nmap("]d", '<cmd>Lspsaga diagnostic_jump_next<CR>')
    nmap("<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>")
    -- vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

local function on_attach(client, bufnr)
    lsp_keymaps(bufnr)
    require("illuminate").on_attach(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    },
}

local lsp_flags = {
    debounce_text_changes = 150,
}

-- lspservers with default config
local servers = require 'nvim-lsp-installer.servers'.get_installed_server_names()

for _, lsp in ipairs(servers) do
    local options = {
        on_attach = on_attach,
        capabilities = capabilities,
        lsp_flags = lsp_flags,
    }
    if lsp == "sumneko_lua" then
        options.settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.stdpath("config") .. "/lua"] = true,
                    },
                },
            },
        }
    end
    lspconfig[lsp].setup(options)
end
