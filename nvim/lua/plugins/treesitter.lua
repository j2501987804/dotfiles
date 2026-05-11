require('nvim-treesitter').install({
    'go', 'gomod', 'gosum', 'gowork', 'lua', 'vim', 'markdown',
    'rust',
    'javascript',
    'typescript',
    'tsx',
    'zig',
    'lua',
    'vim',
    'vimdoc',
    'regex',
})

-- 高亮
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = { 'go','lua' },
--   callback = function() vim.treesitter.start() end,
-- })