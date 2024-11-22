-- command:
--    AsyncTaskEdit (edit local task)
--    AsyncTaskEdit! (edit global task)

-- vim.keymap.set("n", "<leader>ab", "<CMD>AsyncTask file-build<CR>", { desc = "Task Build" })
-- vim.keymap.set("n", "<leader>ar", "<CMD>AsyncTask file-run<CR>", { desc = "Task Run" })
-- vim.keymap.set("n", "<leader>ae", "<CMD>AsyncTaskEdit<CR>", { desc = "Task Edit" })

return {
  "skywind3000/asynctasks.vim",
  enabled = false,

  dependencies = { "skywind3000/asyncrun.vim" },

  config = function()
    vim.g.asyncrun_open = 6
    vim.g.asynctasks_config_name = ".task"
    vim.g.asynctasks_rtp_config = "tasks.ini"
  end,
}
