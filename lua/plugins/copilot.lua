-- In your lazy.nvim plugins configuration
return {
  {
    "github/copilot.vim",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      -- Copilot setup
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
      vim.g.copilot_filetypes = {
        ["*"] = true,
      }
    end,
  },
}
