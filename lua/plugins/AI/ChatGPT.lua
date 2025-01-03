-- ChatGPT is a Neovim plugin that allows you to effortlessly utilize the OpenAI ChatGPT API,
-- empowering you to generate natural language responses from OpenAI's ChatGPT directly within
-- the editor in response to your inquiries.
--
-- Interactive popup
-- When using ChatGPT and ChatGPTEditWithInstructions, the following keybindings are available:
--
-- <C-Enter> [Both] to submit.
-- <C-y> [Both] to copy/yank last answer.
-- <C-o> [Both] Toggle settings window.
-- <C-h> [Both] Toggle help window.
-- <Tab> [Both] Cycle over windows.
-- <C-f> [Chat] Cycle over modes (center, stick to right).
-- <C-c> [Both] to close chat window.
-- <C-p> [Chat] Toggle sessions list.
-- <C-u> [Chat] scroll up chat window.
-- <C-d> [Chat] scroll down chat window.
-- <C-k> [Chat] to copy/yank code from last answer.
-- <C-n> [Chat] Start new session.
-- <C-r> [Chat] draft message (create message without submitting it to server)
-- <C-r> [Chat] switch role (switch between user and assistant role to define a workflow)
-- <C-s> [Both] Toggle system message window.
-- <C-i> [Edit Window] use response as input.
-- <C-d> [Edit Window] view the diff between left and right panes and use diff-mode commands
return {
  "jackMort/ChatGPT.nvim",
  -- enabled = false,
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "folke/trouble.nvim", -- optional
    "nvim-telescope/telescope.nvim",
  },

  config = function()
    require("chatgpt").setup({
      -- this config assumes you have OPENAI_API_KEY environment variable set
      -- Custom OpenAI API host with the configuration option api_host_cmd or environment variable called $OPENAI_API_HOST. It's useful if you can't access OpenAI directly
      --
      -- 1. set OPENAI_API_KEY environment variable
      -- 2. set OPENAI_API_HOST environment variable
      api_host_cmd = 'echo -n "$OPENAI_API_HOST"',
      api_key_cmd = 'echo -n "$OPENAI_API_KEY"',
      openai_params = {
        -- NOTE: model can be a function returning the model name
        -- this is useful if you want to change the model on the fly
        -- using commands
        -- Example:
        -- model = function()
        --     if some_condition() then
        --         return "gpt-4-1106-preview"
        --     else
        --         return "gpt-3.5-turbo"
        --     end
        -- end,
        --
        -- model = "gpt-3.5-turbo",
        model = "deepseek-chat",
        frequency_penalty = 0,
        presence_penalty = 0,
        max_tokens = 4095,
        temperature = 0.2,
        top_p = 0.1,
        n = 1,
      },
    })
  end,
}
