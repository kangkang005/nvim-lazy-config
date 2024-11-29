-- A blazing fast and easy to configure Neovim statusline written in Lua.
--  lualine.nvim requires Neovim >= 0.7.
--
--  Lualine has sections as shown below.
-- +-------------------------------------------------+
-- | A | B | C                             X | Y | Z |
-- +-------------------------------------------------+

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = {
    options = {
      theme = "auto",
      -- component_separators = { left = "", right = "" },
      -- section_separators = { left = "", right = "" },
      component_separators = { left = "|", right = "|" },
      section_separators = { left = " ", right = "" },
    },
    extensions = { "nvim-tree", "toggleterm" },
    sections = {
      lualine_b = { "branch", "diff", "diagnostics" },
      -- lualine_c = {
      --   {
      --     "filename",
      --     file_status = true,
      --     path = 4,
      --   },
      -- },
      lualine_x = {
        {
          require("interestingwords").lualine_get,
          cond = require("interestingwords").lualine_has,
          color = { fg = "#ff9e64" },
        },
        "filesize",
        {
          "fileformat",
          symbols = {
            unix = "", -- e712
            dos = "", -- e70f
            mac = "", -- e711
          },
        },
        "encoding",
        "filetype",
      },
    },
  },
}
