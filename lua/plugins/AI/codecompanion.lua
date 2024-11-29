-- AI-powered coding, seamlessly in Neovim. Supports Anthropic, Copilot, Gemini, Ollama, OpenAI and xAI LLMs
return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- The following are optional:
    { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } },
  },
  config = {
    log_level = "DEBUG", -- or "TRACE"
    -- dependency in render-markdown plugin
    display = {
      chat = {
        render_headers = false,
        show_settings = true,
      },
    },
    language = "English", -- Default is "English"
    strategies = {
      chat = {
        adapter = "openai",
      },
      inline = {
        adapter = "openai",
      },
    },
    adapters = {
      -- opts = {
      --   allow_insecure = true, -- Use if required
      --   proxy = "socks5://127.0.0.1:7897",
      -- },
      openai = function()
        return require("codecompanion.adapters").extend("openai", {
          env = {
            -- endpoint = "https://free.v36.cm",
            -- endpoint = "https://free.v36.cm/v1/",
            -- endpoint = "https://free.v36.cm/v1/chat/completions",
            -- url = "https://free.v36.cm/v1",
            --
            url = "https://free.v36.cm",
            -- chat_url = "/v1/",
            --
            chat_url = "/v1/chat/completions",
            -- chat_url = "/chat/completions",
            -- api_key = "sk-JzLtwPzMC1DWri5T29D73fDaD4114a2183857bA6644bD0D6",
            api_key = function()
              return os.getenv("OPENAI_API_KEY")
            end,
          },
          schema = {
            model = {
              default = "gpt-4o-mini",
              -- default = "gpt-3.5-turbo",
            },
          },
        })
      end,
    },
  },
}
