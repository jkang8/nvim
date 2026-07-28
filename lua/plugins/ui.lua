return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      {
        "echasnovski/mini.icons",
        opts = {},
        init = function()
          package.preload["nvim-web-devicons"] = function()
            require("mini.icons").mock_nvim_web_devicons()
            return package.loaded["nvim-web-devicons"]
          end
        end,
      },
    },
    opts = {
      options = {
        theme = "tokyonight",
        globalstatus = true,
        component_separators = "",
        section_separators = { left = "", right = "" },
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")
        local function map(lhs, rhs, desc)
          vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
        end

        map("]h", gitsigns.next_hunk, "Next Git hunk")
        map("[h", gitsigns.prev_hunk, "Previous Git hunk")
        map("<leader>gp", gitsigns.preview_hunk, "Preview hunk")
        map("<leader>gb", gitsigns.blame_line, "Blame line")
      end,
    },
  },
  {
    "sindrets/diffview.nvim",
    opts = {},
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Git diff" },
      { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Close Git diff" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
    },
  },
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    init = function()
      if vim.fn.executable("nvr") == 0 then
        vim.g.lazygit_use_neovim_remote = 0
        return
      end

      if vim.v.servername == "" then
        vim.fn.serverstart()
      end
      vim.env.NVIM = vim.v.servername
      vim.env.NVIM_LISTEN_ADDRESS = vim.v.servername
      vim.env.GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
      vim.g.lazygit_use_neovim_remote = 1
      vim.g.lazygit_use_custom_config_file_path = 1
      vim.g.lazygit_config_file_path = vim.fn.stdpath("config") .. "/lazygit.yml"
    end,
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
      { "<leader>gG", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit current file" },
    },
  },
}
