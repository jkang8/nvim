# Neovim config

A small Neovim 0.12+ configuration built with Lua and
the built-in `vim.pack` package manager.

## Requirements

- Neovim 0.12+
- Git, ripgrep, and a C compiler
- A Nerd Font for icons
- `tree-sitter-cli` 0.26.1+
- `neovim-remote` for LazyGit to open files and commit editors in this Neovim
  instance: `uv tool install neovim-remote`

Open Neovim and run `:checkhealth` after the first plugin installation.

Useful commands:

- `:packupdate` updates plugins
- `:packdel {name}` removes a plugin

`vim.pack` records installed revisions in `nvim-pack-lock.json`.
- `:Mason` manages language servers
- `:CodeCompanionChat` opens an AI chat using GitHub Copilot
- `:Copilot auth` authenticates Copilot completions
- `:checkhealth codecompanion` checks the AI integration
- `:ConformInfo` reports formatter availability
- `:checkhealth vim.lsp` reports LSP status

Core mappings:

- `<Space><Space>` smart file picker
- `<Space>ff` files, `<Space>/` fuzzy grep, `<Space>fb` buffers
- `<Space>bd` delete buffer without closing its window
- `[b` / `<Option-p>` previous buffer, `]b` / `<Option-n>` next buffer
- `<Space>gd` open Git diff, `<Space>gD` close it, `<Space>gh` file history
- `<Space>gg` open LazyGit, `<Space>gG` open it for the current file
- In LazyGit, `e` opens the selected file in this Neovim; `C` opens the commit
  editor in a split
- `<Space>gs` Git-status picker
- `<Space>e` file explorer
- `<Space>tt` terminal
- `<Space>z` Zen mode
- `<Space>cf` format
- `<Space>uc` toggle pinned code context
- `<Space>aa` AI action palette
- `<Space>ac` toggle AI chat
- `<Space>ai` prompt an inline AI edit
- `<Space>ad` add a visual selection to AI chat
- `<C-l>` accept an inline Copilot suggestion
- In normal mode, `<C-h/j/k/l>` navigate across Neovim and Herdr splits;
  `<Option-h/j/k/l>` resize them
- `<Space>wh/wj/wk/wl` move between windows
- `<Space>ww` write file
