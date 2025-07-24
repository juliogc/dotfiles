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

  { import = "nvchad.blink.lazyspec" },

  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = { "giuxtaposition/blink-cmp-copilot" },
    opts = require "configs.blink",
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
      "zbirenbaum/copilot.lua",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    cmd = {
      "CodeCompanion",
      "CodeCompanionActions",
      "CodeCompanionChat",
    },
    lazy = false,
    opt = true,
  },

  { "b0o/schemastore.nvim" },

  { "aznhe21/actions-preview.nvim" },
}
