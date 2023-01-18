local M = {
	"nvim-tree/nvim-tree.lua",
	keys = { { "<leader>e", "<cmd> NvimTreeToggle <CR>", desc = "toggle nvimtree" } },
}

M.config = function()
	local nvimtree = require("nvim-tree")
	local tree_cb = require("nvim-tree.config").nvim_tree_callback
	local options = {
		disable_netrw = true,
		hijack_netrw = true,
		open_on_setup = false,
		ignore_ft_on_setup = { "alpha" },
		hijack_cursor = true,
		hijack_unnamed_buffer_when_opening = false,
		update_cwd = true,
		update_focused_file = {
			enable = true,
			update_cwd = false,
		},
		view = {
			adaptive_size = true,
			side = "left",
			width = 25,
			hide_root_folder = true,
			mappings = {
				custom_only = false,
				list = {
					{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
					{ key = "h", cb = tree_cb("close_node") },
					{ key = "v", cb = tree_cb("vsplit") },
				},
			},
		},
		git = {
			enable = true,
			ignore = true,
		},
		filesystem_watchers = {
			enable = true,
		},
		actions = {
			open_file = {
				resize_window = true,
			},
		},
		-- notify = {
		-- 	threshold = vim.log.levels.WARN,
		-- },
		renderer = {
			highlight_git = true,
			highlight_opened_files = "none",

			indent_markers = {
				enable = false,
			},

			icons = {
				show = {
					file = true,
					folder = true,
					folder_arrow = true,
					git = true,
				},

				glyphs = {
					default = "",
					symlink = "",
					folder = {
						default = "",
						empty = "",
						empty_open = "",
						open = "",
						symlink = "",
						symlink_open = "",
						arrow_open = "",
						arrow_closed = "",
					},
					git = {
						unstaged = "✗",
						staged = "✓",
						unmerged = "",
						renamed = "➜",
						untracked = "★",
						deleted = "",
						ignored = "◌",
					},
				},
			},
		},
	}

	nvimtree.setup(options)
end
return M
