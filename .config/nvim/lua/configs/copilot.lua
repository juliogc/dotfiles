-- █▀▀ █▀█ █▀█ █ █░░ █▀█ ▀█▀
-- █▄▄ █▄█ █▀▀ █ █▄▄ █▄█ ░█░

local M = {
  suggestion = {
    enabled = not vim.g.ai_cmp,
    auto_trigger = true,
    hide_during_completion = vim.g.ai_cmp,
    keymap = {
      accept = false, -- handled by nvim-cmp / blink.cmp
      next = "<M-]>",
      prev = "<M-[>",
    },
  },
  -- suggestion = { enabled = false },
  panel = { enabled = false },
  filetypes = {
    markdown = true,
    help = true,
    codecompanion = true,
  },
  logger = {
    print_log_level = vim.log.levels.ERROR,
  },
}

return M
