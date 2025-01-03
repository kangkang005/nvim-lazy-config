-- gesture.nvim is a mouse gesture plugin for Neovim (nightly).
return {
  "notomo/gesture.nvim",

  config = function()
    vim.opt.mouse = "a"
    vim.opt.mousemoveevent = true

    vim.keymap.set("n", "<LeftDrag>", [[<Cmd>lua require("gesture").draw()<CR>]], { silent = true })
    vim.keymap.set("n", "<LeftRelease>", [[<Cmd>lua require("gesture").finish()<CR>]], { silent = true })

    -- or if you would like to use right click
    vim.keymap.set("n", "<RightMouse>", [[<Nop>]])
    vim.keymap.set("n", "<RightDrag>", [[<Cmd>lua require("gesture").draw()<CR>]], { silent = true })
    vim.keymap.set("n", "<RightRelease>", [[<Cmd>lua require("gesture").finish()<CR>]], { silent = true })

    local gesture = require("gesture")
    gesture.register({
      name = "scroll to bottom",
      inputs = { gesture.up(), gesture.down() },
      action = "normal! G",
    })
    gesture.register({
      name = "next tab",
      inputs = { gesture.right() },
      action = "tabnext",
    })
    gesture.register({
      name = "previous tab",
      inputs = { gesture.left() },
      action = function(_) -- also can use callable
        vim.cmd.tabprevious()
      end,
    })
    gesture.register({
      name = "go back",
      inputs = { gesture.right(), gesture.left() },
      -- map to `<C-o>` keycode
      action = function()
        vim.api.nvim_feedkeys(vim.keycode("<C-o>"), "n", true)
      end,
    })
    gesture.register({
      name = "close gesture traced windows",
      match = function(ctx)
        local last_input = ctx.inputs[#ctx.inputs]
        return last_input and last_input.direction == "UP"
      end,
      can_match = function(ctx)
        local first_input = ctx.inputs[1]
        return first_input and first_input.direction == "RIGHT"
      end,
      action = function(ctx)
        table.sort(ctx.window_ids, function(a, b)
          return a > b
        end)
        for _, window_id in ipairs(ctx.window_ids) do
          if vim.api.nvim_win_is_valid(window_id) then
            vim.api.nvim_win_close(window_id, false)
          end
        end
      end,
    })
  end,
}
