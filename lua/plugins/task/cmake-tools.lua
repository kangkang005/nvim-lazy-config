-- command:
--    CMAKERun
--    CMAKEBuild
--    CMAKEInstall
return {
  "Civitasv/cmake-tools.nvim",
  keys = {
    {
      "<leader>kb",
      function()
        require("cmake-tools").build({ -- opts
          nargs = "*",
          -- bang = true,   -- clean build directory before build
          bang = false, -- not clean build directory before build
          desc = "CMake build",
        })
      end,
      desc = "Cma[k]e [b]uild",
    },
    {
      "<leader>kr",
      function()
        require("cmake-tools").run({ -- opts
          nargs = "*",
          desc = "CMake run",
        })
      end,
      desc = "Cma[k]e [r]un",
    },
  },
  config = function()
    require("cmake-tools").setup({
      cmake_command = "cmake",
      cmake_build_directory = "build",
      cmake_generate_options = { "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1" },
      cmake_build_options = {},
      cmake_console_size = 10,
      cmake_console_position = "belowright",
    })
  end,
}
