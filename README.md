# cozybox.nvim

Cozybox is a warm, dark Neovim theme with nix-tuned blue and green accents, darker editor surfaces, and syntax overrides baked in.

## Install

```lua
{ "harivansh-afk/cozybox.nvim", priority = 1000 , config = true, opts = ...}
```

Neovim `0.8+`.

## Enable

```vim
set background=dark " or light if you want light mode
colorscheme cozybox

" explicit light entrypoint with the same cozybox accent palette
colorscheme cozybox-light
```

## Override

```lua
require("cozybox").setup({
  transparent_mode = false,
  palette_overrides = {},
  overrides = {},
})
vim.cmd("colorscheme cozybox")
```

The theme already defaults to the custom blue/green palette, hard contrast, darker editor surfaces, and syntax highlight tweaks from your nix config.
See `:h cozybox.nvim` or `lua/cozybox.lua` for the full option surface.
