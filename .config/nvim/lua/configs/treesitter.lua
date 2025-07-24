local M = require "nvchad.configs.treesitter"

local parsers = {
  "bash",
  "html",
  "css",
  "javascript",
  "typescript",
  "prisma",
  "markdown",
  "markdown_inline",
  "yaml",
}

if vim.fn.executable "tree-sitter" == 1 then
  vim.list_extend(parsers, {
    "latex",
    "typst",
  })
end

vim.list_extend(M.ensure_installed, parsers)

return M
