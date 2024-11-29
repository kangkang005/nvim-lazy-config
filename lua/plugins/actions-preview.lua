-- A neovim plugin that preview code with LSP code actions applied.
return {
  "aznhe21/actions-preview.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set({ "v", "n" }, "gz", require("actions-preview").code_actions, { desc = "action preview" })
  end,
}
