# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

# Installation

Requirements:

* Neovim maybe >= 0.10
* `npm` or `yarn` for markdown-preview plugin
* `ripgrep` for telescope plugin

Neovim's configurations are located under the following paths, depending on your OS:

| OS      | PATH                                    |
|---------|-----------------------------------------|
| Linux   | $XDG_CONFIG_HOME/nvim, `~/.config/nvim` |
| MacOS   | $XDG_CONFIG_HOME/nvim, `~/.config/nvim` |
| Windows | %userprofile%\AppData\Local\nvim\       |

You can use `:help base-directories` to get more information about configuration location.

Clone configurations to your computer:

```sh
# in linux
git clone https://github.com/kangkang005/nvim-lazy-config.git ~/.config/nvim
```

# Extensions

## Added Category Directory for Plugins (optional)

steps:

1. Add new directory to `lua/plugins/<directory>`.
2. Modify `lua/config/lazy.lua` with new directory.

```lua
...
require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    { import = "plugins" },
    -- add new directory here with plugins
    { import = "plugins/<directory>" },
  },
...
})
```

Now, You can add plugin to new directory.

## Added Plugin

Add new configuration in `lua/plugins/*` files, which will be auto loaded using `lua/config/lazy.nvim`.

Example: `lua/plugins/persisted.lua`

```lua
return {
  "olimorris/persisted.nvim",
  config = true,
}
```

## Disabled Plugins


```text
ui/sidebar.lua
ui/pretty-fold.lua
task/asynctasks.lua
copilot.lua
```

# Other

## runtimepath(rtp)

You can get your current runtimepath via Neovim API with `nvim_list_runtime_paths()` function:

```lua
:lua print(vim.inspect(vim.api.nvim_list_runtime_paths()))
```
You can add path to runtimepath:

```lua
vim.opt.runtimepath:append(',~/.config/nvim/lua')
```
