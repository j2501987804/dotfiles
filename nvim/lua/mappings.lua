local map = vim.keymap.set

map("i", "jk", "<esc>", { desc = "Escape", remap = true })
map("i", "<c-j>", "<Down>", { desc = "Down", remap = true })
map("i", "<c-k>", "<Up>", { desc = "Up", remap = true })
map("i", "<c-h>", "<Left>", { desc = "Left", remap = true })
map("i", "<c-l>", "<Right>", { desc = "Right", remap = true })
-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- buffers
map("n", "<S-tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
-- map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
-- map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
-- map("n", "<leader>bd", function()
--     Snacks.bufdelete()
-- end, { desc = "Delete Buffer" })
-- map("n", "<leader>bo", function()
--     Snacks.bufdelete.other()
-- end, { desc = "Delete Other Buffers" })
-- map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })
-- map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
-- better indenting
map("x", "<", "<gv")
map("x", ">", ">gv")

-- commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- Clear search and stop snippet on escape
map({ "i", "n", "s" }, "<esc>", function()
    vim.cmd("noh")
    return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })


vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local bufnr = args.buf
        map('n', 'K', vim.lsp.buf.hover, { desc = 'LSP: Hover docs', buffer = bufnr })
        -- vim.keymap.set("i", "<C-s>", function()
        --     vim.lsp.buf.signature_help()
        -- end, { desc = "Signature Help (Snacks)" })
        map('n', '<leader>cr', vim.lsp.buf.rename, { desc = 'LSP: Rename symbol', buffer = bufnr })
        map({ "n", "x" }, '<leader>ca',  vim.lsp.buf.code_action, { desc = 'LSP: Code action', buffer = bufnr })
        map('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Diagnostic: float', buffer = bufnr })
        -- map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Diagnostic: Prev', buffer = bufnr })
        -- map('n', ']d', vim.diagnostic.goto_next, { desc = 'Diagnostic: Next', buffer = bufnr })
        -- map("n", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })
        -- map("n", "gD", function() Snacks.picker.lsp_declarations() end, { desc = "Goto Declaration" })
        -- map("n", "gr", function() Snacks.picker.lsp_references() end, { desc = "References", nowait = true })
        -- map("n", "gI", function() Snacks.picker.lsp_implementations() end, { desc = "Implementation" })
        -- map("n", "gy", function() Snacks.picker.lsp_type_definitions() end, { desc = "Type Definition" })
        -- map("n", "<leader>cs", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
        -- map("n", "<leader>cS", function() Snacks.picker.lsp_workspace_symbols() end, { desc = "Workspace Symbols" })
    end,
})
