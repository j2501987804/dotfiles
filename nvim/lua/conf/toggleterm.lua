local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

local function on_open(term)
	vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<esc>", [[<C-\><C-n>]], { noremap = true, silent = true, })
	vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-h>", [[<C-\><C-n><C-W>h]], { noremap = true, silent = true })
	vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-j>", [[<C-\><C-n><C-W>j]], { noremap = true, silent = true })
	vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-k>", [[<C-\><C-n><C-W>k]], { noremap = true, silent = true })
	vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-l>", [[<C-\><C-n><C-W>l]], { noremap = true, silent = true })
end

toggleterm.setup({
	size = 20,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
	on_open = on_open,
})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	hidden = true,
	direction = "float",
	on_open = function()
		-- code
	end,
})


local vim, api = vim, vim.api
local M = {
	go = { "go run ", "go test " },
	lua = { "lua " },
}

local function run_command()
	local cmd
	local file_type = vim.fn.expand("%:e")
	local file_name = vim.fn.expand("%:p")
	if vim.bo.filetype == "dashboard" then
		return
	end
	if vim.bo.filetype == "NvimTree" then
		return
	end
	if file_type == "go" then
		if file_name:match("_test") then
			cmd = M[file_type][2]
		else
			cmd = M[file_type][1]
		end
	else
		cmd = M[file_type][1]
	end
	return cmd .. file_name
end

local function format()
	local rsfile = io.popen("git status -s")
	if rsfile == nil then
		return
	end
	for value in rsfile:lines() do
		local path = string.sub(value, 3, -1)
		-- local ext = vim.fn.fnamemodify(vim.fn.expand(path), ':e')
		local bufnr = vim.fn.bufadd(path)
		vim.lsp.buf.format({ buffer = bufnr })
	end
end

function _LAZYGIT_TOGGLE()
	format()
	lazygit:toggle()
end

function _QUICK_RUN()
	vim.lsp.buf.formatting()
	Terminal:new({
		cmd = run_command(),
		hidden = true,
		close_on_exit = false,
		on_open = on_open,
	}):toggle()
end
