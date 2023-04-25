local M = {
	"nvim-tree/nvim-tree.lua",
	keys = { { "<leader>e", "<cmd> NvimTreeToggle <CR>", desc = "toggle nvimtree" } },
}

M.config = function()
	local nvimtree = require("nvim-tree")
	local tree_cb = require("nvim-tree.config").nvim_tree_callback
	local options = {
		update_focused_file = {
			enable = true,
			update_cwd = false,
		}
	}

	nvimtree.setup(options)
end
return M
