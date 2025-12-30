-- █▀▄▀█ ▄▀█ █▀█ █▀█ █ █▄░█ █▀▀ █▀
-- █░▀░█ █▀█ █▀▀ █▀▀ █ █░▀█ █▄█ ▄█

local map = vim.keymap.set

-- General
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("n", "<leader>x", function()
  require("utils.buffer").close_buffer()
end, { desc = "barbar close buffer" })

-- highlight
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

-- file management
map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

-- comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- line numbers
map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })

-- Insert
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- Window
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
map({ "n", "t" }, "<A-i>", function()
  Snacks.terminal()
end, { desc = "terminal toggle floating term" })

--barbar
map("n", "<Tab>", "<cmd>BufferNext<CR>", { desc = "barbar next buffer" })
map("n", "<S-Tab>", "<cmd>BufferPrev<CR>", { desc = "barbar previous buffer" })
map("n", "<C-S-b>", "<cmd>BufferMoveNext<CR>", { desc = "barbar move forward" })
map("n", "<C-S-f>", "<cmd>BufferMovePrevious<CR>", { desc = "barbar move backward" })
-- map("n", "<leader>x", "<Cmd>BufferClose<CR>", { desc = "barbar close buffer" })
map("n", "<leader>br", "<Cmd>BufferRestore<CR>", { desc = "barbar restore buffer" })
map("n", "<leader>bp", "<Cmd>BufferPin<CR>", { desc = "barbar pin buffer" })
map("n", "<leader>bb", "<Cmd>BufferOrderByBufferNumber<CR>", { desc = "barbar order by buffer number" })
map("n", "<leader>bn", "<Cmd>BufferOrderByName<CR>", { desc = "barbar order by name" })
map("n", "<leader>bd", "<Cmd>BufferOrderByDirectory<CR>", { desc = "barbar order by directory" })
map("n", "<leader>bl", "<Cmd>BufferOrderByLanguage<CR>", { desc = "barbar order by language" })

--dropbar
local dropbar_api = require "dropbar.api"
map("n", "<leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
map("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
map("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
map("n", "<leader>df", dropbar_api.fuzzy_find_toggle, { desc = "dropbar fuzzy find" })

map("n", "<leader>lr", "<Cmd>LspRestart<CR>", { desc = "lsp restart" })

-- conform
map({ "n", "x" }, "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "general format file" })

-- Lazy
map("n", "<leader>ll", "<cmd> Lazy <cr>", { desc = "lazy open" })
map("n", "<leader>ls", "<cmd> Lazy sync <cr>", { desc = "lazy sync" })
map("n", "<leader>lx", "<cmd> Lazy clean <cr>", { desc = "lazy clean" })
map("n", "<leader>lu", "<cmd> Lazy update <cr>", { desc = "lazy update" })

-- whichkey
map("n", "<leader>wk", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })
map("n", "<leader>wK", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })

-- copilot + blink.cmp
map("i", "<Tab>", function()
  local ok, suggestion = pcall(require, "copilot.suggestion")
  if ok and suggestion.is_visible() then
    suggestion.accept()
  else
    -- fallback: use regular <Tab>
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", true)
  end
end, { desc = "Accept Copilot suggestion or fallback to Tab" })

-- codecompanion
map("n", "<leader>ca", "<cmd> CodeCompanionActions <cr>", { desc = "CodeCompanion - Actions" })
map("n", "<leader>cc", "<cmd> CodeCompanionChat Toggle <cr>", { desc = "CodeCompanion - Toggle chat" })
map("n", "<leader>cch", "<cmd> CodeCompanionHistory <cr>", { desc = "CodeCompanion - Chat history" })

-- colorizer
map("n", "<leader>bc", "<cmd>ColorizerAttachToBuffer<cr>", { desc = "Colorizer attach to buffer" })
