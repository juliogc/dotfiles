require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<leader>ll", "<cmd> Lazy <cr>", { desc = "Lazy - Open" })
map("n", "<leader>ls", "<cmd> Lazy sync <cr>", { desc = "Lazy - Sync" })
map("n", "<leader>lx", "<cmd> Lazy clean <cr>", { desc = "Lazy - Clean" })
map("n", "<leader>lu", "<cmd> Lazy update <cr>", { desc = "Lazy - Update" })

map("i", "<Tab>", function()
  local suggestion = require "copilot.suggestion"
  if suggestion.is_visible() then
    suggestion.accept()
  else
    -- fallback: use regular <Tab>
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", true)
  end
end, { desc = "Accept Copilot suggestion or fallback to Tab" })
