-- ▀█▀ █▀█ █▄▀ █▄█ █▀█ █▄░█ █ █▀▀ █░█ ▀█▀
-- ░█░ █▄█ █░█ ░█░ █▄█ █░▀█ █ █▄█ █▀█ ░█░

require("tokyonight").setup {
  style = "night",
  ---@param highlights tokyonight.Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors)
    -- Colors for Snacks pickers
    highlights.SnacksPickerBoxTitle = { bg = colors.blue2, fg = colors.fg, bold = true }
    highlights.SnacksPickerInput = { bg = colors.bg, fg = colors.fg }
    highlights.SnacksPickerInputBorder = { bg = colors.bg, fg = colors.bg }
    highlights.SnacksPickerInputTitle = { bg = colors.blue2, fg = colors.fg, bold = true }
    highlights.SnacksPickerList = { bg = colors.bg }
    highlights.SnacksPickerListBorder = { bg = colors.bg, fg = colors.bg }
    highlights.SnacksPickerListCursorLine = { bg = colors.bg_dark }
    highlights.SnacksPickerPreviewBorder = { bg = colors.bg_dark, fg = colors.bg }
    highlights.SnacksPickerPrompt = { bg = colors.bg, fg = colors.orange }
    highlights.FloatBorder = { bg = colors.bg_dark, fg = colors.bg_dark }

    -- Colors for slimline
    highlights.SlimlineModeVisual = { fg = colors.purple, bg = colors.bg }
    highlights.SlimlineModeInsert = { fg = colors.green, bg = colors.bg  }
    highlights.SlimlineModeReplace = { fg = colors.red1, bg = colors.bg  }
    highlights.SlimlineModeCommand = { fg = colors.yellow, bg = colors.bg }
  end,
}

vim.cmd [[colorscheme tokyonight-night]]
