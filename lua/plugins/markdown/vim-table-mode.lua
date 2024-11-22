-- create markdown table
-- command:
--  TableModeEnable
--  TableModeToggle
return {
  "dhruvasagar/vim-table-mode",
  config = function()
    vim.cmd(
      [[
        augroup markdown_config
          autocmd!
          autocmd FileType markdown nnoremap <buffer> <M-s> :TableModeRealign<CR>
        augroup END
      ]],
      false
    )
    vim.g.table_mode_sort_map = "<leader>mts"
  end,
} --> table mode
