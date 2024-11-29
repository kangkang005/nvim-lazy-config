-- NeoCodeium is a plugin that provides AI completion powered by Codeium.
-- Neovim >= 0.10.0
--
-- Note: To obtain an API token, you’ll need to run :NeoCodeium auth. On Windows WSL wslview (sudo apt install wslu) should be installed to properly open the browser.
--
--
-- NeoCodeium provides :NeoCodeium user command, which has some useful actions:
-- :NeoCodeium auth - authenticates the user and saves the API token.
-- :NeoCodeium[!] disable - disables completions. With the bang also stops the codeium server.
-- :NeoCodeium enable - enables NeoCodeium completion.
-- :NeoCodeium[!] toggle - toggles NeoCodeium completion. Convey the bang to disable command.
-- :NeoCodeium disable_buffer - disables NeoCodeium completion in the current buffer.
-- :NeoCodeium enable_buffer - enables NeoCodeium completion in the current buffer.
-- :NeoCodeium toggle_buffer - toggles NeoCodeium completion in the current buffer.
-- :NeoCodeium open_log - opens new tab with the log output. More information is in the logging section.
-- :NeoCodeium chat - opens browser with the Codeium Chat.
-- :NeoCodeium restart - restarts Codeium server (useful if the server stops responding for any reason).
return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  config = function()
    local neocodeium = require("neocodeium")
    neocodeium.setup()
    -- Now you can use <Alt-f> in insert mode to accept codeium suggestions.
    vim.keymap.set("i", "<A-f>", function()
      neocodeium.accept()
    end)
    vim.keymap.set("i", "<A-w>", function()
      neocodeium.accept_word()
    end)
    vim.keymap.set("i", "<A-a>", function()
      neocodeium.accept_line()
    end)
    vim.keymap.set("i", "<A-e>", function()
      neocodeium.cycle_or_complete()
    end)
    vim.keymap.set("i", "<A-r>", function()
      neocodeium.cycle_or_complete(-1)
    end)
    vim.keymap.set("i", "<A-c>", function()
      neocodeium.clear()
    end)
  end,
}
