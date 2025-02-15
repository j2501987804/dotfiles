---@param config {type?:string, args?:string[]|fun():string[]?}
local function get_args(config)
	local args = type(config.args) == "function" and (config.args() or {}) or config.args or {} --[[@as string[] | string ]]
	local args_str = type(args) == "table" and table.concat(args, " ") or args --[[@as string]]

	config = vim.deepcopy(config)
	---@cast args string[]
	config.args = function()
		local new_args = vim.fn.expand(vim.fn.input("Run with args: ", args_str)) --[[@as string]]
		if config.type and config.type == "java" then
			---@diagnostic disable-next-line: return-type-mismatch
			return new_args
		end
		return require("dap.utils").splitstr(new_args)
	end
	return config
end

return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{
				"theHamsta/nvim-dap-virtual-text",
				opts = {},
			},
			"nvim-neotest/nvim-nio",
			"rcarriga/nvim-dap-ui",
			"mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",
		},

        -- stylua: ignore
        keys = {
            { "<leader>du", function() require("dapui").toggle({ }) end, desc = "显示ui" },
            { "<leader>de", function() require("dapui").eval() end, desc = "查看值", mode = {"n", "v"} },
            { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input(' Breakpoint Condition:')) end, desc = " 断点（条件）" },
            { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = " 断点" },
            { "<leader>dc", function() require("dap").continue() end, desc = "启动/下个断点" },
            { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "设置子命令" },
            { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "󰁕运行到指针" },
            { "<leader>dg", function() require("dap").goto_() end, desc = "󰁕运行到指针 (No Execute)" },
            { "<leader>di", function() require("dap").step_into() end, desc = "步入" },
            -- { "<leader>dj", function() require("dap").down() end, desc = "Down" },
            -- { "<leader>dk", function() require("dap").up() end, desc = "Up" },
            { "<leader>dl", function() require("dap").run_last() end, desc = "󰘁重启" },
            { "<leader>dO", function() require("dap").step_out() end, desc = "步出" },
            { "<leader>do", function() require("dap").step_over() end, desc = "步过" },
            { "<leader>dP", function() require("dap").pause() end, desc = "Pause" },
            { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
            { "<leader>ds", function() require("dap").session() end, desc = "Session" },
            { "<leader>dt", function() require("dap").terminate() end, desc = "终止" },
            -- { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets hover" },
        },

		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup({})
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open({})
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close({})
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close({})
			end
			require("mason-nvim-dap").setup({
				ensure_installed = nv.dap,
				handlers = {},
			})
			vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
			dap_icons = {
				Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
				Breakpoint = " ",
				BreakpointCondition = " ",
				BreakpointRejected = { " ", "DiagnosticError" },
				LogPoint = ".>",
			}

			for name, sign in pairs(dap_icons) do
				sign = type(sign) == "table" and sign or { sign }
				vim.fn.sign_define(
					"Dap" .. name,
					{ text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
				)
			end

			-- setup dap config by VsCode launch.json file
			local vscode = require("dap.ext.vscode")
			local json = require("plenary.json")
			vscode.json_decode = function(str)
				return vim.json.decode(json.json_strip_comments(str))
			end
		end,
	},
}
