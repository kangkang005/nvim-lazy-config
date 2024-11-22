-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- global config, override local config
local opt = vim.opt

-- Hint: use `:h <option>` to figure out the meaning if needed
opt.clipboard = "unnamedplus" -- use system clipboard
opt.completeopt = { "menu", "menuone", "noselect" }
opt.mouse = "a" -- allow the mouse to be used in Nvim

-- UI config
opt.spell = false -- close spell check
opt.relativenumber = false -- close relative number line
opt.wrap = true -- enable to wrap line
opt.list = true
opt.listchars = { space = "·" } -- show withspace symbol

-- Tab
-- opt.tabstop = 4 -- number of visual spaces per TAB
-- opt.softtabstop = 4 -- number of spacesin tab when editing
-- opt.shiftwidth = 4 -- insert 4 spaces on a tab
-- opt.expandtab = true -- tabs are spaces, mainly because of python

-- Searching
opt.incsearch = true -- search as characters are entered
opt.hlsearch = true -- highlight matches
opt.ignorecase = true -- ignore case in searches by default
opt.smartcase = true -- but make it case sensitive if an uppercase is entered
