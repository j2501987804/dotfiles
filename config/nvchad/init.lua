-- local autocmd = vim.api.nvim_create_autocmd
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- 自动保存
vim.api.nvim_create_autocmd({ "BufLeave" }, {
    callback = function()
        local bufner = vim.api.nvim_get_current_buf()
        if vim.api.nvim_buf_get_option(bufner, "modified") then
            vim.lsp.buf.format()
            vim.fn.execute "silent! write"
            vim.cmd "silent! wall"
        end
    end,
})

-- 自动重载文件
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    command = "checktime",
})

-- 窗口变小时,自动调整布局
vim.api.nvim_create_autocmd({ "VimResized" }, {
    callback = function()
        vim.cmd "tabdo wincmd ="
    end,
})

-- 记住最后一次光标浏览
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- 保存时目录不存在自动创建
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    callback = function(event)
        if event.match:match "^%w%w+://" then
            return
        end
        local file = vim.loop.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})
