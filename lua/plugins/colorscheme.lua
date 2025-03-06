return {
  -- "olimorris/onedarkpro.nvim",
  "navarasu/onedark.nvim",
  -- "folke/tokyonight.nvim",
  priority = 1000, -- Ensure it loads first
  config = function()
    require("onedark").setup({
      style = "darker",
    })
  end,
}
