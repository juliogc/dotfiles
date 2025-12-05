-- █▀▄▀█ █▀▀ █▀█ █░█ █░█ █▄▄
-- █░▀░█ █▄▄ █▀▀ █▀█ █▄█ █▄█

local M = {}

M.setup = function()
  local mcphub = require "mcphub"
  mcphub.setup {
    log = {
      level = vim.log.levels.DEBUG,
      to_file = true,
      file_path = vim.fn.stdpath "state" .. "/mcphub.log",
      prefix = "[mcphub]",
    },
  }
end

return M

