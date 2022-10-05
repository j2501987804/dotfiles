vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

vim.cmd([[
   augroup checktime
   au!
       if !has("gui_running")
           "silent! necessary otherwise throws errors when using command
           "line window.
           autocmd BufEnter        * silent! checktime
           autocmd CursorHold      * silent! checktime
           autocmd CursorHoldI     * silent! checktime
           "these two _may_ slow things down. Remove if they do.
           autocmd CursorMoved     * silent! checktime
           autocmd CursorMovedI    * silent! checktime
       endif
   augroup END
]])

vim.cmd([[
	autocmd InsertLeave * :silent !fcitx5-remote -c
	autocmd BufCreate *  :silent !fcitx5-remote -c
	autocmd BufEnter *  :silent !fcitx5-remote -c
	autocmd BufLeave *  :silent !fcitx5-remote -c
]])

vim.cmd [[
	try
		colorscheme github_dimmed "darkplus
	catch /^Vim\%((\a\+)\)\=:E185/
		colorscheme default
		set background=dark
	endtry
]]
