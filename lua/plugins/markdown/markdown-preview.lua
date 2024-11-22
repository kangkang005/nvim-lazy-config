-- Markdown renderer at browser
-- It only works on Vim >= 8.1 and Neovim
return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },

    keys = {
      {
        "<leader>mp",
        function()
          vim.cmd("MarkdownPreview")
        end,
        desc = "[M]arkdown [P]review (markdown-preview)",
      },
    },

    -- install without yarn or npm
    -- build = function()
    --   vim.fn["mkdp#util#install"]()
    --   vim.g.mkdp_theme = "light"
    -- end,

    -- install with yarn or npm, ensure yarn or npm installed at computer
    -- issue: https://github.com/iamcco/markdown-preview.nvim/issues/558
    -- install with npm if yarn build failed
    -- build = "cd app && yarn install",
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,

    -- config = function()
    --   vim.g.mkdp_auto_close = true
    --   vim.g.mkdp_open_to_the_world = false
    --   vim.g.mkdp_open_ip = "127.0.0.1"
    --   vim.g.mkdp_port = "8888"
    --   vim.g.mkdp_browser = ""
    --   vim.g.mkdp_echo_preview_url = true
    --   vim.g.mkdp_page_title = "${name}"
    -- end,
  },
}
