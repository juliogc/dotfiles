-- █▀ █▄░█ ▄▀█ █▀▀ █▄▀ █▀ ░░▄▀ █▀█ █ █▀▀ █▄▀ █▀▀ █▀█
-- ▄█ █░▀█ █▀█ █▄▄ █░█ ▄█ ▄▀░░ █▀▀ █ █▄▄ █░█ ██▄ █▀▄

---@type snacks.picker.Config
local M = {
  prompt = "   ",
  layout = "default_layout",
  ---@type table<string, snacks.picker.layout.Config>
  layouts = {
    vscode = {
      layout = {
        width = 0.5,
      },
    },
    default_layout = {
      layout = {
        box = "vertical",
        width = 0.9,
        height = 0.9,
        border = "none",
        { win = "input", height = 1, border = "single", title = "Find {title} {live} {flags}", title_pos = "center" },
        {
          box = "horizontal",
          { win = "list", border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" } },
          { win = "preview", border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" }, width = 0.6 },
        },
      },
    },
    vertical_layout = {
      layout = {
        box = "vertical",
        width = 0.8,
        height = 0.9,
        border = "none",
        { win = "input", border = "single", height = 1, title = "Find {title} {live} {flags}", title_pos = "center" },
        { win = "list", border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" }, height = 8 },
        { win = "preview", border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" } },
      },
    },
  },
  sources = {
    buffers = { layout = { preset = "vertical_layout" } },
    explorer = { hidden = true, exclude = { "node_modules", ".tmp", ".cache", "dist", "build" } },
    files = { hidden = true, exclude = { "node_modules", ".tmp", ".cache", "dist", "build" } },
    keymaps = { layout = { preset = "vscode" } },
    notifications = { layout = { preset = "vertical_layout" } },
    recent = { layout = { preset = "vertical_layout" }, title = "Most Recently Used Files" },
  },
}

return M
