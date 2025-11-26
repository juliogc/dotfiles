-- █▀ █▄░█ ▄▀█ █▀▀ █▄▀ █▀
-- ▄█ █░▀█ █▀█ █▄▄ █░█ ▄█

local dashboard = require "configs.snacks.dashboard"
local picker = require "configs.snacks.picker"
local terminal = require "configs.snacks.terminal"

---@type snacks.Config
local M = {
  bigfile = { enabled = true },
  dashboard = dashboard,
  explorer = { enabled = true },
  image = { enabled = true },
  indent = { enabled = true },
  input = { enabled = true },
  notifier = { enabled = true },
  picker = picker,
  quickfile = { enabled = true },
  scope = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = { enabled = true },
  terminal = terminal,
  words = { enabled = true },
}

return M
