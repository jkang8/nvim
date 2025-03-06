return {
  -- Configure the Go language server
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              -- Enable auto imports
              analyses = {
                unusedparams = true,
                shadow = true,
              },
              staticcheck = true,
              gofumpt = true,
              usePlaceholders = true,
              completeUnimported = true,
              matcher = "fuzzy",
              -- This is essential for auto imports
              importShortcut = "Both",
            },
          },
        },
      },
    },
  },

  -- Optional: Add a plugin for Go development
  -- {
  --   "ray-x/go.nvim",
  --   dependencies = {
  --     "ray-x/guihua.lua",
  --     "neovim/nvim-lspconfig",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   config = function()
  --     require("go").setup({
  --       -- Enable auto imports
  --       goimport = "gopls", -- Use gopls for auto imports
  --       lsp_cfg = {
  --         settings = {
  --           gopls = {
  --             usePlaceholders = true,
  --             completeUnimported = true,
  --           },
  --         },
  --       },
  --     })
  --   end,
  --   ft = { "go", "gomod" },
  --   build = ':lua require("go.install").update_all_sync()',
  -- },
}
