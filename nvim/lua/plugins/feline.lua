return {
	{
		"feline-nvim/feline.nvim",
		config = function()
			local line_ok, feline = pcall(require, "feline")
			if not line_ok then
				return
			end

			local c = {
				vim_mode = {
					provider = {
						name = "vi_mode",
						opts = {
							show_mode_name = true,
							-- padding = "center", -- Uncomment for extra padding.
						},
					},
					left_sep = "block",
					right_sep = "block",
				},
				gitBranch = {
					provider = "git_branch",
					left_sep = "block",
					right_sep = "block",
				},
				gitDiffAdded = {
					provider = "git_diff_added",
					left_sep = "block",
					right_sep = "block",
				},
				gitDiffRemoved = {
					provider = "git_diff_removed",
					left_sep = "block",
					right_sep = "block",
				},
				gitDiffChanged = {
					provider = "git_diff_changed",
					left_sep = "block",
					right_sep = "right_filled",
				},
				separator = {
					provider = "",
				},
				diagnostic_errors = {
					provider = "diagnostic_errors",
				},
				diagnostic_warnings = {
					provider = "diagnostic_warnings",
				},
				diagnostic_hints = {
					provider = "diagnostic_hints",
				},
				diagnostic_info = {
					provider = "diagnostic_info",
				},
				lsp_client_names = {
					provider = "lsp_client_names",
					left_sep = "left_filled",
					right_sep = "block",
				},
				file_type = {
					provider = {
						name = "file_type",
						opts = {
							filetype_icon = true,
							case = "titlecase",
						},
					},
					left_sep = "block",
					right_sep = "block",
				},
				file_encoding = {
					provider = "file_encoding",
					left_sep = "block",
					right_sep = "block",
				},
				position = {
					provider = "position",
					left_sep = "block",
					right_sep = "block",
				},
				line_percentage = {
					provider = "line_percentage",
					left_sep = "block",
					right_sep = "block",
				},
				scroll_bar = {
					provider = "scroll_bar",
				},
			}

			local left = {
				c.vim_mode,
				c.gitBranch,
				c.gitDiffAdded,
				c.gitDiffRemoved,
				c.gitDiffChanged,
				c.separator,
			}

			local middle = {}

			local right = {
				c.diagnostic_errors,
				c.diagnostic_warnings,
				c.diagnostic_info,
				c.diagnostic_hints,

				c.file_type,
				c.file_encoding,
				c.position,
				c.line_percentage,
				c.scroll_bar,
			}

			local components = {
				active = {
					left,
					middle,
					right,
				},
				inactive = {
					left,
					middle,
					right,
				},
			}

			feline.setup({
				components = components,
			})
		end,
	},

	{ "vimpostor/vim-tpipeline", dependencies = "feline-nvim/feline.nvim" },
}
