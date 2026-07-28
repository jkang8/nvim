return {
  {
    "folke/snacks.nvim",
    priority = 900,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      picker = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      terminal = { enabled = true },
      words = { enabled = true },
      zen = {
        toggles = {
          dim = true,
          git_signs = false,
        },
      },
    },
    keys = {
      {
        "<leader><space>",
        function()
          Snacks.picker.smart()
        end,
        desc = "Smart find files",
      },
      {
        "<leader>ff",
        function()
          Snacks.picker.files()
        end,
        desc = "Find files",
      },
      {
        "<leader>/",
        function()
          Snacks.picker.grep()
        end,
        desc = "Grep",
      },
      {
        "<leader>fb",
        function()
          Snacks.picker.buffers()
        end,
        desc = "Buffers",
      },
      {
        "<leader>fr",
        function()
          Snacks.picker.recent()
        end,
        desc = "Recent files",
      },
      {
        "<leader>e",
        function()
          Snacks.explorer()
        end,
        desc = "File explorer",
      },
      {
        "<leader>bd",
        function()
          Snacks.bufdelete()
        end,
        desc = "Delete buffer",
      },
      {
        "<leader>gs",
        function()
          Snacks.picker.git_status()
        end,
        desc = "Git status picker",
      },
      {
        "<leader>tt",
        function()
          Snacks.terminal()
        end,
        desc = "Terminal",
      },
      {
        "<leader>z",
        function()
          Snacks.zen()
        end,
        desc = "Toggle Zen mode",
      },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spec = {
        { "<leader>a", group = "ai" },
        { "<leader>b", group = "buffer" },
        { "<leader>f", group = "find" },
        { "<leader>g", group = "git" },
        { "<leader>t", group = "terminal" },
        { "<leader>u", group = "ui" },
        { "<leader>w", group = "window" },
      },
    },
  },
  {
    "lmilojevicc/herdr-splits.nvim",
    opts = {},
    keys = {
      {
        "<C-h>",
        function()
          require("herdr-splits").move_cursor_left()
        end,
        desc = "Navigate left",
      },
      {
        "<C-j>",
        function()
          require("herdr-splits").move_cursor_down()
        end,
        desc = "Navigate down",
      },
      {
        "<C-k>",
        function()
          require("herdr-splits").move_cursor_up()
        end,
        desc = "Navigate up",
      },
      {
        "<C-l>",
        function()
          require("herdr-splits").move_cursor_right()
        end,
        desc = "Navigate right",
      },
      {
        "<M-h>",
        function()
          require("herdr-splits").resize_left()
        end,
        desc = "Resize left",
      },
      {
        "<M-j>",
        function()
          require("herdr-splits").resize_down()
        end,
        desc = "Resize down",
      },
      {
        "<M-k>",
        function()
          require("herdr-splits").resize_up()
        end,
        desc = "Resize up",
      },
      {
        "<M-l>",
        function()
          require("herdr-splits").resize_right()
        end,
        desc = "Resize right",
      },
    },
  },
  {
    "echasnovski/mini.pairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "echasnovski/mini.surround",
    version = false,
    event = "VeryLazy",
    opts = {},
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end,
        mode = { "n", "v" },
        desc = "Format",
      },
    },
    opts = {
      formatters_by_ft = {
        css = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        lua = { "stylua" },
        markdown = { "prettierd", "prettier", stop_after_first = true },
        python = { "ruff_format" },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        vue = { "prettierd", "prettier", stop_after_first = true },
        yaml = { "prettierd", "prettier", stop_after_first = true },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    },
  },
}
