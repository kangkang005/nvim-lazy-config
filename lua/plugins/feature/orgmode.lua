-- Orgmode clone written in Lua for Neovim 0.9.4+
-- NOTE: please org parser with ':TSInstall org' if you use nvim-treesitter
-- Requirements:
--  Neovim 0.9.4 or later
--
-- Usage
--  Open agenda prompt: <Leader>oa
--  Open capture prompt: <Leader>oc
--  In any orgmode buffer press g? for help
return {
  "nvim-orgmode/orgmode",
  event = "VeryLazy",
  ft = { "org" },
  config = function() -- Setup orgmode
    require("orgmode").setup({
      org_agenda_files = "~/orgfiles/**/*",
      org_default_notes_file = "~/orgfiles/refile.org",
    })

    -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
    -- add ~org~ to ignore_install
    -- require('nvim-treesitter.configs').setup({
    --   ensure_installed = 'all',
    --   ignore_install = { 'org' },
    -- })
  end,
}
