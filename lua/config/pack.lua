local repo_name = function(repo)
  return repo:match("([^/]+)$")
end

local module_names = {
  ["folke/snacks.nvim"] = "snacks",
  ["folke/which-key.nvim"] = "which-key",
  ["echasnovski/mini.pairs"] = "mini.pairs",
  ["echasnovski/mini.icons"] = "mini.icons",
  ["echasnovski/mini.surround"] = "mini.surround",
  ["stevearc/conform.nvim"] = "conform",
  ["nvim-lualine/lualine.nvim"] = "lualine",
  ["lewis6991/gitsigns.nvim"] = "gitsigns",
  ["nvim-treesitter/nvim-treesitter-context"] = "treesitter-context",
  ["saghen/blink.cmp"] = "blink.cmp",
  ["zbirenbaum/copilot.lua"] = "copilot",
  ["olimorris/codecompanion.nvim"] = "codecompanion",
  ["mason-org/mason.nvim"] = "mason",
  ["mason-org/mason-lspconfig.nvim"] = "mason-lspconfig",
}

local specs = {}
local seen = {}

local function visit(spec)
  if type(spec) == "string" then
    spec = { spec }
  end
  if type(spec) ~= "table" or type(spec[1]) ~= "string" then
    return
  end

  local repo = spec[1]
  if seen[repo] then
    return
  end
  seen[repo] = true

  for _, dependency in ipairs(spec.dependencies or {}) do
    visit(dependency)
  end

  specs[#specs + 1] = spec
end

for _, path in ipairs(vim.fn.glob(vim.fn.stdpath("config") .. "/lua/plugins/*.lua", false, true)) do
  for _, spec in ipairs(dofile(path)) do
    visit(spec)
  end
end

local packages = {}
for _, spec in ipairs(specs) do
  local package = { src = "https://github.com/" .. spec[1], name = repo_name(spec[1]) }
  if type(spec.version) == "string" and spec.version ~= false then
    package.version = vim.version.range(spec.version)
  end
  packages[#packages + 1] = package
end

vim.pack.add(packages, { confirm = false, load = true })

for _, spec in ipairs(specs) do
  if spec.init then
    spec.init()
  end
end

for _, spec in ipairs(specs) do
  local opts = spec.opts
  if type(opts) == "function" then
    opts = opts()
  end

  if spec.config then
    spec.config(spec, opts)
  elseif opts and module_names[spec[1]] then
    require(module_names[spec[1]]).setup(opts)
  end

  for _, key in ipairs(spec.keys or {}) do
    local mode = key.mode or "n"
    vim.keymap.set(mode, key[1], key[2], { desc = key.desc })
  end
end
