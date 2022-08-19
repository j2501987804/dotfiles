return {
	lastplace = function()
		require("nvim-lastplace").setup({
			lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
			lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
			lastplace_open_folds = true,
		})
	end,

	undotree = function()
		vim.cmd([[
          if has("persistent_undo")
             let target_path = expand(undotree_dir)
             if !isdirectory(target_path)
                call mkdir(target_path, "p", 0700)
             endif
             let &undodir = target_path
             set undofile
        ]])
	end,
}
