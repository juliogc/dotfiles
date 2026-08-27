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
      function()
        return string.format(
          "%%#SlimlineModeSecondary# Ln %d, Col %d%%*",
          vim.fn.line ".",
          vim.fn.virtcol "."
        )
      end,
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
