local M = {}

function M.lastplace()
  require("nvim-lastplace").setup {
    lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
    lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
    lastplace_open_folds = true,
  }
end

function M.winbar()
  require('winbar').setup({
    enabled = true,
    show_file_path = true,
    show_symbols = true,

    colors = {
      path = '', -- You can customize colors like #c946fd
      file_name = '',
      symbols = '',
    },
  })
end

return M
