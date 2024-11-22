-- use `:Mason` to install corresponding LSP
-- please install python3-venv if install LSP failed for reference
--
-- command:
--  Mason
--  MasonInstall
return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- for c/cpp
      "clangd",
      "clang-format",
      -- for cmake
      "gersemi",
    },
  },
}
