return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  config = function()
    require("bufferline").setup({
      options = {
        -- "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        numbers = function(opts)
          return string.format("%s|%s", opts.id, opts.lower(opts.ordinal))
        end,
        -- 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs'
        sort_by = "insert_after_current",
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        -- stylua: ignore
        close_command = function(n) Snacks.bufdelete(n) end,
        -- stylua: ignore
        right_mouse_command = function(n) Snacks.bufdelete(n) end,
        diagnostics = "nvim_lsp",
        -- buffers(tabs) line will be hidden when more than 1 file
        always_show_bufferline = false,
        diagnostics_indicator = function(_, _, diag)
          local icons = LazyVim.config.icons.diagnostics
          local ret = (diag.error and icons.Error .. diag.error .. " " or "")
            .. (diag.warning and icons.Warn .. diag.warning or "")
          return vim.trim(ret)
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
        indicator = {
          icon = "▎",
          style = "underline",
        },
        ---@param opts bufferline.IconFetcherOpts
        get_element_icon = function(opts)
          return LazyVim.config.icons.ft[opts.filetype]
        end,
        custom_areas = {
          right = function()
            local result = {}
            local seve = vim.diagnostic.severity
            local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
            local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
            local info = #vim.diagnostic.get(0, { severity = seve.INFO })
            local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

            if error ~= 0 then
              table.insert(result, { text = "  " .. error, link = "DiagnosticError" })
            end

            if warning ~= 0 then
              table.insert(result, { text = "  " .. warning, link = "DiagnosticWarn" })
            end

            if hint ~= 0 then
              table.insert(result, { text = "  " .. hint, link = "DiagnosticHint" })
            end

            if info ~= 0 then
              table.insert(result, { text = "  " .. info, link = "DiagnosticInfo" })
            end
            return result
          end,
        },
      },
    })
  end,
}
