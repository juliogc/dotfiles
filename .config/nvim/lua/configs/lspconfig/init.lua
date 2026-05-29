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
    lsp.on_attach(nil, args.buf)
  end,
})

vim.lsp.config("*", { capabilities = lsp.capabilities, on_init = lsp.on_init })
for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
end

vim.lsp.enable(vim.tbl_keys(servers))

vim.api.nvim_create_user_command("LspRestart", function()
  local clients = vim.lsp.get_clients { bufnr = 0 }
  local bufs = {}
  for _, client in ipairs(clients) do
    for buf in pairs(client.attached_buffers) do
      bufs[buf] = true
    end
    client:stop()
  end
  vim.defer_fn(function()
    for buf in pairs(bufs) do
      if vim.api.nvim_buf_is_valid(buf) then
        vim.api.nvim_exec_autocmds("FileType", { buffer = buf })
      end
    end
  end, 500)
end, { desc = "Restart LSP clients for current buffer" })
