-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
local autocmd = vim.api.nvim_create_autocmd
-- 自动保存
autocmd({ "BufLeave" }, {
    pattern = "*.go,*.py,*.lua,*rust",
    callback = function()
        local bufner = vim.api.nvim_get_current_buf()
        if vim.api.nvim_buf_get_option(bufner, "modified") then
            -- vim.lsp.buf.format(nil, bufner)
            -- vim.fn.execute("silent! wall")
            vim.cmd("silent! wall")
        end
    end,
})

-- 换行时不自动注释
autocmd({ "BufEnter", "BufNewFile" }, {
    callback = function()
        vim.bo.formatoptions = vim.bo.formatoptions:gsub("[cro]", "")
    end,
})
