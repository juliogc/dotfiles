-- █▀ █ █▀▄ █▀▀ █▄▀ █ █▀█
-- ▄█ █ █▄▀ ██▄ █░█ █ ▀▀█

return {
  cli = {
    win = {
      position = "right",
      split = { width = math.floor(vim.o.columns * 0.4) },
    },
    mux = {
      enabled = false,
    },
    tools = {
      claude = { enabled = true },
    },
  },
}
