-- A neovim plugin for generating .gitignore files.
return {
  "wintermute-cell/gitignore.nvim",
  config = function()
    require("gitignore")
  end,
}
