-- █▄░█ █▀█ █ █▀▀ █▀▀
-- █░▀█ █▄█ █ █▄▄ ██▄

---@type NoiceConfig
local M = {
  notify = {
    enabled = false,
  },
  lsp = {
    -- Override markdown rendering to be handled by Noice
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- For blink.cmp
    },
  },
  ---@type NoicePresets
  presets = {
    lsp_doc_border = true,
  },
  ---@type NoiceRouteConfig[]
  routes = {
    -- Show recording messages as notify messsage
    -- https://github.com/folke/noice.nvim/wiki/Configuration-Recipes#show-recording-messages
    {
      view = "notify",
      filter = { event = "msg_showmode" },
    },
  },
  ---@type NoiceConfigViews
  views = {
    cmdline_popup = {
      border = {
        style = "none",
        padding = { 1, 2 },
      },
      filter_options = {},
      win_options = {
        winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
      },
    },
  },
}

return M
