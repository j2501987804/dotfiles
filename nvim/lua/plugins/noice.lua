return {
	"folke/noice.nvim",
	opts = {
		presets = {
			lsp_doc_border = true,
		},
		views = {
			notify = {
				merge = true,
			},
		},
		lsp = {
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			hover = {
				enabled = false,
			},
			signature = {
				enabled = false,
			},
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = false,
			},
		},
	},
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
}
