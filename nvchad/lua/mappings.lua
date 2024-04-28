require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "v", "n", "x" }, "H", "^")
map({ "v", "n", "x" }, "L", "$")

map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("n", "<leader>cf", function()
    require("conform").format { lsp_fallback = true }
end, { desc = "Format Files" })

local del = vim.keymap.del
del("n", "<leader>fm")
