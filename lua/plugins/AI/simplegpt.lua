-- You need customized prompts for your tasks! 🤏SimpleGPT is a Vim plugin designed to provide a simple yet flexible way to customize your prompts to for your tasks.
return {
  "you-n-g/simplegpt.nvim",
  dependencies = {
    {
      "jackMort/ChatGPT.nvim", -- You should configure your ChatGPT make sure it works.
      event = "VeryLazy",
      config = true,
      dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "folke/trouble.nvim",
        "nvim-telescope/telescope.nvim",
      },
    },
    "you-n-g/jinja-engine.nvim",
    "ibhagwan/fzf-lua",
  },
  config = true,
}
