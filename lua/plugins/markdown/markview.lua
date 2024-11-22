-- Markdown renderer
-- Neovim version >=0.10.1.
return {
  "OXY2DEV/markview.nvim",
  lazy = false, -- Recommended
  -- ft = "markdown" -- If you decide to lazy-load anyway

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {
      "<leader>mt",
      function()
        vim.cmd("Markview splitToggle")
      end,
      desc = "[M]arkdown Split [T]oggle (markview)",
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "markdown" },
      once = true,
      callback = vim.schedule_wrap(function()
        vim.cmd("Markview splitEnable")
      end),
    })
  end,
  config = {
    -- Initial plugin state,
    -- true = show preview
    -- false = don't show preview
    initial_state = false,
  },
}
