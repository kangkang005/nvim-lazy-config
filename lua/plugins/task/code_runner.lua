-- Code Runner for Neovim written in pure lua
return {
  "CRAG666/code_runner.nvim",
  config = function()
    -- vim.keymap.set("n", "<leader>r", ":RunCode<CR>", { desc = "Run code", noremap = true, silent = false })
    -- vim.keymap.set("n", "<leader>rf", ":RunFile<CR>", { desc = "Run file", noremap = true, silent = false })
    -- vim.keymap.set("n", "<leader>rft", ":RunFile tab<CR>", { desc = "Run file in tab", noremap = true, silent = false })
    -- vim.keymap.set("n", "<leader>rp", ":RunProject<CR>", { desc = "Run project", noremap = true, silent = false })
    -- vim.keymap.set("n", "<leader>rc", ":RunClose<CR>", { desc = "Run close", noremap = true, silent = false })
    -- vim.keymap.set("n", "<leader>crf", ":CRFiletype<CR>", { desc = "Run file type", noremap = true, silent = false })
    -- vim.keymap.set("n", "<leader>crp", ":CRProjects<CR>", { desc = "Run projects", noremap = true, silent = false })

    require("code_runner").setup({
      filetype = {
        java = {
          "cd $dir &&",
          "javac $fileName &&",
          "java $fileNameWithoutExt",
        },
        python = "python3 -u",
        typescript = "deno run",
        rust = {
          "cd $dir &&",
          "rustc $fileName &&",
          "$dir/$fileNameWithoutExt",
        },
        c = function(...)
          c_base = {
            "cd $dir &&",
            "gcc $fileName -o",
            "/tmp/$fileNameWithoutExt",
          }
          local c_exec = {
            "&& /tmp/$fileNameWithoutExt &&",
            "rm /tmp/$fileNameWithoutExt",
          }
          vim.ui.input({ prompt = "Add more args:" }, function(input)
            c_base[4] = input
            vim.print(vim.tbl_extend("force", c_base, c_exec))
            require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
          end)
        end,
      },
    })
  end,
}