-- █▀▄▀█ ▄▀█ █▀ █▀█ █▄░█
-- █░▀░█ █▀█ ▄█ █▄█ █░▀█

local M = {
  PATH = "skip",

  ui = {
    icons = {
      package_pending = " ",
      package_installed = " ",
      package_uninstalled = " ",
    },
  },

  log_level = vim.log.levels.ERROR,
  max_concurrent_installers = 10,
}

return M
