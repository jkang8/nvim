---@type vim.lsp.Config
return {
  cmd = { "uvx", "pyrefly", "lsp" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", "setup.cfg", ".git" },
}
