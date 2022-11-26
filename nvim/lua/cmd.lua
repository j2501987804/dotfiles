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

   augroup _git
	autocmd!
		autocmd FileType gitcommit setlocal wrap
		autocmd FileType gitcommit setlocal spell
	augroup end
]])

vim.cmd([[
	autocmd InsertLeave * :silent !fcitx5-remote -c
	autocmd BufCreate *  :silent !fcitx5-remote -c
	autocmd BufEnter *  :silent !fcitx5-remote -c
	autocmd BufLeave *  :silent !fcitx5-remote -c
]])

vim.cmd [[
	try
		colorscheme darkplus
	catch /^Vim\%((\a\+)\)\=:E185/
		colorscheme default
		set background=dark
	endtry
]]
