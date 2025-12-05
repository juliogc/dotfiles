-- █▀ █▀▀ █▀█ █░█ █▀▀ █▀█ █▀
-- ▄█ ██▄ █▀▄ ▀▄▀ ██▄ █▀▄ ▄█

local schemastore = require "schemastore"

local servers = {
  bashls = {
    filetypes = { "sh", "bash", "zsh" },
    settings = {
      bashIde = {
        globPattern = "{**/*@(.sh|.inc|.bash|.command|.zsh),**/.*{zshrc,zshenv,bashrc,bash_profile,profile,zprofile}*}",
      },
    },
  },
  clangd = {},
  cssls = {},
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
  eslint = {},
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
  html = {},
  hyprls = {},
  jsonls = {
    settings = {
      json = {
        schemas = schemastore.json.schemas(),
        validate = { enable = true },
      },
    },
  },
  lua_ls = {
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        workspace = {
          library = {
            vim.fn.expand "$VIMRUNTIME/lua",
            vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
            "${3rd}/luv/library",
          },
        },
      },
    },
  },
  prismals = {},
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        diagnostics = {
          enable = false,
        },
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
  yamlls = {
    settings = {
      yaml = {
        schemaStore = { enable = false, url = "" },
        schemas = schemastore.yaml.schemas(),
      },
    },
  },
  ltex_plus = {},
}

return servers

