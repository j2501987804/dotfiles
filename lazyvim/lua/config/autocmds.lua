-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local autocmd = vim.api.nvim_create_autocmd
-- 自动保存
autocmd({ "BufLeave" }, {
    pattern = "*.go,*.py,*.lua,*rust",
    callback = function()
        local bufner = vim.api.nvim_get_current_buf()
        if vim.api.nvim_buf_get_option(bufner, "modified") then
            -- vim.lsp.buf.format(nil, bufner)
            vim.fn.execute("silent! write")
            -- vim.cmd("silent! wall")
        end
    end,
})

-- 换行时不自动注释
autocmd({ "BufEnter", "BufNewFile" }, {
    callback = function()
        vim.bo.formatoptions = vim.bo.formatoptions:gsub("[cro]", "")
    end,
})

