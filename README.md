# Neovim config

A small Neovim 0.12+ configuration built with Lua and
the built-in `vim.pack` package manager.

## Requirements

- Neovim 0.12+
- Git, `fzf`, ripgrep, and a C compiler
- A Nerd Font for icons
- `tree-sitter-cli` 0.26.1+

Open Neovim and run `:checkhealth` after the first plugin installation.

Useful commands:

- `:packupdate` updates plugins
- `:packdel {name}` removes a plugin

`vim.pack` records installed revisions in `nvim-pack-lock.json`.
- `:Mason` manages language servers
- `:ConformInfo` reports formatter availability
- `:checkhealth vim.lsp` reports LSP status

Core mappings:

- `<Space><Space>` files
- `<Space>ff` files, `<Space>/` fuzzy grep, `<Space>fb` buffers
- `<Space>bd` delete buffer without closing its window
- `[b` / `<Option-p>` previous buffer, `]b` / `<Option-n>` next buffer
- `<Space>gd` open Git diff, `<Space>gD` close it, `<Space>gh` file history
- `<Space>gg` open LazyGit
- `<Space>gs` Git-status picker
- `<Space>e` file explorer
- `<Space>tt` terminal
- `<Space>z` Zen mode
- `<Space>ut` choose a theme
- `<Space>cf` format
- `<Space>uc` toggle pinned code context
- In normal mode, `<C-h/j/k/l>` navigate across Neovim and Herdr splits;
  `<Option-h/j/k/l>` resize them
- `<Space>wh/wj/wk/wl` move between windows
- `<Space>ww` write file
