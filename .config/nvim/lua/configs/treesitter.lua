-- ▀█▀ █▀█ █▀▀ █▀▀ █▀ █ ▀█▀ ▀█▀ █▀▀ █▀█
-- ░█░ █▀▄ ██▄ ██▄ ▄█ █ ░█░ ░█░ ██▄ █▀▄

local M = {
  ensure_installed = {
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
    -- "svelt",
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
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

if vim.fn.executable "tree-sitter" == 1 then
  vim.list_extend(M.ensure_installed, {
    "latex",
    "typst",
  })
end

return M
