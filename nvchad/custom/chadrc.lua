---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "chadracula",
	theme_toggle = { "chadracula", "one_light" },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require("custom.mappings")

return M
