return {
  {
    "numToStr/Comment.nvim",
    keys = {
      { "<leader>/", ':lua require("Comment.api").toggle.linewise.current()<CR>', desc = "comment" },
      { "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", mode = "v" },
    },
  },
}
