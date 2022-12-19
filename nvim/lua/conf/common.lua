require 'nvim-lastplace'.setup {
	lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
	lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
	lastplace_open_folds = true
}

require ("Comment").setup {}

require("indent_blankline").setup({
	show_current_context = true,
})
