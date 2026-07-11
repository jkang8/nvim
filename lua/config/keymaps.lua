-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "gd", function()
  local params = vim.lsp.util.make_position_params()
  vim.lsp.buf_request(0, "textDocument/definition", params, function(_, result)
    if not result or vim.tbl_isempty(result) then
      return vim.lsp.buf.references()
    end
    local def = vim.islist(result) and result[1] or result
    local def_uri = def.uri or def.targetUri
    local def_line = (def.range or def.targetSelectionRange).start.line
    local cur_line = vim.api.nvim_win_get_cursor(0)[1] - 1
    if def_uri == vim.uri_from_bufnr(0) and def_line == cur_line then
      vim.lsp.buf.references()
    else
      vim.lsp.buf.definition()
    end
  end)
end, { desc = "Goto Definition or References" })
