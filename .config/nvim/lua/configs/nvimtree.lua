local M = require "nvchad.configs.nvimtree"

M.filters = {
  dotfiles = false,
  git_ignored = false,
  custom = { "node_modules", ".cache", "dist" },
}

return M
