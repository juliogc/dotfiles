-- █▄▄ ▄▀█ █▀█ █▄▄ ▄▀█ █▀█
-- █▄█ █▀█ █▀▄ █▄█ █▀█ █▀▄

-- -@type barbar.config.options
local M = {
  animation = true,
  insert_at_end = true,
  icons = {
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = { enabled = true, icon = "ﬀ" },
      [vim.diagnostic.severity.WARN] = { enabled = true },
      [vim.diagnostic.severity.INFO] = { enabled = true },
      [vim.diagnostic.severity.HINT] = { enabled = true },
    },
  },
  sidebar_filetypes = {
    ["snacks_layout_box"] = true
  },
}

return M
