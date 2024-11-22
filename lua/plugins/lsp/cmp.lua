-- configuration reference: https://www.cnblogs.com/lavateinn/p/17904263.html
local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- set cmp popup height in local
vim.opt_local.pumheight = 20

--cmp source table
CMP_SOURCES = {
  lspkind = { name = "symbol", menu = "[Symbol]" },
  luasnip = { name = "luasnip", menu = "[Luasnip]" },
  vsnip = { name = "vsnip", menu = "[Vsnip]" },
  nvim_lsp = {
    name = "nvim_lsp",
    menu = "[LSP]",
    entry_filter = function(entry)
      return require("cmp").lsp.CompletionItemKind.Snippet ~= entry:get_kind()
    end,
  },
  path = { name = "path", menu = "[Path]" },
  buffer = { name = "buffer", menu = "[Buf]" },
  cmdline = { name = "cmdline", menu = "[Cmd]" },
}

return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",

      -- vsnip
      "hrsh7th/cmp-vsnip",
      -- cmp_luasnip
      "saadparwaiz1/cmp_luasnip",

      -- lspkind icon
      "onsails/lspkind-nvim",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      cmp.setup({
        -- window setup, include height, width...
        window = {
          completion = cmp.config.window.bordered({
            border = "none",
            winhighlight = "Normal:Normal,FloatBorder:Normal",
            -- winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
          }),
          documentation = cmp.config.window.bordered({
            border = "none",
          }),
        },

        -- snippet settting in luasnip/vsnip
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            -- for luasnip, NOTE: luasnip default disable, need to run 'LazyExtras' enable luasnip
            luasnip.lsp_expand(args.body)

            -- for vsnip
            -- vim.fn["vsnip#anonymous"](args.body)
          end,
        },

        -- menu format: Set order from left to right popup item
        --  abbr: abbreviation of "word"; when not empty it is used in the menu instead of "word"
        --  kind: single letter indicating the type of completion
        --  menu: extra text for the popup menu, displayed after "word" or "abbr"
        formatting = {
          fields = { "abbr", "kind", "menu" },
          expandable_indicator = false,
          -- format = function(entry, vim_item)
          --   vim_item.menu = CMP_SOURCES[entry.source.name].menu
          --   return vim_item
          -- end,

          -- source: https://zhuanlan.zhihu.com/p/445331508
          format = lspkind.cmp_format({
            with_text = true, -- do not show text alongside icons
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            before = function(entry, vim_item)
              -- vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
              vim_item.menu = CMP_SOURCES[entry.source.name].menu
              return vim_item
            end,
          }),
        },

        -- global setting and can be overwritten in sources
        experimental = { ghost_text = false },
        sources = {
          CMP_SOURCES.nvim_lsp,
          CMP_SOURCES.buffer,
          CMP_SOURCES.path,
          CMP_SOURCES.luasnip, -- for luasnip
          -- CMP_SOURCES.vsnip, -- for vsnip
        },

        mapping = cmp.mapping.preset.insert({
          -- Use <C-b/f> to scroll the docs
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),

          -- close cmp popup
          ["<C-e>"] = cmp.mapping.close(),

          -- ["<C-n>"] = require("cmp_rime").mapping.select_next_item,
          -- ["<C-p>"] = require("cmp_rime").mapping.select_prev_item,

          -- toggle to hide/show cmp popup
          ["<C-Space>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.abort()
            else
              cmp.complete()
            end
          end),

          -- A super tab
          -- source:
          --  https://martinlwx.github.io/zh-cn/config-neovim-from-scratch/
          --  https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
          ["<Tab>"] = cmp.mapping(function(fallback)
            -- Hint: if the completion menu is visible select next one
            if cmp.visible() then
              cmp.select_next_item()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }), -- i - insert mode; s - select mode

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),

          -- key "enter" to select
          ["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
        }),
      })

      -- search mode
      for _, cmd_type in ipairs({ "/", "?" }) do
        cmp.setup.cmdline(cmd_type, {
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            CMP_SOURCES.buffer,
          },
        })
      end

      -- cmdline mode
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          -- sometimes path ban cmd
          vim.tbl_extend("force", CMP_SOURCES.path, { group_index = 1 }),
          vim.tbl_extend("force", CMP_SOURCES.cmdline, { group_index = 2 }),
        },
      })
    end,
  },
}
