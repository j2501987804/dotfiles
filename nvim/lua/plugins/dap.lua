local M = {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
	},
	keys = {
		{ ";b", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "set breakpoint" },
		{ "<F5>", "<cmd>lua require'dap'.continue()<cr>", "" },
		{ "<F6>", "<cmd>lua require'dap'.step_into()<cr>", "" },
		{ "<F7>", "<cmd>lua require'dap'.step_over()<cr>", "" },
		{ "<F8>", "<cmd>lua require'dap'.step_out()<cr>", "" },
		{ "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", "" },
		{ "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", "reload" },
		{ ";u", "<cmd>lua require'dapui'.toggle()<cr>", "" },
		{ "<F9>", '<Cmd>lua require("dapui").eval()<CR>' },
		{ ";t", "<cmd>lua require'dap'.terminate()<cr>", "dap close" },
	},
}
M.config = function()
	local dap_status_ok, dap = pcall(require, "dap")
	if not dap_status_ok then
		return
	end

	local dap_ui_status_ok, dapui = pcall(require, "dapui")
	if not dap_ui_status_ok then
		return
	end

	require("nvim-dap-virtual-text").setup()
	dapui.setup({
		expand_lines = true,
		icons = { expanded = "", collapsed = "", circular = "" },
		mappings = {
			-- Use a table to apply multiple mappings
			expand = { "<CR>", "<2-LeftMouse>" },
			open = "o",
			remove = "d",
			edit = "e",
			repl = "r",
			toggle = "t",
		},
		layouts = {
			{
				elements = {
					{ id = "scopes", size = 0.33 },
					{ id = "breakpoints", size = 0.17 },
					{ id = "stacks", size = 0.25 },
					{ id = "watches", size = 0.25 },
				},
				size = 0.33,
				position = "right",
			},
			{
				elements = {
					{ id = "repl", size = 0.45 },
					{ id = "console", size = 0.55 },
				},
				size = 0.27,
				position = "bottom",
			},
		},
		floating = {
			max_height = 0.9,
			max_width = 0.5, -- Floats will be treated as percentage of your screen.
			border = vim.g.border_style, -- Border style. Can be 'single', 'double' or 'rounded'
			mappings = {
				close = { "q", "<Esc>" },
			},
		},
	})

	vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end

	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end

	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end

	-- go
	dap.adapters.go = {
		type = "executable",
		command = "node",
		args = { os.getenv("HOME") .. "/dev/golang/vscode-go/dist/debugAdapter.js" },
	}
	dap.configurations.go = {
		{
			type = "go",
			name = "Debug",
			request = "launch",
			showLog = false,
			program = "${file}",
			dlvToolPath = vim.fn.exepath("dlv"), -- Adjust to where delve is installed
		},
	}

	-- c cpp rust
	dap.adapters.codelldb = {
		type = "server",
		port = "${port}",
		executable = {
			-- CHANGE THIS to your path!
			command = "codelldb",
			args = { "--port", "${port}" },

			-- On windows you may have to uncomment this:
			-- detached = false,
		},
	}
	dap.configurations.cpp = {
		{
			name = "Launch file",
			type = "codelldb",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
		},
	}
	dap.configurations.c = dap.configurations.cpp
	dap.configurations.rust = dap.configurations.cpp
end
return M
