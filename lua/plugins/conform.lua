-- for clang_format, Mason install clang-format, which depends on python3-venv
-- for gersemi, Mason install gersemi, which depends on python3-venv
return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["c"] = { "clang_format" },
        ["cpp"] = { "clang_format" },
        ["c++"] = { "clang_format" },
        -- ["cmake"] = { "cmake_format" },
        ["cmake"] = { "gersemi" },

        ["python"] = { "autopep8" },
      },
      formatters = {
        --clang-format = {
        -- prepend_args = {"-style=google"},
        --},

        -- autopep8 = {
        --   prepend_args = { "--max-line-length", "158" },
        -- },

        -- cmakelang = {
        --   "-l",
        --   "error",
        -- },
      },
    },
  },
}
