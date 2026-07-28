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
}
