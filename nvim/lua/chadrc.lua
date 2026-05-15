-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
local M = {}

M.base46 = {
	theme = "onedark",

	hl_override = {
		Comment = { italic = true,fg="#ffffff" },
		["@comment"] = { italic = true,fg="#ffffff" },
	},
}

M.ui = {
    -- cmp = {
    --   icons_left = false, -- only for non-atom styles!
    --   style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    --   abbr_maxwidth = 60,
    --   -- for tailwind, css lsp etc
    --   format_colors = { lsp = true, icon = "󱓻" },
    -- }
}

M.lsp = { signature = false }

return M