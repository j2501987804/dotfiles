-- autosave
vim.api.nvim_create_autocmd({ "BufLeave" }, {
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    if vim.api.nvim_buf_get_option(bufnr, "modified") then
      vim.fn.execute("silent! write")
    end
  end,
})
