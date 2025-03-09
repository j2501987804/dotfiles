return {
  "folke/tokyonight.nvim",
  opts = {
    transparent = true,
    styles = {
      comments = { italic = true, bold = false },
      sidebars = "transparent",
      floats = "transparent",
    },
    on_highlights = function(hl, _)
      hl.Pmenu = { bg = "none" }
      hl.BlinkCmpMenu = { bg = "none", fg = "#42464e" }
      hl.BlinkCmpDoc = { bg = "none", fg = "#42464e" }
      hl.BlinkCmpMenuBorder = { bg = "none", fg = "#42464e" }
      hl.BlinkCmpDocBorder = { bg = "none", fg = "#42464e" }
      hl.BlinkCmpMenuSelection = { bg = "#82c092", fg = "black" }
    end,
  },
}
