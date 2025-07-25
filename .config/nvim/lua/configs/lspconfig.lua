local nvconfig = require "nvchad.configs.lspconfig"
local schemastore = require "schemastore"

nvconfig.defaults()

local servers = {
  html = {},
  cssls = {},
  jsonls = {
    settings = {
      json = {
        schemas = schemastore.json.schemas(),
        validate = { enable = true },
      },
    },
  },
  yamlls = {
    settings = {
      yaml = {
        schemaStore = { enable = false, url = "" },
        schemas = schemastore.yaml.schemas(),
      },
    },
  },
  ts_ls = {
    init_options = {
      preferences = {
        disableSuggestions = true,
      },
    },
  },
  eslint = {},
  prismals = {},
  dockerls = {
    settings = {
      docker = {
        languageserver = {
          formatter = {
            ignoreMultilineInstructions = true,
          },
        },
      },
    },
  },
  docker_compose_language_service = {},
}

vim.lsp.enable(vim.tbl_keys(servers))

for name, opts in pairs(servers) do
  vim.lsp.config(name, vim.tbl_deep_extend("force", {
    on_attach = nvconfig.on_attach,
    capabilities = nvconfig.capabilities,
  }, opts))
end

-- -- read :h vim.lsp.config for changing options of lsp servers
