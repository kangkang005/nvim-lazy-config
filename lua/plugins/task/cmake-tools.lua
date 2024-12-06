-- CMake Tools for Neovim which is written in pure lua.
--
-- For Configure and Build: it uses:
--    mkdir Step1_build
--    cd Step1_build
--    cmake ../Step1  # Generate make system
--    cmake --build . # Build targets
--    ./Tutorial      # Run targets
--
-- With our plugin, you can use:
--    CmakeGenerate, # Correspond to cmake ../Step1
--    CmakeBuild, # Correspond to cmake --build .
--    CmakeRun, # Correspond to ./Tutorial
--    CmakeInstall, # Correspond to cmake --install .
return {
  "Civitasv/cmake-tools.nvim",

  config = function()
    vim.keymap.set("n", "<leader>kb", function()
      require("cmake-tools").build({ -- opts
        nargs = "*",
        -- bang = true,   -- clean build directory before build
        bang = false, -- not clean build directory before build
        desc = "CMake build",
      })
    end, { desc = "CMake [b]uild" })
    vim.keymap.set("n", "<leader>kr", function()
      require("cmake-tools").run({ -- opts
        nargs = "*",
        desc = "CMake run",
      })
    end, { desc = "CMake [r]un" })

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
