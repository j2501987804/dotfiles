-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- disabled
map("n", "<leader>fn", "", {})
map("n", "<leader>ft", "", {})
map("n", "<leader>fT", "", {})

-- generate
map("n", "<tab>", ":bnext<CR>", { desc = "next buff" })
map("n", "<S-tab>", ":bprevious<CR>", { desc = "prev buff" })
map("n", "<leader>q", ":q!<CR>", { desc = "quit" })
map("n", "<leader>x", ":bdelete!<CR>", { desc = "delete buff" })

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "" })
map("n", "<C-j>", "<C-w>j", { desc = "" })
map("n", "<C-k>", "<C-w>k", { desc = "" })
map("n", "<C-l>", "<C-w>l", { desc = "" })
map({ "n", "v" }, "H", "^", { desc = "^" })
map({ "n", "v" }, "L", "$", { desc = "$" })

-- Resize with arrows
map("n", "<S-Up>", ":resize -2<CR>", { desc = "" })
map("n", "<S-Down>", ":resize +2<CR>", { desc = "" })
map("n", "<S-Left>", ":vertical resize -2<CR>", { desc = "" })
map("n", "<S-Right>", ":vertical resize +2<CR>", { desc = "" })

-- Clear highlights
map("n", "<ESC>", "<cmd>nohlsearch<CR>", { desc = "nohlsearch" })

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", { desc = "" })
map("v", ">", ">gv", { desc = "" })
map("i", "jk", "<ESC>", {})
