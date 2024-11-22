-- printing/logging statements with text
return {
  "rareitems/printer.nvim",
  config = function()
    require("printer").setup({
      keymap = "<leader>p", -- Plugin doesn't have any keymaps by default
    })
  end,
}
