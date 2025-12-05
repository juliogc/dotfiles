-- █▀ █▄░█ ▄▀█ █▀▀ █▄▀ █▀ ░░▄▀ █▀▄ ▄▀█ █▀ █░█ █▄▄ █▀█ ▄▀█ █▀█ █▀▄
-- ▄█ █░▀█ █▀█ █▄▄ █░█ ▄█ ▄▀░░ █▄▀ █▀█ ▄█ █▀█ █▄█ █▄█ █▀█ █▀▄ █▄▀

local M = {
  sections = {
    {
      section = "terminal",
      cmd = "chafa ~/.config/wallpapers/tokyo_pink.png --size 60x17 --stretch; sleep .1",
      height = 17,
      padding = 1,
    },
    {
      pane = 2,
      { section = "keys", gap = 1, padding = 1 },
      { section = "startup" },
    },
  },
}

return M
