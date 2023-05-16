vim.api.nvim_create_autocmd({ "BufLeave" }, {
  callback = function()
    local bufnr = math.floor(tonumber(vim.fn.expand("<afile>")) or 0)
    if vim.api.nvim_buf_get_option(bufnr, "modified") then
      vim.fn.execute("silent! write")
    end
  end,
})
