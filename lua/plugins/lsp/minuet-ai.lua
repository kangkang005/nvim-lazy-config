-- Minuet AI: Dance with Intelligence in Your Code 💃.
return {
  "milanglacier/minuet-ai.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("minuet").setup({
      -- Enable or disable auto-completion. Note that you still need to add
      -- Minuet to your cmp/blink sources. This option controls whether cmp/blink
      -- will attempt to invoke minuet when minuet is included in cmp/blink
      -- sources. This setting has no effect on manual completion; Minuet will
      -- always be enabled when invoked manually. You can use the command
      -- `MinuetToggle` to toggle this option.
      cmp = {
        enable_auto_complete = true,
      },
      blink = {
        enable_auto_complete = true,
      },
      virtualtext = {
        -- Specify the filetypes to enable automatic virtual text completion,
        -- e.g., { 'python', 'lua' }. Note that you can still invoke manual
        -- completion even if the filetype is not on your auto_trigger_ft list.
        auto_trigger_ft = {},
        keymap = {
          accept = nil,
          accept_line = nil,
          -- Cycle to next completion item, or manually invoke completion
          next = nil,
          -- Cycle to prev completion item, or manually invoke completion
          prev = nil,
          dismiss = nil,
        },
      },
      -- the maximum total characters of the context before and after the cursor
      -- 12,800 characters typically equate to approximately 4,000 tokens for
      -- LLMs.
      context_window = 12800,
      -- when the total characters exceed the context window, the ratio of
      -- context before cursor and after cursor, the larger the ratio the more
      -- context before cursor will be used. This option should be between 0 and
      -- 1, context_ratio = 0.75 means the ratio will be 3:1.
      context_ratio = 0.75,
      throttle = 1000, -- only send the request every x milliseconds, use 0 to disable throttle.
      -- debounce the request in x milliseconds, set to 0 to disable debounce
      debounce = 400,
      -- show notification when request is sent or request fails. options:
      -- false to disable notification. Note that you should use false, not "false".
      -- "verbose" for all notifications.
      -- "warn" for warnings and above.
      -- "error" just errors.
      notify = "verbose",
      -- The request timeout, measured in seconds. When streaming is enabled
      -- (stream = true), setting a shorter request_timeout allows for faster
      -- retrieval of completion items, albeit potentially incomplete.
      -- Conversely, with streaming disabled (stream = false), a timeout
      -- occurring before the LLM returns results will yield no completion items.
      request_timeout = 3,
      -- if completion item has multiple lines, create another completion item only containing its first line.
      add_single_line_entry = true,
      -- The number of completion items (encoded as part of the prompt for the
      -- chat LLM) requested from the language model. It's important to note that
      -- when 'add_single_line_entry' is set to true, the actual number of
      -- returned items may exceed this value. Additionally, the LLM cannot
      -- guarantee the exact number of completion items specified, as this
      -- parameter serves only as a prompt guideline.
      n_completions = 3,
      -- Defines the length of non-whitespace context after the cursor used to
      -- filter completion text. Set to 0 to disable filtering.
      --
      -- Example: With after_cursor_filter_length = 3 and context:
      --
      -- "def fib(n):\n|\n\nfib(5)" (where | represents cursor position),
      --
      -- if the completion text contains "fib", then "fib" and subsequent text
      -- will be removed. This setting filters repeated text generated by the
      -- LLM. A large value (e.g., 15) is recommended to avoid false positives.
      after_cursor_filter_length = 15,
      -- proxy port to use
      proxy = nil,
      provider = "openai_fim_compatible",
      provider_options = {
        openai_fim_compatible = {
          model = "deepseek-coder",
          end_point = "https://api.deepseek.com/beta/completions",
          name = "Deepseek",
          api_key = "OPENAI_API_KEY",
          stream = true,
          optional = {
            stop = nil,
            max_tokens = nil,
          },
        },
      },
    })
  end,
}
