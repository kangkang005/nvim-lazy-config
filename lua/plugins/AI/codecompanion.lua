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
        -- adapter = "openai",
        adapter = "deepseek",
      },
      inline = {
        -- adapter = "openai",
        adapter = "deepseek",
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
            url = "https://api.deepseek.com",
            -- chat_url = "/v1/chat/completions",
            -- api_key = "sk-JzLtwPzMC1DWri5T29D73fDaD4114a2183857bA6644bD0D6",
            api_key = function()
              return os.getenv("OPENAI_API_KEY")
            end,
          },
          schema = {
            model = {
              -- default = "gpt-4o-mini",
              default = "gpt-3.5-turbo",
            },
          },
        })
      end,
      deepseek = function()
        return require("codecompanion.adapters").extend("openai_compatible", {
          env = {
            url = "https://api.deepseek.com",
            chat_url = "/v1/chat/completions",
            api_key = function()
              return os.getenv("OPENAI_API_KEY")
            end,
          },
          schema = {
            model = {
              default = "deepseek-chat",
            },
            temperature = {
              default = 1.3,
            },
          },
        })
      end,
    },
  },
}
