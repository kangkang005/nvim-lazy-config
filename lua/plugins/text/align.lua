return {
  "Vonr/align.nvim",
  branch = "v2",
  lazy = true,
  init = function()
    -- Aligns to 1 character
    vim.keymap.set("x", "gAa", function()
      require("align").align_to_char({
        length = 1,
      })
    end, { noremap = true, silent = true, desc = "Algins to 1 char" })

    -- Aligns to 2 characters with previews
    vim.keymap.set("x", "gAd", function()
      require("align").align_to_char({
        preview = true,
        length = 2,
      })
    end, { noremap = true, silent = true, desc = "Algins to 2 chars" })

    -- Aligns to a string with previews
    vim.keymap.set("x", "gAw", function()
      require("align").align_to_string({
        preview = true,
        regex = false,
      })
    end, { noremap = true, silent = true, desc = "Algins to a string" })

    -- Aligns to a Vim regex with previews
    vim.keymap.set("x", "gAr", function()
      require("align").align_to_string({
        preview = true,
        regex = true,
      })
    end, { noremap = true, silent = true, desc = "Algins to a regex" })

    -- Example gawip to align a paragraph to a string with previews
    vim.keymap.set("n", "gAw", function()
      local a = require("align")
      a.operator(a.align_to_string, {
        regex = false,
        preview = true,
      })
    end, { noremap = true, silent = true, desc = "Algins a paragraph to string" })

    -- Example gaaip to align a paragraph to 1 character
    vim.keymap.set("n", "gAa", function()
      local a = require("align")
      a.operator(a.align_to_char)
    end, { noremap = true, silent = true, desc = "Algins a paragraph to 1 char" })
  end,
}
