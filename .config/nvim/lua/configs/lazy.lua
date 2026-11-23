-- █░░ ▄▀█ ▀█ █▄█
-- █▄▄ █▀█ █▄ ░█░

local M = {
  concurrency = 4,

  git = {
    filter = false,
    timeout = 300,
    url_format = "git@github.com:%s.git",
    -- throttle = {
    --   enabled = true,
    --   rate = 1,
    --   duration = 3000,
    -- },
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
