-- █▀▄▀█ ▄▀█ █▀ █▀█ █▄░█ ▄▄ █░░ █▀ █▀█ █▀▀ █▀█ █▄░█ █▀▀ █ █▀▀
-- █░▀░█ █▀█ ▄█ █▄█ █░▀█ ░░ █▄▄ ▄█ █▀▀ █▄▄ █▄█ █░▀█ █▀░ █ █▄█

local servers = require "configs.lspconfig.servers"

local M = {
  ensure_installed = vim.list_extend(vim.tbl_keys(servers), {
    "stylua",
    "ltex_plus",
    -- "prettierd",
    -- "goimports",
    -- "clang-format",
    -- "shfmt",
  }),
}

return M
