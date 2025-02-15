return {

	{
		"nvim-pack/nvim-spectre",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = true,
        -- stylua: ignore
		keys = {
            {"<leader>sr", "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>",  desc = "查找当前单词" },
            {"<leader>sr", "<cmd>lua require('spectre').open_file_search()<CR>",  desc = "查找当前单词" ,mode="v"},
            {"<leader>sR", "<cmd>lua require('spectre').open_visual()<CR>",  desc = "全局查找" ,mode="v"},
            {"<leader>sR", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>",  desc = "全局查找" },
        },
	},
	{
		"folke/trouble.nvim",
		cmd = { "Trouble" },
		opts = {
			modes = {
				lsp = {
					win = { position = "right" },
				},
			},
		},
		keys = {
			{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "错误" },
			{ "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "错误（buff）" },
			{ "<leader>cs", "<cmd>Trouble symbols toggle<cr>", desc = "结构" },
			{ "<leader>cS", "<cmd>Trouble lsp toggle<cr>", desc = "LSP 所有关联" },
			{ "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
			{ "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
			{
				"[q",
				function()
					if require("trouble").is_open() then
						require("trouble").prev({ skip_groups = true, jump = true })
					else
						local ok, err = pcall(vim.cmd.cprev)
						if not ok then
							vim.notify(err, vim.log.levels.ERROR)
						end
					end
				end,
				desc = "Previous Trouble/Quickfix Item",
			},
			{
				"]q",
				function()
					if require("trouble").is_open() then
						require("trouble").next({ skip_groups = true, jump = true })
					else
						local ok, err = pcall(vim.cmd.cnext)
						if not ok then
							vim.notify(err, vim.log.levels.ERROR)
						end
					end
				end,
				desc = "Next Trouble/Quickfix Item",
			},
		},
	},
}
