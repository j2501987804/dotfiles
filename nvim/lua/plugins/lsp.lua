require("mason").setup()

local ensure_installed = {
    "lua-language-server",
    "gopls","goimports","gofumpt","gomodifytags",
}
local mr = require("mason-registry")
mr.refresh(function()
    for _, tool in ipairs(ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
            p:install()
        end
    end
end)

vim.lsp.enable({ 'lua_ls', 'gopls' })

local nls = require("null-ls")
nls.setup({
    sources = {
        -- nls.builtins.code_actions.impl,
        nls.builtins.code_actions.gomodifytags,

        nls.builtins.formatting.goimports,
        nls.builtins.formatting.gofumpt,
    },
})
