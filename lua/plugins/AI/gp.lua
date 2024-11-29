-- ChatGPT like sessions, Instructable text/code operations, Speech to text and Image generation in your favorite editor.
return {
  "robitx/gp.nvim",
  config = function()
    local conf = {
      -- For customization, refer to Install > Configuration in the Documentation/Readme

      -- optional curl parameters (for proxy, etc.)
      -- curl_params = { "--proxy", "http://X.X.X.X:XXXX" }
      curl_params = {},

      -- default agent names set during startup, if 'nil' last used agent is used
      default_command_agent = "CodeGPT4o-mini",
      default_chat_agent = "ChatGPT4o-mini",

      openai_api_key = os.getenv("OPENAI_API_KEY"),
      providers = {
        openai = {
          disable = false,
          endpoint = "https://free.v36.cm/v1/chat/completions",
          -- secret = os.getenv("OPENAI_API_KEY"),
        },
      },
      agents = {
        {
          name = "ChatGPT4o",
          disable = true,
          provider = "openai",
          chat = true,
          command = false,
          -- string with model name or table with model name and parameters
          model = { model = "gpt-4o", temperature = 1.1, top_p = 1 },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = require("gp.defaults").chat_system_prompt,
        },
        {
          name = "ChatGPT4o-mini",
          -- disable = true,
          provider = "openai",
          chat = true,
          command = false,
          -- string with model name or table with model name and parameters
          model = { model = "gpt-4o-mini", temperature = 1.1, top_p = 1 },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = require("gp.defaults").chat_system_prompt,
        },
        {
          name = "ChatGPT3.5",
          provider = "openai",
          chat = true,
          command = false,
          -- string with model name or table with model name and parameters
          model = { mode = "gpt-3.5-turbo", temperature = 1.1, top_p = 1 },
          -- system_prompt = "Answer any query with just: Sure thing..",
          system_prompt = require("gp.defaults").chat_system_prompt,
        },
        {
          provider = "openai",
          name = "CodeGPT4o",
          chat = false,
          command = true,
          -- string with model name or table with model name and parameters
          model = { model = "gpt-4o", temperature = 0.8, top_p = 1 },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = require("gp.defaults").code_system_prompt,
        },
        {
          provider = "openai",
          name = "CodeGPT4o-mini",
          chat = false,
          command = true,
          -- string with model name or table with model name and parameters
          model = { model = "gpt-4o-mini", temperature = 0.7, top_p = 1 },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = "Please return ONLY code snippets.\nSTART AND END YOUR ANSWER WITH:\n\n```",
        },
        {
          name = "CodeGPT3.5",
          provider = "openai",
          chat = false,
          command = true,
          -- string with model name or table with model name and parameters
          model = { mode = "gpt-3.5-turbo", temperature = 0.8, top_p = 1 },
          -- system_prompt = "Answer any query with just: Sure thing..",
          system_prompt = require("gp.defaults").chat_system_prompt,
        },
      },
    }
    require("gp").setup(conf)

    -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
  end,
}
