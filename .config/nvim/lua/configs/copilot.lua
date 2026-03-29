-- █▀▀ █▀█ █▀█ █ █░░ █▀█ ▀█▀
-- █▄▄ █▄█ █▀▀ █ █▄▄ █▄█ ░█░

local M = {
  suggestion = {
    enabled = true,
    auto_trigger = true,
    hide_during_completion = vim.g.ai_cmp,
    keymap = {
      accept = false, -- handled by blink.cmp
      next = false,   -- handled by mappings.lua
      prev = false,   -- handled by mappings.lua
    },
  },
  panel = { enabled = false },
  filetypes = {
    ["*"] = true,
    markdown = true,
    help = true,
  },
  logger = {
    file = vim.fn.stdpath "log" .. "/copilot-lua.log",
    print_log_level = vim.log.levels.ERROR,
  },
}

return M
