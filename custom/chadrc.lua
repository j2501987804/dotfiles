local M = {}

-- local themes = require("custom.overidden_themes")
-- local highlights = require("custom.highlights")
M.ui = {
	-- changed_themes = themes,
	-- hl_override = highlights.override,
	-- hl_add = highlights.add,
	theme_toggle = { "catppuccin", "one_light" },
	theme = "catppuccin",
}

M.plugins = require("custom.plugins")

-- check core.mappings for table structure
M.mappings = require("custom.mappings")

return M
