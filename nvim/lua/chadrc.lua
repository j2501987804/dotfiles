local options = {

  base46 = {
    theme = "chadracula", -- default theme
    hl_add = {},
    hl_override = {},
    integrations = {},
    changed_themes = {},
    transparency = true,
    theme_toggle = { "chadracula", "everforest_light" },
  },

  ui = {
    cmp = {
      icons_left = false, -- only for non-atom styles!
      style = "default", -- default/flat_light/flat_dark/atom/atom_colored
      abbr_maxwidth = 60,
      -- for tailwind, css lsp etc
      format_colors = { lsp = true, icon = "󱓻" },
    },

    telescope = { style = "borderless" }, -- borderless / bordered

    statusline = {
      enabled = true,
      theme = "default", -- default/vscode/vscode_colored/minimal
      -- default/round/block/arrow separators work only for default statusline theme
      -- round and block will work for minimal theme only
      separator_style = "default",
      order = nil,
      modules = nil,
    },

    -- lazyload it when there are 1+ buffers
    tabufline = {
      enabled = true,
      lazyload = true,
      treeOffsetFt = "NvimTree",
      order = { "treeOffset", "buffers", "tabs", "btns" },
      modules = nil,
      bufwidth = 21,
    },
  },

  nvdash = {
    load_on_startup = false,
    header = {
      "                      ",
      "  ▄▄         ▄ ▄▄▄▄▄▄▄",
      "▄▀███▄     ▄██ █████▀ ",
      "██▄▀███▄   ███        ",
      "███  ▀███▄ ███        ",
      "███    ▀██ ███        ",
      "███      ▀ ███        ",
      "▀██ █████▄▀█▀▄██████▄ ",
      "  ▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀",
      "                      ",
      "  Powered By  eovim ",
      "                      ",
    },

    buttons = {
      { txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
      { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
      { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
      { txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
      { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },

      { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

      {
        txt = function()
          local stats = require("lazy").stats()
          local ms = math.floor(stats.startuptime) .. " ms"
          return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
        end,
        hl = "NvDashFooter",
        no_gap = true,
        content = "fit",
      },

      { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
    },
  },

  term = false,

  lsp = { signature = false },

  cheatsheet = {
    theme = "grid", -- simple/grid
    excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
  },

--   mason = { pkgs = {    
--     'gofumpt',
--     'goimports',
--     'gopls',
--     'lua-language-server',
-- }, skip = {} },

  colorify = {
    enabled = true,
    mode = "virtual", -- fg, bg, virtual
    virt_text = "󱓻 ",
    highlight = { hex = true, lspvars = true },
  },
}

local status, chadrc = pcall(require, "chadrc")
return vim.tbl_deep_extend("force", options, status and chadrc or {})