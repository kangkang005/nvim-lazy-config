-- Sidebar
-- issue: confict with mini.icon plugin
return {
  "sidebar-nvim/sidebar.nvim",
  enabled = false,

  keys = {
    { "gbo", "<CMD>SidebarNvimOpen<CR>", desc = "Sidebar Open" },
    { "gbc", "<CMD>SidebarNvimClose<CR>", desc = "Sidebar Close" },
    { "gbt", "<CMD>SidebarNvimToggle<CR>", desc = "Sidebar Toggle" },
  },

  config = function()
    require("sidebar-nvim").setup({
      disable_default_keybindings = 0,
      bindings = nil,

      -- open on startup
      open = false,
      side = "left",
      initial_width = 35,
      hide_statusline = false,
      update_interval = 1000,
      -- sections = { "files", "datetime", "git", "diagnostics", "symbols" },
      sections = { "files", "git", "diagnostics", "symbols" },
      section_separator = { "", "-----", "" },
      section_title_separator = { "" },
      containers = {
        attach_shell = "/bin/sh",
        show_all = true,
        interval = 5000,
      },
      datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
      todos = { ignored_paths = { "~" } },
    })
  end,
}
