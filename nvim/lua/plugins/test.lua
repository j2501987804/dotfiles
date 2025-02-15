return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"fredrikaverpil/neotest-golang",
			"folke/trouble.nvim",
		},
		config = function()
			local neotest_golang_opts = {} -- Specify custom configuration
			local neotest = require("neotest")
			neotest.setup({
				adapters = {
					require("neotest-golang")(neotest_golang_opts), -- Registration
				},
				status = { virtual_text = true }, -- 在代码中显示测试状态
				output = { open_on_run = true }, -- 运行测试后自动打开输出面板
				quickfix = {
					open = function()
						require("trouble").open({ mode = "quickfix", focus = false })
					end,
				},
				consumers = {
					trouble = function(client)
						client.listeners.results = function(adapter_id, results, partial)
							if partial then
								return
							end
							local tree = assert(client:get_position(nil, { adapter = adapter_id }))

							local failed = 0
							for pos_id, result in pairs(results) do
								if result.status == "failed" and tree:get_key(pos_id) then
									failed = failed + 1
								end
							end
							vim.schedule(function()
								local trouble = require("trouble")
								if trouble.is_open() then
									trouble.refresh()
									if failed == 0 then
										trouble.close()
									end
								end
							end)
							return {}
						end
					end,
				},
			})

			local neotest_ns = vim.api.nvim_create_namespace("neotest")
			vim.diagnostic.config({
				virtual_text = {
					format = function(diagnostic)
						-- Replace newline and tab characters with space for more compact diagnostics
						local message =
							diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
						return message
					end,
				},
			}, neotest_ns)

			vim.keymap.set("n", "<leader>tr", function()
				neotest.run.run({})
			end, { desc = "Run nearest test" })

			vim.keymap.set("n", "<leader>tf", function()
				neotest.run.run(vim.fn.expand("%"))
			end, { desc = "Run current file tests" })

			vim.keymap.set("n", "<leader>ts", function()
				neotest.summary.toggle()
			end, { desc = "Toggle test summary" })

			vim.keymap.set("n", "<leader>to", function()
				neotest.output.open({ enter = true })
			end, { desc = "Open test output" })

			vim.keymap.set("n", "<leader>td", function()
				neotest.run.run({ strategy = "dap" }) -- 使用 DAP 调试测试
			end, { desc = "Debug test with DAP" })
		end,
	},
}
