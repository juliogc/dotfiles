-- ▀█▀ █▀█ █▀▀ █▀▀ █▀ █ ▀█▀ ▀█▀ █▀▀ █▀█
-- ░█░ █▀▄ ██▄ ██▄ ▄█ █ ░█░ ░█░ ██▄ █▀▄

local ts = require "nvim-treesitter"

ts.setup {
  install_dir = vim.fn.stdpath "data" .. "/site",
}

-- Your language list (keep your existing list)
local langs = {
  "lua",
  "luadoc",
  "printf",
  "vim",
  "vimdoc",
  "python",
  "bash",
  "html",
  "css",
  "scss",
  "javascript",
  "typescript",
  "tsx",
  "svelte",
  "vue",
  "prisma",
  "markdown",
  "markdown_inline",
  "mermaid",
  "yaml",
  "rust",
  "go",
  "gomod",
  "gowork",
  "gosum",
  "norg",
  "latex",
  "typst",
}

ts.install(langs)

-- Enable highlighting via Neovim (new README guidance)
-- This starts treesitter for buffers of those filetypes.
vim.api.nvim_create_autocmd("FileType", {
  pattern = langs,
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
