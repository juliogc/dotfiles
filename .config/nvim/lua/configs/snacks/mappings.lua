-- █▀▄▀█ ▄▀█ █▀█ █▀█ █ █▄░█ █▀▀ █▀
-- █░▀░█ █▀█ █▀▀ █▀▀ █ █░▀█ █▄█ ▄█

---@diagnostic disable: undefined-global
local M = {
  -- Top Pickers & Explorer
  { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
  { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
  { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
  -- find
  { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Find Buffers" },
  { "<leader>fc", function() Snacks.picker.files { cwd = vim.fn.stdpath "config" } end, desc = "Find Config File" },
  { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
  { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
  { "<leader>fp", function() Snacks.picker.projects() end, desc = "Find Projects" },
  { "<leader>fr", function() Snacks.picker.recent() end, desc = "Find Recent" },
    -- git
  { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
  { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
  { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
  { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
  { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
  { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
  { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
  -- Grep
  { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
  { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep In Open Buffers" },
  { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
  { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
  { "<leader>si", function() Snacks.picker.icons() end, desc = "Search Icons" },
  { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Search Keymaps" },
  -- LSP
  { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
  { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
  { "grr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
  { "gri", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
  { "grt", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
  { "gai", function() Snacks.picker.lsp_incoming_calls() end, desc = "C[a]lls Incoming" },
  { "gao", function() Snacks.picker.lsp_outgoing_calls() end, desc = "C[a]lls Outgoing" },
  { "<leader>ss", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
  { "<leader>sS", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
  -- Terminal
  { "<a-i>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
  -- { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
  -- Other
  { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
  { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
  { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
  { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
  { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
  { "<leader>nh",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
  { "<leader>nd", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
  { "<leader>sd", function() Snacks.dashboard() end, desc = "Snacks dashboard" },
  { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
  { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
}

return M
