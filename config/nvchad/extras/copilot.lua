return {
	{
		"zbirenbaum/copilot.lua",
		event = { "InsertEnter" },
		cmd = { "Copilot" },
		opts = {
			suggestion = {
				auto_trigger = true,
                auto_refreshtrue = true,
			},
		},
	},
}

-- {
-- 	"zbirenbaum/copilot.lua",
-- 	cmd = "Copilot",
-- 	build = ":Copilot auth",
-- 	opts = {
-- 		suggestion = { enabled = false },
-- 		panel = { enabled = false },
-- 	},
-- },
--
-- {
-- 	"zbirenbaum/copilot-cmp",
-- 	event = "InsertEnter",
-- 	dependencies = "copilot.lua",
-- 	config = function(_, opts)
-- 		local copilot_cmp = require("copilot_cmp")
-- 		copilot_cmp.setup(opts)
-- 	end,
-- },
--
