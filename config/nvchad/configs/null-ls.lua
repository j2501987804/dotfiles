local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local b = null_ls.builtins

local sources = {
	-- Lua
	b.formatting.stylua,

	-- go
	b.formatting.goimports_reviser,

	-- python
	b.formatting.black,
}

null_ls.setup({
	debug = true,
	sources = sources,
})
