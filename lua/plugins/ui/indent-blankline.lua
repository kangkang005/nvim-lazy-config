-- Indent guides for Neovim
return {
  "lukas-reineke/indent-blankline.nvim",
  denpendencies = {
    "HiPhish/rainbow-delimiters.nvim",
  },

  config = function()
    local highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
    }
    local hooks = require("ibl.hooks")
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    end)

    local indent = {
      "IndentRed",
      "IndentYellow",
      "IndentBlue",
      "IndentOrange",
      "IndentGreen",
      "IndentViolet",
      "IndentCyan",
    }
    vim.api.nvim_set_hl(0, "IndentRed", { bg = "#E06C75" })
    vim.api.nvim_set_hl(0, "IndentYellow", { bg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "IndentBlue", { bg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "IndentOrange", { bg = "#D19A66" })
    vim.api.nvim_set_hl(0, "IndentGreen", { bg = "#98C379" })
    vim.api.nvim_set_hl(0, "IndentViolet", { bg = "#C678DD" })
    vim.api.nvim_set_hl(0, "IndentCyan", { bg = "#56B6C2" })

    vim.g.rainbow_delimiters = {
      highlight = highlight,
    }
    require("ibl").setup({
      debounce = 100,
      indent = {
        char = "▎",
        smart_indent_cap = true,
      },
      whitespace = {
        -- highlight = { "Whitespace", "NonText" },
        -- highlight = { "CursorColumn", "Whitespace" },
        -- highlight = highlight,
        highlight = indent,
        remove_blankline_trail = true,
      },
      scope = {
        enabled = true,
        -- In Kitty terminal for example you can do that with modify_font
        -- In Neovide, set vim.g.neovide_underline_stroke_scale = 10.0
        show_start = true,
        show_end = true,
        show_exact_scope = false,
        highlight = highlight,
        -- exclude = {
        --   language = { "lua" },
        -- },
      },
      exclude = {
        filetypes = {
          "Trouble",
          "alpha",
          "dashboard",
          "help",
          "lazy",
          "mason",
          "neo-tree",
          "notify",
          "snacks_dashboard",
          "snacks_notif",
          "snacks_terminal",
          "snacks_win",
          "toggleterm",
          "trouble",
        },
      },
    })

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end,
}
