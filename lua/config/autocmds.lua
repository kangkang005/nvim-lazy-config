-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = false -- 覆盖默认的 true
  end,
})

-- change c/cpp file tab width to 4 spaces
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("associate_filetype"),
  pattern = { "c", "cpp", "rust" },
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.formatoptions:remove({ "o" })
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "c", "cpp", "md", "txt", "c.snippets", "cpp.snippets" },
  callback = function()
    vim.b.autoformat = true
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

-- open neo-tree on startup
-- corresponding code refer to 'init' keyword at lua/plugins/ui/neo-tree.lua
--
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "c", "cpp", "rust", "python", "lua" },
--   group = vim.api.nvim_create_augroup("NeotreeOnNewTab", { clear = true }),
--   callback = vim.schedule_wrap(function()
--     vim.cmd("Neotree show")
--   end),
-- })
