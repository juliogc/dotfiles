-- █░█ ▀█▀ █ █░░ █▀ ░░▄▀ █▄▄ █░█ █▀▀ █▀▀ █▀▀ █▀█
-- █▄█ ░█░ █ █▄▄ ▄█ ▄▀░░ █▄█ █▄█ █▀░ █▀░ ██▄ █▀▄

local api = vim.api
local cur_buf = api.nvim_get_current_buf

local M = {}

M.close_buffer = function(bufnr)
  bufnr = bufnr or cur_buf()

  if vim.bo[bufnr].buftype == "terminal" then
    if vim.bo[bufnr].buflisted then
      vim.cmd "set nobl | enew"
    else
      vim.cmd "hide"
    end
    return
  end

  if api.nvim_win_get_config(0).zindex then
    vim.cmd("bw " .. bufnr)
    return
  end

  if vim.bo[bufnr].modified then
    local choice = vim.fn.confirm("Save changes to " .. vim.fn.bufname(bufnr) .. "?", "&Yes\n&No\n&Cancel", 1)

    if choice == 1 then
      vim.cmd "write"
      vim.cmd "BufferClose"
    elseif choice == 2 then
      vim.bo[bufnr].modified = false
      vim.cmd "BufferClose"
    end
    return
  end

  vim.cmd "BufferClose"
end

return M
