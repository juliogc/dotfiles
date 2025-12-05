-- █▀ █░░ █ █▀▄▀█ █░░ █ █▄░█ █▀▀
-- ▄█ █▄▄ █ █░▀░█ █▄▄ █ █░▀█ ██▄

local M = {
  style = "fg",
  configs = {
    mode = {
      verbose = true,
    },
  },
  components = {
    left = {
      "mode",
      "path",
      "git",
      "diagnostics",
    },
    center = {},
    right = {
      "recording",
      "searchcount",
      "selectioncount",
      "filetype_lsp",
      "progress",
    },
  },

  spaces = {
    components = "",
    left = "",
    right = "",
  },
}

return M
