return {
  {
    "nvim-mini/mini.nvim",
    config = function()
      require("mini.bufremove").setup()
      require("mini.cursorword").setup()
      require("mini.files").setup()
      require("mini.icons").setup()
      require("mini.indentscope").setup()
      require("mini.notify").setup()
      require("mini.pairs").setup()
      require("mini.pick").setup()
      require("mini.surround").setup()

      vim.notify = require("mini.notify").make_notify()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
    keys = {
      {
        "<leader>e",
        function()
          local minifiles = require("mini.files")
          local file = vim.api.nvim_buf_get_name(0)
          if file == "" or vim.uv.fs_stat(file) == nil then
            minifiles.open(nil, false)
            return
          end

          local cwd = vim.fs.normalize(vim.fn.getcwd())
          local relative_file = vim.fs.relpath(cwd, file)
          if relative_file == nil then
            minifiles.open(file, false)
            return
          end

          minifiles.open(cwd, false)
          local branch = { cwd }
          local path = cwd
          for part in relative_file:gmatch("[^/]+") do
            path = vim.fs.joinpath(path, part)
            branch[#branch + 1] = path
          end
          minifiles.set_branch(branch)
        end,
        desc = "File explorer at current file",
      },
      {
        "<leader>bd",
        function()
          require("mini.bufremove").delete(0, false)
        end,
        desc = "Delete buffer",
      },
      {
        "<leader>tt",
        function()
          vim.cmd("botright split")
          vim.cmd.terminal()
          vim.cmd("startinsert")
        end,
        desc = "Terminal",
      },
    },
  },
  {
    "ibhagwan/fzf-lua",
    opts = {},
    keys = {
      {
        "<leader><space>",
        function()
          require("fzf-lua").files()
        end,
        desc = "Find files",
      },
      {
        "<leader>ff",
        function()
          require("fzf-lua").files()
        end,
        desc = "Find files",
      },
      {
        "<leader>/",
        function()
          require("fzf-lua").live_grep()
        end,
        desc = "Grep",
      },
      {
        "<leader>fb",
        function()
          require("fzf-lua").buffers()
        end,
        desc = "Buffers",
      },
      {
        "<leader>fr",
        function()
          require("fzf-lua").oldfiles()
        end,
        desc = "Recent files",
      },
      {
        "<leader>gs",
        function()
          require("fzf-lua").git_status()
        end,
        desc = "Git status picker",
      },
      {
        "<leader>ut",
        function()
          require("fzf-lua").colorschemes()
        end,
        desc = "Themes",
      },
    },
  },
  {
    "folke/zen-mode.nvim",
    opts = {},
    keys = {
      {
        "<leader>z",
        function()
          require("zen-mode").toggle()
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
