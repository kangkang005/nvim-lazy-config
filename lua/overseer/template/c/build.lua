-- Compile C programs.
-- reference: https://github.com/MariaSolOs/dotfiles/blob/df81300685c8edccb3983f3ed8c2337a927dc7d5/.config/nvim/lua/overseer/template/c/compile.lua
return {
  name = "gcc: compile",
  builder = function()
    return {
      name = "gcc: compile",
      cmd = { "gcc" },
      args = {
        "-O",
        "-Wall",
        "-W",
        "-pedantic",
        vim.fn.expand("%:p"),
        "-o",
        vim.fn.expand("%:t:r"),
      },
    }
  end,
  condition = {
    filetype = { "c" },
  },
}
