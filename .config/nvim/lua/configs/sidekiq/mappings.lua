-- █▀ █ █▀▄ █▀▀ █▄▀ █ █▀█ ░░▄▀ █▀▄▀█ ▄▀█ █▀█ █▀█ █ █▄░█ █▀▀ █▀
-- ▄█ █ █▄▀ ██▄ █░█ █ ▀▀█ ▄▀░░ █░▀░█ █▀█ █▀▀ █▀▀ █ █░▀█ █▄█ ▄█

return {
  {
    "<tab>",
    function()
      if not require("sidekick").nes_jump_or_apply() then
        vim.cmd "BufferNext"
      end
    end,
    desc = "NES or next buffer",
  },
  {
    "<leader>aa",
    function()
      require("sidekick.cli").toggle("claude")
    end,
    desc = "Sidekick Toggle CLI",
    mode = { "n", "t", "i", "x" },
  },
  {
    "<leader>as",
    function()
      require("sidekick.cli").select()
    end,
    desc = "Sidekick Select Tool",
  },
  {
    "<leader>ap",
    function()
      require("sidekick.cli").prompt()
    end,
    desc = "Sidekick Select Prompt",
  },
  {
    "<leader>af",
    function()
      require("sidekick.cli").send { msg = "{file}" }
    end,
    desc = "Sidekick Send file",
  },
  {
    "<leader>at",
    function()
      require("sidekick.cli").send { msg = "{this}" }
    end,
    mode = { "n", "v" },
    desc = "Sidekick Send context",
  },
  {
    "<leader>av",
    function()
      require("sidekick.cli").send { msg = "{selection}" }
    end,
    mode = "v",
    desc = "Sidekick Send selection",
  },
}
