local ft_cmds = {
    python = "python3 " .. vim.fn.expand('%'),
    lua = "lua " .. vim.fn.expand('%'),
    go = "go run " .. vim.fn.expand('%'),
}

local function format()
	local rsfile = io.popen("git status -s")
	if rsfile == nil then
		return
	end
	for value in rsfile:lines() do
		local path = string.sub(value, 3, -1)
		local ext = vim.fn.fnamemodify(vim.fn.expand(path), ':e')
		if ext == "php" then
			return
		end
		local bufnr = vim.fn.bufadd(path)
		vim.lsp.buf.format({ buffer = bufnr })
	end
end

function _LAZYGIT_TOGGLE()
	format()
	require("nvterm.terminal").send("lazygit", "float")
end

function _QUICK_RUN()
	vim.lsp.buf.format{async=true}
	require("nvterm.terminal").send(ft_cmds[vim.bo.filetype], "float")
end
