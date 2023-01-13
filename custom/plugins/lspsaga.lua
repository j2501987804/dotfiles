local saga = require("lspsaga")

saga.setup({
	symbol_in_winbar = {
		in_custom = true,
	},
	code_action_lightbulb = {
		enable = true,
	},

	code_action = {
		num_shortcut = true,
		keys = {
			quit = "q",
			exec = "<CR>",
		},
	},

	finder = {
		edit = { "o", "<CR>" },
		vsplit = "s",
		split = "i",
		tabe = "t",
		quit = { "q", "<ESC>" },
	},

	ui = {
		theme = "round",
		border = "solid",
		winblend = 0,
		expand = "",
		collaspe = "",
		preview = " ",
		code_action = "💡",
		diagnostic = "🐞",
		incoming = " ",
		outgoing = " ",
		colors = {
			--float window normal bakcground color
			normal_bg = "#1d1536",
			--title background color
			title_bg = "#afd700",
			red = "#e95678",
			magenta = "#b33076",
			orange = "#FF8700",
			yellow = "#f7bb3b",
			green = "#afd700",
			cyan = "#36d0e0",
			blue = "#61afef",
			purple = "#CBA6F7",
			white = "#d1d4cf",
			black = "#1c1c19",
		},
		kind = {},
	},
})

vim.wo.winbar = require("lspsaga.symbolwinbar"):get_winbar()
