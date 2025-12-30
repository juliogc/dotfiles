-- █▀▀ █▀█ █▀█ █ █░░ █▀█ ▀█▀
-- █▄▄ █▄█ █▀▀ █ █▄▄ █▄█ ░█░

local M = {
  suggestion = {
    enabled = true,
    auto_trigger = true,
    hide_during_completion = vim.g.ai_cmp,
    keymap = {
      accept = false, -- handled by nvim-cmp / blink.cmp
      next = "<M-]>",
      prev = "<M-[>",
    },
  },
  panel = { enabled = false },
  filetypes = {
    markdown = true,
    help = true,
    codecompanion = true,
  },
  logger = {
    file = vim.fn.stdpath "log" .. "/copilot-lua.log",
    print_log_level = vim.log.levels.ERROR,
  },
}

return M
