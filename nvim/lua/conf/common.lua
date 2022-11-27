return {
	autopairs = function()
		require("nvim-autopairs").setup({
			fast_wrap = {},
			disable_filetype = { "TelescopePrompt", "vim" },
		})

		local cmp_autopairs = require "nvim-autopairs.completion.cmp"

		require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,

	luasnip = function()
		require("luasnip").config.set_config({
			history = true,
			updateevents = "TextChanged,TextChangedI",
		})

		require("luasnip.loaders.from_vscode").lazy_load()
	end,

	signature = function()
		require("lsp_signature").setup({
			bind = true,
			doc_lines = 0,
			floating_window = true,
			fix_pos = true,
			hint_enable = true,
			hint_prefix = " ",
			hint_scheme = "String",
			hi_parameter = "Search",
			max_height = 22,
			max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
			handler_opts = {
				border = "rounded", -- double, single, shadow, none
			},
			zindex = 200, -- by default it will be on top of all floating windows, set to 50 send it to bottom
			padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc
		})
	end,

	lastplace = function()
		require 'nvim-lastplace'.setup {
			lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
			lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
			lastplace_open_folds = true
		}
	end,

	comment = function()
		local nvim_comment = require "Comment"
		nvim_comment.setup {}
	end,

	blankline = function()
		require("indent_blankline").setup({
			show_current_context = true,
		})
	end,

	leap = function()
		vim.keymap.set({ 'x', 'o', 'n' }, 'f', '<Plug>(leap-forward-to)')
		vim.keymap.set({ 'x', 'o', 'n' }, 'F', '<Plug>(leap-backward-to)')
	end
}
