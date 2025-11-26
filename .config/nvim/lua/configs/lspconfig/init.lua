-- █░░ █▀ █▀█ █▀▀ █▀█ █▄░█ █▀▀ █ █▀▀
-- █▄▄ ▄█ █▀▀ █▄▄ █▄█ █░▀█ █▀░ █ █▄█

local lsp = require "configs.lspconfig.lsp"
local servers = require "configs.lspconfig.servers"

local severity = vim.diagnostic.severity

vim.diagnostic.config {
  virtual_text = { prefix = "" },
  signs = {
    text = {
      [severity.ERROR] = "󰅙",
      [severity.WARN] = "",
      [severity.INFO] = "󰋼",
      [severity.HINT] = "󰌵",
    },
  },
  underline = true,
  float = { border = "single" },
}

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    lsp.on_attach(_, args.buf)
  end,
})

vim.lsp.config("*", { capabilities = lsp.capabilities, on_init = lsp.on_init })
for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
end

vim.lsp.enable(vim.tbl_keys(servers))
