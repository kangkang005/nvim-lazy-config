-- ChatGPT is a Neovim plugin that allows you to effortlessly utilize the OpenAI ChatGPT API,
-- empowering you to generate natural language responses from OpenAI's ChatGPT directly within
-- the editor in response to your inquiries.
return {
  "jackMort/ChatGPT.nvim",
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
        model = "gpt-3.5-turbo",
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
