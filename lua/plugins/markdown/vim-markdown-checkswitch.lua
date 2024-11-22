-- configurable checkbox status switcher for Markdown list items.
-- command:
--  CheckSwitch
return {
  "tenxsoydev/vim-markdown-checkswitch",
  config = function()
    vim.g.md_checkswitch_style = "cycle"
  end,
}
