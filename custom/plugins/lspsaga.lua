local keymap = vim.keymap.set
local saga = require('lspsaga')

saga.init_lsp_saga({
	border_style = "rounded",
	symbol_in_winbar = {
		in_custom = true
	},
	code_action_lightbulb = {
		enable = false,
	},

})

-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Code action
-- keymap({"n","v"}, "<leader>la", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Rename
-- keymap("n", "<leader>lr", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Peek Definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

-- Show line diagnostics
-- keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- Show cursor diagnostic
-- keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

-- Diagnsotic jump can use `<c-o>` to jump back
keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- Only jump to error
-- keymap("n", "[E", function()
--   require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
-- end, { silent = true })
-- keymap("n", "]E", function()
--   require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
-- end, { silent = true })

-- Outline
-- keymap("n","<leader>3", "<cmd>LSoutlineToggle<CR>",{ silent = true })

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- Float terminal
-- keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
-- if you want pass somc cli command into terminal you can do like this
-- open lazygit in lspsaga float terminal
-- keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm lazygit<CR>", { silent = true })
-- close floaterm
-- keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })

-- Example:
local function get_file_name(include_path)
	local file_name = require('lspsaga.symbolwinbar').get_file_name()
	if vim.fn.bufname '%' == '' then return '' end
	if include_path == false then return file_name end
	-- Else if include path: ./lsp/saga.lua -> lsp > saga.lua
	local sep = vim.loop.os_uname().sysname == 'Windows' and '\\' or '/'
	local path_list = vim.split(string.gsub(vim.fn.expand '%:~:.:h', '%%', ''), sep)
	local file_path = ''
	for _, cur in ipairs(path_list) do
		file_path = (cur == '.' or cur == '~') and '' or
			file_path .. cur .. ' ' .. '%#LspSagaWinbarSep#>%*' .. ' %*'
	end
	return file_path .. file_name
end

local function config_winbar_or_statusline()
	local exclude = {
		['terminal'] = true,
		['toggleterm'] = true,
		['prompt'] = true,
		['NvimTree'] = true,
		['help'] = true,
	} -- Ignore float windows and exclude filetype
	if vim.api.nvim_win_get_config(0).zindex or exclude[vim.bo.filetype] then
		vim.wo.winbar = ''
	else
		local ok, lspsaga = pcall(require, 'lspsaga.symbolwinbar')
		local sym
		if ok then sym = lspsaga.get_symbol_node() end
		local win_val = ''
		win_val = get_file_name(true) -- set to true to include path
		if sym ~= nil then win_val = win_val .. sym end
		vim.wo.winbar = win_val
		-- if work in statusline
		-- vim.wo.stl = win_val
	end
end

local events = { 'BufEnter', 'BufWinEnter', 'CursorMoved' }

vim.api.nvim_create_autocmd(events, {
	pattern = '*',
	callback = function() config_winbar_or_statusline() end,
})

vim.api.nvim_create_autocmd('User', {
	pattern = 'LspsagaUpdateSymbol',
	callback = function() config_winbar_or_statusline() end,
})
