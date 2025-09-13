-- █░░ █▀ █▀█ █▀▀ █▀█ █▄░█ █▀▀ █ █▀▀
-- █▄▄ ▄█ █▀▀ █▄▄ █▄█ █░▀█ █▀░ █ █▄█

local nvconfig = require "nvchad.configs.lspconfig"
local schemastore = require "schemastore"

nvconfig.defaults()

local servers = {
  bashls = {
    filetypes = { "sh", "bash", "zsh" },
    settings = {
      bashIde = {
        globPattern = "{**/*@(.sh|.inc|.bash|.command|.zsh),**/.*{zshrc,zshenv,bashrc,bash_profile,profile,zprofile}*}",
      },
    },
  },
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
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        diagnostics = {
          enable = false,
        },
      },
    },
  },
  gopls = {
    settings = {
      gopls = {
        gofumpt = true,
        codelenses = {
          gc_details = false,
          generate = true,
          regenerate_cgo = true,
          run_govulncheck = true,
          test = true,
          tidy = true,
          upgrade_dependency = true,
          vendor = true,
        },
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
        analyses = {
          nilness = true,
          unusedparams = true,
          unusedwrite = true,
          useany = true,
        },
        usePlaceholders = true,
        completeUnimported = true,
        staticcheck = true,
        directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
        semanticTokens = true,
      },
    },
  },
  hyprls = {},
  clangd = {},
}

vim.lsp.enable(vim.tbl_keys(servers))

for name, opts in pairs(servers) do
  vim.lsp.config(
    name,
    vim.tbl_deep_extend("force", {
      on_attach = nvconfig.on_attach,
      capabilities = nvconfig.capabilities,
    }, opts)
  )
end

-- -- read :h vim.lsp.config for changing options of lsp servers
