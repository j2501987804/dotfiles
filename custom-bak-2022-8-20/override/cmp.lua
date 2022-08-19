local cmp = require "cmp"
-- `/` cmdline setup.
cmp.setup.cmdline("/", {
   mapping = cmp.mapping.preset.cmdline(),
   sources = {
      { name = "buffer" },
   },
})

-- `:` cmdline setup.
cmp.setup.cmdline(":", {
   mapping = cmp.mapping.preset.cmdline(),
   sources = cmp.config.sources({
      { name = "path" },
   }, {
      { name = "cmdline" },
   }),
})

return {
   mapping = {
      ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
      ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
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
