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
    dependencies = { 'OXY2DEV/markview.nvim' },
    lazy = false,
    opts = require "configs.treesitter",
  },

  { import = "nvchad.blink.lazyspec" },

  {
    "saghen/blink.cmp",
    import = "nvchad.blink.lazyspec",
    dependencies = { "giuxtaposition/blink-cmp-copilot" },
    opts = require "configs.blink",
  },

  {
    "OXY2DEV/markview.nvim",
    dependencies = {
      "saghen/blink.cmp",
    },
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    -- event = "BufReadPost",
    opts = require "configs.copilot",
  },
}
