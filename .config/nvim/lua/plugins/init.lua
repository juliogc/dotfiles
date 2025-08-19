-- █▀█ █░░ █░█ █▀▀ █ █▄░█ █▀
-- █▀▀ █▄▄ █▄█ █▄█ █ █░▀█ ▄█

return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "OXY2DEV/markview.nvim" },
    lazy = false,
    opts = require "configs.treesitter",
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = require "configs.nvimtree",
  },

  { import = "nvchad.blink.lazyspec" },

  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = { "giuxtaposition/blink-cmp-copilot" },
    opts = require "configs.blink",
  },

  {
    "Bekaboo/dropbar.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    event = { "BufReadPost", "BufNewFile" },
    config = require("configs.dropbar").config,
  },

  {
    "OXY2DEV/markview.nvim",
    dependencies = {
      "saghen/blink.cmp",
    },
    opts = require "configs.markview",
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    -- event = "BufReadPost",
    opts = require "configs.copilot",
  },

  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/codecompanion-history.nvim",
    },
    cmd = {
      "CodeCompanion",
      "CodeCompanionActions",
      "CodeCompanionChat",
    },
    lazy = false,
    config = function()
      require "configs.codecompanion"
    end,
  },

  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = "npm install -g mcp-hub@latest",
    config = require("configs.mcphub").setup,
  },

  { "b0o/schemastore.nvim" },

  { "aznhe21/actions-preview.nvim" },

  { "echasnovski/mini.diff", version = "*" },
}
