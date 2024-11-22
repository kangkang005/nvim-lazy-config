return {
  "L3MON4D3/LuaSnip",
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
    require("snippets.markdown")
    require("snippets.lua")
    require("snippets.general")
  end,
}
