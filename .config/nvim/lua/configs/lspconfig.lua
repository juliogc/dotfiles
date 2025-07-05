local nvconfig = require("nvchad.configs.lspconfig")
local lspconfig = require("lspconfig")

local servers = {
  "html",
  "cssls",
  "ts_ls",
  "eslint"
}

nvconfig.defaults()
vim.lsp.enable(servers)


lspconfig.ts_ls.setup({
  on_attach = nvconfig.on_attach,
  capabilities = nvconfig.capabilties,
  init_options = {
    preferences = {
      disableSuggestions = true,
    }
  }
})

lspconfig.eslint.setup({})

-- read :h vim.lsp.config for changing options of lsp servers 
