return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "rebelot/kanagawa.nvim" },
  { "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
  { "rktjmp/lush.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  {
    "maxmx03/solarized.nvim",
    lazy = false,
    priority = 1000,
    ---@type solarized.config
    opts = {},
    config = function(_, opts)
      require("solarized").setup(opts)
      vim.o.termguicolors = true
      vim.o.background = "light"
      vim.cmd.colorscheme("solarized")
    end,
  },
}
