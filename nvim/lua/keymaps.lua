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
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bd", function()
    Snacks.bufdelete()
end, { desc = "Delete Buffer" })
map("n", "<leader>bo", function()
    Snacks.bufdelete.other()
end, { desc = "Delete Other Buffers" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
-- better indenting
map("x", "<", "<gv")
map("x", ">", ">gv")

-- commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "新建文件" })

-- Clear search and stop snippet on escape
map({ "i", "n", "s" }, "<esc>", function()
    vim.cmd("noh")
    return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })


vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local bufnr = args.buf
        map('n', 'K', vim.lsp.buf.hover, { desc = '文档说明', buffer = bufnr })
        -- vim.keymap.set("i", "<C-s>", function()
        --     vim.lsp.buf.signature_help()
        -- end, { desc = "Signature Help (Snacks)" })
        map('n', '<leader>cr', vim.lsp.buf.rename, { desc = '重命名', buffer = bufnr })
        map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '代码修复', buffer = bufnr })
        map('n', '<leader>cd', vim.diagnostic.open_float, { desc = '查看错误信息', buffer = bufnr })
        map('n', '[d', function()
            vim.diagnostic.jump({
                count = -1,
                on_jump = function()
                    vim.diagnostic.open_float()
                end,
            })
        end, { desc = '查看上一个错误', buffer = bufnr })
        map('n', ']d', function()
            vim.diagnostic.jump({
                count = 1,
                on_jump = function()
                    vim.diagnostic.open_float()
                end,
            })
        end, { desc = '查看下一个错误', buffer = bufnr })
        map("n", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "跳转定义" })
        map("n", "gD", function() Snacks.picker.lsp_declarations() end, { desc = "跳转声明" })
        map("n", "gr", function() Snacks.picker.lsp_references() end, { desc = "查看引用", nowait = true })
        map("n", "gI", function() Snacks.picker.lsp_implementations() end, { desc = "跳转实现" })
        map("n", "gy", function() Snacks.picker.lsp_type_definitions() end, { desc = "类型定义" })
        map("n", "<leader>cs", function() Snacks.picker.lsp_symbols() end, { desc = "代码结构（当前文件）" })
        map("n", "<leader>cS", function() Snacks.picker.lsp_workspace_symbols() end, { desc = "代码结构（工作区）" })

        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({
                    bufnr = bufnr,
                    timeout_ms = 3000,
                })
            end,
        })
    end,
})

-- 查找文件
map("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "查找文件" })
map("n", "<leader>fe", function() Snacks.picker.explorer() end, { desc = "文件管理器" })
map("n", "<leader>fp", function() Snacks.picker.projects() end, { desc = "查找项目" })
map("n", "<leader>fr", function() Snacks.picker.recent() end, { desc = "查找最近文件" })
map("n", "<leader>fg", function() Snacks.picker.git_files() end, { desc = "查找 Git 文件" })
map("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "查找buffer" })

-- 搜索
map("n", "<leader><leader>", function() Snacks.picker.resume() end, { desc = "恢复上次搜索" })
map("n", "<leader>sb", function() Snacks.picker.grep_buffers() end, { desc = "搜索buffer" })
map("n", "<leader>sg", function() Snacks.picker.grep() end, { desc = "搜索项目" })
map("n", "<leader>sw", function() Snacks.picker.grep_word() end, { desc = "搜索项目(以当前单词)" })
map("n", "<leader>sd", function() Snacks.picker.diagnostics() end, { desc = "搜索错误" })
map("n", "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, { desc = "搜索错误(当前buffer)" })
map("n", "<leader>st", function() Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end,
    { desc = "搜索待办事项" })
map({ "n", "x" }, "<leader>sr", function()
    local grug = require("grug-far")
    local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
    grug.open({
        transient = true,
        prefills = {
            filesFilter = ext and ext ~= "" and "*." .. ext or nil,
        },
    })
end, { desc = "搜索替换" })

-- git
map("n", "<leader>gd", function() Snacks.picker.git_diff() end, { desc = "Git Diff" })
map("n", "<leader>gf", function() Snacks.picker.git_log_file() end, { desc = "Git 历史记录" })
map("n", "<leader>gB", function() Snacks.picker.gitbrowse() end, { desc = "Git 浏览" })
map("n", "<leader>gg", function() Snacks.picker.lazygit() end, { desc = "lazygit" })

map({ "n", "t" }, "<c-/>", function() Snacks.terminal() end, { desc = "终端" })
map({ "n", "t" }, "<c-_>", function() Snacks.terminal() end, { desc = "终端" })
map({ "n", "t" }, "]]", function() Snacks.words.jump(vim.v.count1) end, { desc = "跳转下一个单词" })
map({ "n", "t" }, "[[", function() Snacks.words.jump(-vim.v.count1) end, { desc = "跳转上一个单词" })
map("n",
    "[q",
    function()
        if require("trouble").is_open() then
            require("trouble").prev({ skip_groups = true, jump = true })
        else
            local ok, err = pcall(vim.cmd.cprev)
            if not ok then
                vim.notify(err, vim.log.levels.ERROR)
            end
        end
    end,
    { desc = "上一个Quickfix" }
)
map("n",
    "]q",
    function()
        if require("trouble").is_open() then
            require("trouble").next({ skip_groups = true, jump = true })
        else
            local ok, err = pcall(vim.cmd.cnext)
            if not ok then
                vim.notify(err, vim.log.levels.ERROR)
            end
        end
    end,
    { desc = "下一个Quickfix" }
)

-- 光标跳转
map({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "" })
map({ "n", "x", "o" }, "s", function() require("flash").treesitter() end, { desc = "" })
map({ "n", "x", "o" }, "<cr>", function()
    require("flash").treesitter({
        actions = {
            ["<cr>"] = "next",
            ["<BS>"] = "prev"
        }
    })
end, { desc = "Treesitter Incremental Selection" })
