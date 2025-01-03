-- Neovim plugin for tagging important files
return {
  "cbochs/grapple.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", lazy = true },
  },
  opts = {
    scope = "git", -- also try out "git_branch"
  },
  event = { "BufReadPost", "BufNewFile" },
  cmd = "Grapple",
  keys = {
    { "<C-x>m", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
    { "<C-x>M", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple open tags window" },
    { "<C-x>n", "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
    { "<C-x>p", "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },
  },
  config = function()
    require("grapple").setup({
      ---Grapple save location
      ---@type string
      save_path = vim.fs.joinpath(vim.fn.stdpath("data"), "grapple"),

      ---Default scope to use when managing Grapple tags
      ---For more information, please see the Scopes section
      ---@type string
      scope = "git",

      ---User-defined scopes or overrides
      ---For more information about scopes, please see the Scope API section
      ---@type grapple.scope_definition[]
      scopes = {},

      ---Show icons next to tags or scopes in Grapple windows
      ---Requires "nvim-tree/nvim-web-devicons"
      ---@type boolean
      icons = true,

      ---Highlight the current selection in Grapple windows
      ---Also, indicates when a tag path does not exist
      ---@type boolean
      status = true,

      ---Position a tag's name should be shown in Grapple windows
      ---@type "start" | "end"
      name_pos = "end",

      ---How a tag's path should be rendered in Grapple windows
      ---  "relative": show tag path relative to the scope's resolved path
      ---  "basename": show tag path basename and directory hint
      ---@type "basename" | "relative"
      style = "relative",

      ---A string of characters used for quick selecting in Grapple windows
      ---An empty string or false will disable quick select
      ---@type string | boolean
      quick_select = "123456789",

      ---Default command to use when selecting a tag
      ---@type fun(path: string)
      command = vim.cmd.edit,

      ---Time limit used for pruning unused scope (IDs). If a scope's save file
      ---modified time exceeds this limit, then it will be deleted when a prune
      ---requested. Can be an integer (in seconds) or a string time limit
      ---(e.g. "30d" or "2h" or "15m")
      ---@type integer | string
      prune = "30d",

      ---User-defined tags title function for Grapple windows
      ---By default, uses the resolved scope's ID
      ---@type fun(scope: grapple.resolved_scope): string?
      tag_title = nil,

      ---User-defined scopes title function for Grapple windows
      ---By default, renders "Grapple Scopes"
      ---@type fun(): string?
      scope_title = nil,

      ---User-defined loaded scopes title function for Grapple windows
      ---By default, renders "Grapple Loaded Scopes"
      ---@type fun(): string?
      loaded_title = nil,

      ---Additional window options for Grapple windows
      ---See :h nvim_open_win
      ---@type grapple.vim.win_opts
      win_opts = {
        -- Can be fractional
        width = 80,
        height = 12,
        row = 0.5,
        col = 0.5,

        relative = "editor",
        border = "single",
        focusable = false,
        style = "minimal",

        title = "Grapple", -- fallback title for Grapple windows
        title_pos = "center",
        title_padding = " ", -- custom: adds padding around window title

        -- footer = "", -- disable footer
        footer_pos = "center",
      },
    })
  end,
}
