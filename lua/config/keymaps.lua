-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- toggle terminal, key "exit" to exit terminal
-- toggleterm {
-- running single python/perl codes
map("n", "<leader>ty", '<cmd>TermExec cmd="python3 %"<cr>', { desc = "Run python codes in Float" })
map("n", "<leader>tl", '<cmd>TermExec cmd="perl %"<cr>', { desc = "Run perl codes in Float" })
map("n", "<leader>tc", function()
  local cmd = ""
  if vim.bo.filetype == "python" then
    cmd = "python3 %"
  elseif vim.bo.filetype == "perl" then
    cmd = "perl %"
  else
    return
  end
  vim.api.nvim_command("TermExec size=20 cmd='" .. cmd .. "' direction=float")
end, { desc = "Run current codes in Float" })
map("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", { desc = "ToggleTerm horizontal split" })
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "ToggleTerm float" })
map("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "ToggleTerm vertical split" })
-- toggleterm }

-- quick motion
-- hop.nvim {
local hop = require("hop")
local directions = require("hop.hint").HintDirection
local positions = require("hop.hint").HintPosition
-- leader h w
map({ "n", "v" }, "<leader>hw", function()
  hop.hint_words({ direction = directions.AFTER_CURSOR })
end, { desc = "Go to next any begining of words" })
-- leader h e
map({ "n", "v" }, "<leader>he", function()
  hop.hint_words({ direction = directions.AFTER_CURSOR, hint_position = positions.END })
end, { desc = "Go to next any end of words" })
-- leader h b
map({ "n", "v" }, "<leader>hb", function()
  hop.hint_words({ direction = directions.BEFORE_CURSOR })
end, { desc = "Go to previous any begining of words" })
-- leader h b
map({ "n", "v" }, "<leader>hv", function()
  hop.hint_words({ direction = directions.BEFORE_CURSOR, hint_position = positions.END })
end, { desc = "Go to previous any end of words" })
-- leader h a
map({ "n", "v" }, "<leader>ha", function()
  hop.hint_anywhere({})
end, { desc = "Go to any char" })
-- leader h j
map({ "n", "v" }, "<leader>hj", function()
  hop.hint_lines({ direction = directions.AFTER_CURSOR })
end, { desc = "Go to line below" })
-- leader h k
map({ "n", "v" }, "<leader>hk", function()
  hop.hint_lines({ direction = directions.BEFORE_CURSOR })
end, { desc = "Go to line above" })
-- hop.nvim }
--
-- store or restore sessions
-- persisted {
map("n", "<leader>fs", "<cmd>Telescope persisted<cr>", { desc = "Search history sessions" })
-- persisted }
--
-- cmake build/run keymap with plugins/cmake-tools.lua
--
-- markdown-preview keymap with plugins/markdown/markdown-preview.lua
--
-- markview keymap with plugins/markdown/markview.lua
--
-- cybu(Tab Quick Navigation) keymap with plugins/markdown/cybu.lua
--
-- goto-preview(preview function definitions) keymap with plugins/ui/goto-preview.lua
--
-- glance(preview function definitions) keymap with plugins/ui/glance.lua
--
-- sidebar keymap with plugins/ui/sidebar.lua
