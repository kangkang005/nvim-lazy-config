-- Vim Markdown runtime files
return {
  "tpope/vim-markdown",
  config = function()
    -- tpope/vim-markdown
    vim.g.markdown_syntax_conceal = 0
    vim.g.markdown_fenced_languages = {
      "html",
      "python",
      "bash=sh",
      "json",
      "java",
      "js=javascript",
      "sql",
      "yaml",
      "xml",
      "swift",
      "javascript",
      "lua",
      "perl",
      "cmake",
      "cpp",
      "c",
    }
  end,
} --> syntax highlighting and filetype plugins for Markdown
