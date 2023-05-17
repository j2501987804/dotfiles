vim.api.nvim_create_autocmd({ "BufLeave" }, {
  callback = function()
    vim.fn.execute("silent! write")
  end,
})

