-- █▀▀ █▀█ █▄░█ █▀▀ █▀█ █▀█ █▀▄▀█
-- █▄▄ █▄█ █░▀█ █▀░ █▄█ █▀▄ █░▀░█

---@type conform.setupOpts
local M = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettierd" },
    html = { "prettierd" },
    javascript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
    prisma = { "prismals" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    objc = { "clang-format" },
    objcpp = { "clang-format" },
    cuda = { "clang-format" },
    go = { "goimports" },
    bash = { "shfmt" },
    sh = { "shfmt" },
    zsh = { "shfmt" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return M
