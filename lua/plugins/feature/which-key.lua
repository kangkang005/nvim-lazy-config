-- WhichKey helps you remember your Neovim keymaps, by showing available keybindings in a popup as you type.
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = function()
    require("which-key").add({
      { "<leader>h", group = "quick motion(hop)", desc = "quick motion(hop)", icon = "⌨️" },
      { "<leader>k", group = "cmake", desc = "cmake", icon = "⌨️" },
      { "<leader>m", group = "markdown", desc = "markdown", icon = "⌨️" },
      { "<leader>t", group = "other", desc = "toggleterm, table-mode", icon = "⌨️" },
      { "<leader>a", group = "avante(AI)", desc = "avante(AI)", icon = "🤖" },
      { "<leader>o", group = "overseer/orgmode", desc = "overseer/orgmode", icon = "🐎" },
      { "gA", group = "algin", desc = "algin", icon = "⌨️" },
      { "gp", group = "goto code", desc = "goto code", icon = "⌨️" },

      {
        mode = { "n", "v" },
        { "<leader>C", group = "ChatGPT", icon = "🤖" },
        { "<leader>Cc", "<cmd>ChatGPT<cr>", desc = "ChatGPT" },
        { "<leader>Cg", "<cmd>ChatGPTRun grammar_correction<cr>", desc = "Grammar Correction" },
        { "<leader>Ct", "<cmd>ChatGPTRun translate<cr>", desc = "Translate" },
        { "<leader>Ck", "<cmd>ChatGPTRun keywords<cr>", desc = "Keywords" },
        { "<leader>Cd", "<cmd>ChatGPTRun docstring<cr>", desc = "Docstring" },
        { "<leader>Ca", "<cmd>ChatGPTRun add_tests<cr>", desc = "Add Tests" },
        { "<leader>Co", "<cmd>ChatGPTRun opetimize_code<cr>", desc = "Optimize Code" },
        { "<leader>Cs", "<cmd>ChatGPTRun summarize<cr>", desc = "Summarize" },
        { "<leader>Cf", "<cmd>ChatGPTRun fix_bugs<cr>", desc = "Fix Bugs" },
        { "<leader>Cx", "<cmd>ChatGPTRun explain_code<cr>", desc = "Explain Code" },
        { "<leader>Cr", "<cmd>ChatGPTRun roxygen_edit<cr>", desc = "Roxygen Edit" },
        { "<leader>Cl", "<cmd>ChatGPTRun code_readability_analysis<cr>", desc = "Code Readability Analysis" },
      },
    })
  end,
}
