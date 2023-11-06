# Color Scheme for Neovim

This is a colorscheme *and* a colorscheme creator. Check the `demo.html` file
to see the full palette. This is somewhat inspired by Base16 but with less
restrictions and more descriptive naming.

There isn't some grand design philosophy behind this, the color groups are what
I consider to be the core components of code highlighting without much extra
complexity.

```lua
-- These are the default configs! override only the ones you want or just use
-- setup() for using the defaults

require 'nvim-theme'.setup {
  transparent        = true,
  italic_comments    = false,
  bright_cursor_line = false,

  plugin_integrations = {
    telescope = true,
    mini_nvim = true,
  },

  overrides = {
    -- Example, override group "Pmenu" and make it blue
    -- {'Pmenu', { bg = '#1e1e80', fg = '#d3d3d3'}}
  },

  -- You can just create your own theme by providing a colors table, use
  -- 'termcolors' for tty variant
  colors = {
    -- Main colors
    bg        = '#1d2021',
    bg_alt    = '#303536',
    bg_br     = '#434a4c',
    bg_br_alt = '#606a6c',
    fg        = '#f4e5bf',
    fg_alt    = '#eed89f',
    fg_br     = '#fcf8ee',
    fg_br_alt = '#f9f1dc',

    -- Highlights
    type         = '#81aece',
    type_alt     = '#7ec9b1',
    reserved     = '#cda2e3',
    reserved_alt = '#af91d5',
    id           = '#ebe3cb',
    id_alt       = '#e6b995',
    literal      = '#c4dc9b',
    literal_alt  = '#8ac87d',
    func         = '#ecdc8b',
    func_alt     = '#ecdc8b',
    str          = '#cd9169',
    str_alt      = '#cdaf69',

    -- Diagnostic
    error = '#d83e33',
    warn  = '#f2ba41',
    hint  = '#cda1ac',
    info  = '#c8889f',
  }
}
```
