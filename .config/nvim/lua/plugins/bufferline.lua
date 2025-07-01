return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    vim.opt.termguicolors = true

    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or ""
          return " " .. icon .. count
        end,
        indicator = {
          style = "underline",
        },
        separator_style = "thin",
        style_preset = bufferline.style_preset.default, -- default|minimal
        offsets = {
          {
            filetype = "neo-tree",
            text = " ",
            text_align = "center",
          }
        },
      },
    })
  end,
}
