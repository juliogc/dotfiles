-- ▄▀█ █░█ ▀█▀ █▀█ █▀▀ █▀▄▀█ █▀▄ █▀
-- █▀█ █▄█ ░█░ █▄█ █▄▄ █░▀░█ █▄▀ ▄█

local autocmd = vim.api.nvim_create_autocmd

-- Kill all terminal buffers when exiting Neovim
autocmd("QuitPre", {
  callback = function()
    -- Only kill terminals if we're closing the last window
    local windows = vim.api.nvim_list_wins()
    local normal_wins = vim.tbl_filter(function(win)
      local config = vim.api.nvim_win_get_config(win)
      return config.relative == "" -- only count normal windows, not floating
    end, windows)

    -- If this is the last normal window, kill all terminal buffers
    if #normal_wins <= 1 then
      for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].buftype == "terminal" then
          vim.api.nvim_buf_delete(bufnr, { force = true })
        end
      end
    end
  end,
})
