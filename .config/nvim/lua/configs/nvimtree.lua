-- █▄░█ █░█ █ █▀▄▀█ ▀█▀ █▀█ █▀▀ █▀▀
-- █░▀█ ▀▄▀ █ █░▀░█ ░█░ █▀▄ ██▄ ██▄

local M = require "nvchad.configs.nvimtree"

M.filters = {
  dotfiles = false,
  git_ignored = false,
  custom = { "node_modules", ".cache", "dist" },
}

-- M.offsets = {
--   {
--     filetype = "NvimTree",
--     separator = false,
--     highlight = "NvimTreeNormal",
--   },
-- }

M.view = {
  width = 35,
}

return M
