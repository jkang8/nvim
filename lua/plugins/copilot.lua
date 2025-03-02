return {
  -- GitHub Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          -- Turn off suggestions if using copilot-cmp
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<C-j>",
            accept_word = "<M-;>",
            accept_line = "<M-o>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        panel = { enabled = true },
        filetypes = {
          markdown = true,
          help = false,
        },
      })
    end,
  },

  -- Optional: Copilot with nvim-cmp integration
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   dependencies = { "zbirenbaum/copilot.lua" },
  --   config = function()
  --     require("copilot_cmp").setup()
  --
  --     -- Optional: Add to nvim-cmp sources
  --     local has_cmp, cmp = pcall(require, "cmp")
  --     if has_cmp then
  --       local sources = cmp.get_config().sources or {}
  --       table.insert(sources, 1, { name = "copilot", group_index = 1 })
  --       cmp.setup({ sources = sources })
  --     end
  --   end,
  -- },
}
