-- autosave
vim.api.nvim_create_autocmd({ "BufLeave" }, {
    callback = function()
        local bufner = vim.api.nvim_get_current_buf()
        if vim.api.nvim_buf_get_option(bufner, "modified") then
            vim.fn.execute("silent! write")
            vim.cmd("silent! wall")
        end
    end,
})
