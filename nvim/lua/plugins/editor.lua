local M = {
	"rafamadriz/friendly-snippets",
	event = "InsertEnter",
	keys = { { ":" }, { "/" } },
	dependencies = {
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"windwp/nvim-autopairs",
		{ "tzachar/cmp-tabnine", build = "./install.s" },
	},
}
M.config = function()
	local icons = {
		Namespace = "",
		Text = " ",
		Method = " ",
		Function = " ",
		Constructor = " ",
		Field = "ﰠ ",
		Variable = " ",
		Class = "ﴯ ",
		Interface = " ",
		Module = " ",
		Property = "ﰠ ",
		Unit = "塞 ",
		Value = " ",
		Enum = " ",
		Keyword = " ",
		Snippet = " ",
		Color = " ",
		File = " ",
		Reference = " ",
		Folder = " ",
		EnumMember = " ",
		Constant = " ",
		Struct = "פּ ",
		Event = " ",
		Operator = " ",
		TypeParameter = " ",
		Table = "",
		Object = " ",
		Tag = "",
		Array = "[]",
		Boolean = " ",
		Number = " ",
		Null = "ﳠ",
		String = " ",
		Calendar = "",
		Watch = " ",
		Package = "",
	}
	-- autopairs
	local autopairs = require("nvim-autopairs")
	local cmp = require("cmp")
	autopairs.setup({
		fast_wrap = {},
		disable_filetype = { "TelescopePrompt", "vim" },
	})
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

	-- cmp
	require("luasnip.loaders.from_vscode").lazy_load()

	local options = {
		-- preselect = cmp.PreselectMode.None,
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		formatting = {
			format = function(_, vim_item)
				vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
				return vim_item
			end,
		},
		mapping = {
			["<C-p>"] = cmp.mapping.select_prev_item(),
			["<C-n>"] = cmp.mapping.select_next_item(),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.close(),
			["<CR>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			}),
			["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
			["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<Tab>"] = cmp.mapping(function(fallback)
				if luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				else
					fallback()
				end
			end, { "i", "s" }),

			["<S-Tab>"] = cmp.mapping(function(fallback)
				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		},
		sources = {
			{ name = "luasnip" },
			{ name = "nvim_lsp" },
			{ name = "buffer" },
			{ name = "nvim_lua" },
			{ name = "path" },
			{ name = "cmp_tabnine" },
		},
	}
	cmp.setup(options)

	cmp.setup.cmdline("/", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})
end
return M
