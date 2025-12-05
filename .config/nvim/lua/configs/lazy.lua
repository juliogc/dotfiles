-- █░░ ▄▀█ ▀█ █▄█
-- █▄▄ █▀█ █▄ ░█░

local M = {
  git = {
    filter = false,
    submodules = false,
    timeout = 300,
    url_format = "git@github.com:%s.git",
  },

  ui = {
    icons = {
      ft = "",
      lazy = "󰂠 ",
      loaded = "",
      not_loaded = "",
    },
  },
}

return M
