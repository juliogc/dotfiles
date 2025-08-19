-- ▀█▀ █▀█ █▀▀ █▀▀ █▀ █ ▀█▀ ▀█▀ █▀▀ █▀█
-- ░█░ █▀▄ ██▄ ██▄ ▄█ █ ░█░ ░█░ ██▄ █▀▄

local M = {
  ensure_installed = {
    "bash",
    "html",
    "css",
    "javascript",
    "typescript",
    "prisma",
    "markdown",
    "markdown_inline",
    "yaml",
    "rust",
  }
}

if vim.fn.executable "tree-sitter" == 1 then
  vim.list_extend(M.ensure_installed, {
    "latex",
    "typst",
  })
end

return M
