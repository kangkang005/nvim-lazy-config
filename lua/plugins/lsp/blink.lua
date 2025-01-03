-- blink.cmp is a completion plugin with support for LSPs and external sources that updates on every keystroke with minimal overhead (0.5-4ms async).
-- web: https://cmp.saghen.dev/
return {
  "saghen/blink.cmp",
  version = not vim.g.lazyvim_blink_main and "*",
  build = vim.g.lazyvim_blink_main and "cargo build --release",
  opts_extend = {
    "sources.completion.enabled_providers",
    "sources.compat",
    "sources.default",
  },
  dependencies = {
    "rafamadriz/friendly-snippets",
    -- add blink.compat to dependencies
    {
      "saghen/blink.compat",
      optional = true, -- make optional so it's only enabled if any extras need it
      opts = {},
      version = not vim.g.lazyvim_blink_main and "*",
    },
    "milanglacier/minuet-ai.nvim",
    "mikavilpas/blink-ripgrep.nvim",
    "Kaiser-Yang/blink-cmp-dictionary",
  },
  event = "InsertEnter",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    snippets = {
      expand = function(snippet, _)
        return LazyVim.cmp.expand(snippet)
      end,
    },
    appearance = {
      -- sets the fallback highlight groups to nvim-cmp's highlight groups
      -- useful for when your theme doesn't support blink.cmp
      -- will be removed in a future release, assuming themes add support
      use_nvim_cmp_as_default = false,
      -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- adjusts spacing to ensure icons are aligned
      nerd_font_variant = "mono",
    },
    completion = {
      accept = {
        -- Create an undo point when accepting a completion item
        create_undo_point = true,
        -- experimental auto-brackets support
        auto_brackets = {
          enabled = true,
        },
      },
      -- Controls how the completion items are rendered on the popup window
      menu = {
        min_width = 15,
        max_height = 20,
        draw = {
          -- Use treesitter to highlight the label text for the given list of sources
          treesitter = { "lsp" },
          -- Definitions for possible components to render. Each defines:
          --   ellipsis: whether to add an ellipsis when truncating the text
          --   width: control the min, max and fill behavior of the component
          --   text function: will be called for each item
          --   highlight function: will be called only when the line appears on screen
          components = {
            source_name = {
              width = { max = 30 },
              text = function(ctx)
                return "[" .. ctx.source_name .. "]"
              end,
              highlight = "BlinkCmpSource",
            },
          },
          columns = {
            { "kind_icon" },
            { "label", "label_description", gap = 1 },
            -- { "kind_icon", "kind" },
            { "kind" },
            { "source_name" },
          },
        },
      },
      documentation = {
        -- Controls whether the documentation window will automatically show when selecting a completion item
        auto_show = true,
        -- Delay before showing the documentation window
        auto_show_delay_ms = 200,
        window = {
          min_width = 10,
          max_width = 80,
          max_height = 20,
          border = "padded",
          winblend = 0,
          winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
          -- Note that the gutter will be disabled when border ~= 'none'
          scrollbar = true,
          -- Which directions to show the documentation window,
          -- for each of the possible menu window directions,
          -- falling back to the next direction when there's not enough space
          direction_priority = {
            menu_north = { "e", "w", "n", "s" },
            menu_south = { "e", "w", "s", "n" },
          },
        },
      },
      -- Displays a preview of the selected item on the current line
      ghost_text = {
        enabled = vim.g.ai_cmp,
      },
    },

    -- experimental signature help support
    signature = {
      enabled = true,
      trigger = {
        blocked_trigger_characters = {},
        blocked_retrigger_characters = {},
        -- When true, will show the signature help window when the cursor comes after a trigger character when entering insert mode
        show_on_insert_on_trigger_character = true,
      },
      window = {
        min_width = 1,
        max_width = 100,
        max_height = 10,
        border = "padded",
        winblend = 0,
        winhighlight = "Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder",
        scrollbar = false, -- Note that the gutter will be disabled when border ~= 'none'
        -- Which directions to show the window,
        -- falling back to the next direction when there's not enough space,
        -- or another window is in the way
        direction_priority = { "n", "s" },
        -- Disable if you run into performance issues
        treesitter_highlighting = true,
      },
    },

    sources = {
      -- You may also define providers per filetype
      per_filetype = {
        -- lua = { 'lsp', 'path' },
      },
      -- adding any nvim-cmp sources here will enable them
      -- with blink.compat
      compat = {},
      -- Static list of providers to enable, or a function to dynamically enable/disable providers based on the context
      -- Enable minuet for autocomplete
      default = { "dictionary", "lsp", "path", "snippets", "buffer", "minuet" },
      -- By default, we choose providers for the cmdline based on the current cmdtype
      -- You may disable cmdline completions by replacing this with an empty table
      cmdline = function()
        local type = vim.fn.getcmdtype()
        -- Search forward and backward
        if type == "/" or type == "?" then
          return { "buffer" }
        end
        -- Commands
        if type == ":" or type == "@" then
          return { "cmdline" }
        end
        return {}
      end,
      providers = {
        minuet = {
          name = "minuet",
          module = "minuet.blink",
          score_offset = 8, -- Gives minuet higher priority among suggestions
        },
        dictionary = {
          module = "blink-cmp-dictionary",
          name = "Dict",
          --- @module 'blink-cmp-dictionary'
          --- @type blink-cmp-dictionary.Options
          opts = {
            get_command = {
              "rg", -- make sure this command is available in your system
              "--color=never",
              "--no-line-number",
              "--no-messages",
              "--no-filename",
              "--ignore-case",
              "--",
              "${prefix}", -- this will be replaced by the result of 'get_prefix' function
              vim.fn.expand("~/.config/nvim/dict/en_dict.txt"), -- where you dictionary is
            },
            documentation = {
              enable = true, -- enable documentation to show the definition of the word
              get_command = {
                "wn", -- make sure this command is available in your system
                "${word}", -- this will be replaced by the word to search
                "-over",
              },
            },
          },
        },
      },
    },

    keymap = {
      -- set to 'none' to disable the 'default' preset
      -- preset have 'default', 'super-tab' and 'enter'
      preset = "super-tab",
      ["<C-y>"] = { "select_and_accept" },
      -- Enable minuet for autocomplete
      ["<A-y>"] = {
        function(cmp)
          cmp.show({ providers = { "minuet" } })
        end,
      },
      -- set a separate keymap for cmdline
      cmdline = {
        preset = "super-tab",
      },
    },
  },
  ---@param opts blink.cmp.Config | { sources: { compat: string[] } }
  config = function(_, opts)
    -- setup compat sources
    local enabled = opts.sources.default
    for _, source in ipairs(opts.sources.compat or {}) do
      opts.sources.providers[source] = vim.tbl_deep_extend(
        "force",
        { name = source, module = "blink.compat.source" },
        opts.sources.providers[source] or {}
      )
      if type(enabled) == "table" and not vim.tbl_contains(enabled, source) then
        table.insert(enabled, source)
      end
    end

    -- add ai_accept to <Tab> key
    if not opts.keymap["<Tab>"] then
      if opts.keymap.preset == "super-tab" then -- super-tab
        opts.keymap["<Tab>"] = {
          require("blink.cmp.keymap.presets")["super-tab"]["<Tab>"][1],
          LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
          "fallback",
        }
      else -- other presets
        opts.keymap["<Tab>"] = {
          LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
          "fallback",
        }
      end
    end

    -- Unset custom prop to pass blink.cmp validation
    opts.sources.compat = nil

    -- check if we need to override symbol kinds
    for _, provider in pairs(opts.sources.providers or {}) do
      ---@cast provider blink.cmp.SourceProviderConfig|{kind?:string}
      if provider.kind then
        local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
        local kind_idx = #CompletionItemKind + 1

        CompletionItemKind[kind_idx] = provider.kind
        ---@diagnostic disable-next-line: no-unknown
        CompletionItemKind[provider.kind] = kind_idx

        ---@type fun(ctx: blink.cmp.Context, items: blink.cmp.CompletionItem[]): blink.cmp.CompletionItem[]
        local transform_items = provider.transform_items
        ---@param ctx blink.cmp.Context
        ---@param items blink.cmp.CompletionItem[]
        provider.transform_items = function(ctx, items)
          items = transform_items and transform_items(ctx, items) or items
          for _, item in ipairs(items) do
            item.kind = kind_idx or item.kind
          end
          return items
        end

        -- Unset custom prop to pass blink.cmp validation
        provider.kind = nil
      end
    end

    require("blink.cmp").setup(opts)
  end,
}
