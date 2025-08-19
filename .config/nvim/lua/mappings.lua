-- █▀▄▀█ ▄▀█ █▀█ █▀█ █ █▄░█ █▀▀ █▀
-- █░▀░█ █▀█ █▀▀ █▀▀ █ █░▀█ █▄█ ▄█

require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- LSP
map("n", "<leader>lr", "<cmd> LspRestart <cr>", { desc = "LSP Restart" })

-- Lazy
map("n", "<leader>ll", "<cmd> Lazy <cr>", { desc = "lazy open" })
map("n", "<leader>ls", "<cmd> Lazy sync <cr>", { desc = "lazy sync" })
map("n", "<leader>lx", "<cmd> Lazy clean <cr>", { desc = "lazy clean" })
map("n", "<leader>lu", "<cmd> Lazy update <cr>", { desc = "lazy update" })

-- CodeCompanion
map("n", "<leader>ca", "<cmd> CodeCompanionActions <cr>", { desc = "CodeCompanion - Actions" })
map("n", "<leader>cc", "<cmd> CodeCompanionChat Toggle <cr>", { desc = "CodeCompanion - Toggle chat" })
map("n", "<leader>ch", "<cmd> CodeCompanionHistory <cr>", { desc = "CodeCompanion - Chat history" })

-- Telescope
map("n", "grr", require("telescope.builtin").lsp_references, { desc = "telescope lsp references" })
map("n", "<leader>ch", require("telescope.builtin").command_history, { desc = "telescope workspace symbols" })
map("n", "<leader>fs", require("telescope.builtin").lsp_workspace_symbols, { desc = "telescope workspace symbols" })
map("n", "<leader>ft", require("telescope.builtin").treesitter, { desc = "telescope treesitter" })
-- map({ "v", "n" }, "gra", require("actions-preview").code_actions, { desc = "LSP Code Actions" })

map({ "v", "n" }, "gra", function()
  local ok, actions_preview = pcall(require, "actions-preview")
  if ok then
    actions_preview.code_actions()
  end
end, { desc = "LSP Code Actions" })

map("i", "<Tab>", function()
  local ok, suggestion = pcall(require, "copilot.suggestion")
  if ok and suggestion.is_visible() then
    suggestion.accept()
  else
    -- fallback: use regular <Tab>
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", true)
  end
end, { desc = "Accept Copilot suggestion or fallback to Tab" })
