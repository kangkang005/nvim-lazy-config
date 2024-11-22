-- Run C programs.
-- reference: https://github.com/MariaSolOs/dotfiles/blob/df81300685c8edccb3983f3ed8c2337a927dc7d5/.config/nvim/lua/overseer/template/c/compile.lua
return {
  name = "gcc: run",
  builder = function()
    return {
      name = "gcc: run",
      cmd = { vim.fn.expand("%:p:r") },
      components = {
        { "dependencies", task_names = { "gcc: compile" } },
        "default",
      },
    }
  end,
  condition = {
    filetype = { "c" },
  },
}
