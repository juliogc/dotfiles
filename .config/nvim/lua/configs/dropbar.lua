-- █▀▄ █▀█ █▀█ █▀█ █▄▄ ▄▀█ █▀█
-- █▄▀ █▀▄ █▄█ █▀▀ █▄█ █▀█ █▀▄

local M = {}

M.config = function()
  local default_opts = require("dropbar.configs").opts

  default_opts.bar.enable = function(buf, win, _)
    if
      not vim.api.nvim_buf_is_valid(buf)
      or not vim.api.nvim_win_is_valid(win)
      or vim.fn.win_gettype(win) ~= ""
      or vim.bo[buf].ft == "help"
    then
      return false
    end

    local stat = vim.uv.fs_stat(vim.api.nvim_buf_get_name(buf))
    if stat and stat.size > 1024 * 1024 then
      return false
    end

    return vim.bo[buf].ft == "markdown"
      or vim.bo[buf].ft == "text"
      or vim.bo[buf].bt == ""
      or vim.bo[buf].bt == "terminal"
      or pcall(vim.treesitter.get_parser, buf)
      or not vim.tbl_isempty(vim.lsp.get_clients {
        bufnr = buf,
        method = vim.lsp.protocol.Methods.textDocument_documentSymbol,
      })
  end

  default_opts.bar.update_debounce = 100

  -- Customize the separator icon
  default_opts.icons = default_opts.icons or {}
  default_opts.icons.ui = default_opts.icons.ui or {}
  default_opts.icons.ui.bar = default_opts.icons.ui.bar or {}
  default_opts.icons.ui.bar.separator = " » "

  default_opts.bar.sources = function(buf, _)
    local sources = require "dropbar.sources"
    local utils = require "dropbar.utils"

    if vim.bo[buf].ft == "markdown" then
      return { sources.path, sources.markdown }
    end

    if vim.bo[buf].buftype == "terminal" then
      return { sources.terminal }
    end

    return {
      sources.path,
      utils.source.fallback {
        sources.lsp,
        sources.treesitter,
      },
    }
  end

  require("dropbar").setup(default_opts)

  local api = require "dropbar.api"

  -- Main navigation keybindings
  vim.keymap.set("n", "<Leader>;", api.pick, { desc = "dropbar pick symbols" })
  vim.keymap.set("n", "[;", api.goto_context_start, { desc = "dropbar go to start of current context" })
  vim.keymap.set("n", "];", api.select_next_context, { desc = "dropbar select next context" })

  -- Additional navigation keybindings
  -- vim.keymap.set("n", "<Leader>db", api.get_current_dropbar, { desc = "Get current dropbar" })
  -- vim.keymap.set("n", "<Leader>dm", api.get_current_dropbar_menu, { desc = "Get current dropbar menu" })

  -- Fuzzy find keybindings (useful when dropbar menu is open)
  vim.keymap.set("n", "<Leader>df", api.fuzzy_find_toggle, { desc = "dropbar fuzzy find" })
  -- vim.keymap.set("n", "<Leader>dn", api.fuzzy_find_next, { desc = "Next fuzzy find result" })
  -- vim.keymap.set("n", "<Leader>dp", api.fuzzy_find_prev, { desc = "Previous fuzzy find result" })
end

return M
