-- █▀▀ █▀█ █▀▄ █▀▀ █▀▀ █▀█ █▀▄▀█ █▀█ ▄▀█ █▄░█ █ █▀█ █▄░█
-- █▄▄ █▄█ █▄▀ ██▄ █▄▄ █▄█ █░▀░█ █▀▀ █▀█ █░▀█ █ █▄█ █░▀█

local ok, codecompanion = pcall(require, "codecompanion")

if not ok then
  return
end

codecompanion.setup {
  opts = {
    log_level = "DEBUG",
  },
  display = {
    diff = {
      enabled = true,
    },
  },
  strategies = {
    chat = {
      adapter = "copilot",
    },
    inline = {
      adapter = "copilot",
    },
    agent = {
      adapter = "copilot",
    },
  },
  adapters = {
    http = {
      copilot = function()
        return require("codecompanion.adapters").extend("copilot", {
          schema = {
            model = {
              -- default = "gpt-5",
              default = "claude-sonnet-4",
            },
          },
        })
      end,
      tavily = function()
        return require("codecompanion.adapters").extend("tavily", {
          env = {
            api_key = "cmd:op read op://Personal/tavily.com/nvim --no-newline",
          },
        })
      end,
    },
  },
  extensions = {
    mcphub = {
      callback = "mcphub.extensions.codecompanion",
      opts = {
        make_tools = true, -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
        show_server_tools_in_chat = true, -- Show individual tools in chat completion (when make_tools=true)
        add_mcp_prefix_to_tool_names = false, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
        show_result_in_chat = true, -- Show tool results directly in chat buffer
        format_tool = nil, -- function(tool_name:string, tool: CodeCompanion.Agent.Tool) : string Function to format tool names to show in the chat buffer
        make_vars = true, -- Convert MCP resources to #variables for prompts
        make_slash_commands = true, -- Add MCP prompts as /slash commands
      },
    },
    history = {
      enabled = true,
    },
  },
}
