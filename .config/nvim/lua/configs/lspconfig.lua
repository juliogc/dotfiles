local nvconfig = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

local servers = {
  "html",
  "cssls",
  "jsonls",
  "ts_ls",
  "eslint",
  "prismals",
  "docker_compose_language_service",
  "dockerls",
}

nvconfig.defaults()
vim.lsp.enable(servers)

vim.lsp.config("jsonls", {
  capabilities = nvconfig.capabilities,
})

vim.lsp.config("html", {
  capabilities = nvconfig.capabilities,
})

vim.lsp.config("cssls", {
  capabilities = nvconfig.capabilities,
})

lspconfig.ts_ls.setup {
  on_attach = nvconfig.on_attach,
  capabilities = nvconfig.capabilties,
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
  },
}

lspconfig.eslint.setup {}

vim.lsp.config("dockerls", {
  settings = {
    docker = {
      languageserver = {
        formatter = {
          ignoreMultilineInstructions = true,
        },
      },
    },
  },
})

-- read :h vim.lsp.config for changing options of lsp servers
