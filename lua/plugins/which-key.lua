-- WhichKey helps you remember your Neovim keymaps, by showing available keybindings in a popup as you type.
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = function()
    require("which-key").add({
      { "<leader>h", group = "quick motion(hop)", desc = "quick motion(hop)", icon = "⌨️" },
      { "<leader>k", group = "cmake", desc = "cmake", icon = "⌨️" },
      { "<leader>m", group = "markdown", desc = "markdown", icon = "⌨️" },
      { "<leader>t", group = "other", desc = "toggleterm, table-mode", icon = "⌨️" },
      { "<leader>a", group = "avante(AI)", desc = "avante(AI)", icon = "🤖" },
      { "gA", group = "algin", desc = "algin", icon = "⌨️" },
      { "gp", group = "goto code", desc = "goto code", icon = "⌨️" },
    })
  end,
}
