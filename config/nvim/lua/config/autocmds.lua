-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- 禁止自动注释新行
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = "set formatoptions-=cro",
})

-- 自动保存
vim.api.nvim_create_autocmd("BufLeave", {
  pattern = "*",
  callback = function(args)
    -- 获取当前缓冲区信息
    local bufnr = args.buf
    local bufname = vim.api.nvim_buf_get_name(bufnr)
    -- 排除特殊缓冲区（无文件名/终端等）
    if
        vim.api.nvim_buf_get_option(bufnr, "modified")              -- 检查是否被修改
        and vim.api.nvim_buf_get_option(bufnr, "modifiable")        -- 检查可修改性
        and not vim.api.nvim_buf_get_option(bufnr, "readonly")      -- 检查只读状态
        and bufname ~= ""                                           -- 排除无名缓冲区
        and vim.api.nvim_buf_get_option(bufnr, "buftype") == ""     -- 排除特殊类型（终端等）
    then
      vim.cmd("silent! update")                                     -- 静默保存（仅在修改时写入）
    end
  end,
})

-- go文件自动插入包名
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.go",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

    -- 如果文件不为空，直接返回
    local non_empty = false
    for _, line in ipairs(lines) do
      if line:match("%S") then
        non_empty = true
        break
      end
    end
    if non_empty then return end

    -- 获取当前目录
    local dir = vim.fn.expand("%:p:h")

    -- 尝试找到已有包名
    local pkg_name = nil
    local go_files = vim.fn.globpath(dir, "*.go", false, true)     -- 获取所有 Go 文件
    for _, f in ipairs(go_files) do
      if f ~= vim.fn.expand("%:p") then                            -- 排除当前文件
        for line in io.lines(f) do
          local m = line:match("^%s*package%s+(%S+)")
          if m then
            pkg_name = m
            break
          end
        end
        if pkg_name then break end
      end
    end

    -- 如果没有找到现有包名，使用目录名
    if not pkg_name then
      pkg_name = vim.fn.fnamemodify(dir, ":t")
      if pkg_name == "cmd" or pkg_name == "main" then
        pkg_name = "main"
      end
    end

    -- 插入 package 行
    vim.api.nvim_buf_set_lines(buf, 0, 0, false, { "package " .. pkg_name })
    vim.api.nvim_win_set_cursor(0, { 2, 0 })
  end,
})
