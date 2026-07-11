return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        basedpyright = { enabled = false },
        vtsls = {
          root_dir = require("lspconfig.util").root_pattern("package.json"),
        },
        pyright = {
          before_init = function(_, config)
            local venv = config.root_dir .. "/.venv/bin/python"
            if vim.fn.executable(venv) == 1 then
              config.settings.python.pythonPath = venv
            end
          end,
          settings = {
            python = {
              analysis = {
                diagnosticMode = "off",
                typeCheckingMode = "off",
                ignore = { "*" },
              },
            },
          },
        },
      },
    },
  },
}
