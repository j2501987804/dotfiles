-- Gps
-- local gps = require "nvim-gps"

-- LuaLine
local present1, lualine = pcall(require, "lualine")
if not present1 then
	return false
end

-- Colors
local colors = {
	white = "#abb2bf",
	darker_black = "#1b1f27",
	black = "#1e222a", --  nvim bg
	black2 = "#252931",
	one_bg = "#282c34", -- real bg of onedark
	one_bg2 = "#353b45",
	one_bg3 = "#30343c",
	grey = "#42464e",
	grey_fg = "#565c64",
	grey_fg2 = "#6f737b",
	light_grey = "#6f737b",
	red = "#d47d85",
	baby_pink = "#DE8C92",
	pink = "#ff75a0",
	line = "#2a2e36", -- for lines like vertsplit
	green = "#A3BE8C",
	vibrant_green = "#7eca9c",
	nord_blue = "#81A1C1",
	blue = "#61afef",
	yellow = "#e7c787",
	sun = "#EBCB8B",
	purple = "#b4bbc8",
	dark_purple = "#c882e7",
	teal = "#519ABA",
	orange = "#fca2aa",
	cyan = "#a3b8ef",
	statusline_bg = "#22262e",
	lightbg = "#2d3139",
	lightbg2 = "#262a32",
	pmenu_bg = "#A3BE8C",
	folder_bg = "#61afef",
}

-- Config
local config = {
	options = {
		component_separators = "",
		section_separators = "",
		disabled_filetypes = { "NvimTree", "Outline", "AerialTree", "Dap" },
		theme = {
			normal = { c = { fg = colors.fg, bg = colors.statusline_bg } },
			inactive = {
				a = { bg = colors.black, fg = colors.white, gui = "italic" },
				b = { bg = colors.black, fg = colors.white },
				c = { bg = colors.black, fg = colors.white },
				x = { bg = colors.black, fg = colors.white },
				y = { bg = colors.black, fg = colors.white },
				z = { bg = colors.black, fg = colors.white },
			},
		},
	},
	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_v = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

-- Mode
ins_left {
	"mode",
	fmt = function(str)
		return str
	end,
	color = { fg = colors.grey, bg = colors.blue }, -- Sets highlighting of component
	icon = ""
}

-- Sep
ins_left {
	function()
		return ""
	end,
	color = { fg = colors.blue, bg = colors.grey }, -- Sets highlighting of component
	padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
	function()
		return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
	end,
	icon = "",
	-- cond = conditions.buffer_not_empty,
	color = { fg = colors.white, bg = colors.grey },
}

-- Sep
ins_left {
	function()
		return ""
	end,
	color = { fg = colors.grey, bg = colors.statusline_bg }, -- Sets highlighting of component
	padding = { left = 0, right = 1 }, -- We don't need space before this
}

-- Nvim Gps
-- ins_left {
--     gps.get_location,
--     cond = gps.is_available,
-- }

-- lsp name
ins_left {
	function()
		local msg = ""
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	icon = "",
	color = { fg = colors.white, gui = "bold" },
}

-- diagnostics
ins_left {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = { error = " ", warn = " ", info = " " },
	diagnostics_color = {
		error = { fg = colors.red },
		warn = { fg = colors.yellow },
		info = { fg = colors.cyan },
	},
	colored = true,
	update_in_insert = false,
}

-- Right

-- diff
ins_right {
	"diff",
	symbols = { added = "  ", modified = "柳", removed = " " },
	diff_color = {
		added = { bg = colors.statusline_bg, fg = colors.green },
		modified = { bg = colors.statusline_bg, fg = colors.yellow },
		removed = { bg = colors.statusline_bg, fg = colors.red },
	},
	cond = function()
		return vim.fn.winwidth(0) > 80
	end,
}

-- Sep
ins_right {
	function()
		return ""
	end,
	color = { fg = colors.blue, bg = colors.statusline_bg }, -- Sets highlighting of component
	padding = { left = 0, right = 0 }, -- We don't need space before this
}

-- git icon
ins_right {
	function()
		return " "
	end,
	color = { fg = colors.statusline_bg, bg = colors.blue }, -- Sets highlighting of component
	padding = { left = 0, right = 0 }, -- We don't need space before this
}

-- git branch
ins_right {
	"branch",
	icons_enabled = false,
	color = { fg = colors.blue, bg = colors.grey },
}

-- Sep
ins_right {
	function()
		return ""
	end,
	color = { fg = colors.red, bg = colors.grey }, -- Sets highlighting of component
	padding = { left = 0, right = 0 }, -- We don't need space before this
}

-- Icon
ins_right {
	function()
		return " "
	end,
	color = { fg = colors.statusline_bg, bg = colors.red }, -- Sets highlighting of component
	padding = { left = 0, right = 0 }, -- We don't need space before this
}

ins_right {
	"progress",
	color = { fg = colors.red, bg = colors.grey }, -- Sets highlighting of component
}
lualine.setup(config)
