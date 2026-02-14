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
    chat = {
      show_settings = true,
    },
    diff = {
      enabled = true,
    },
  },
  interactions = {
    chat = {
      adapter = "copilot",
      autoload = { "default", "docs", "cursor", "markdown" },
      default_params = "watch",
      enabled = function(chat)
        return chat.adapter.type ~= "acp"
      end,
      slash_commands = {
        ["image"] = {
          opts = {
            dirs = {
              "~/Desktop",
              "~/Documents/images",
              "~/Pictures",
            },
          },
        },
      },
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
              default = "gpt-5.2",
              -- "gpt-5.3-codex", "gpt-5.2-codex"
              -- "gpt-5.1-codex-max", "gpt-5.1-codex-mini", "gpt-5.1-codex"
              -- "gpt-5-codex", "gpt-5.2", "gpt-5.1", "gpt-5"
              -- "gpt-5 mini", "gpt-4.1"
              -- "claude-sonnet-4.5"
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
  rules = {
    default = {
      description = "Collection of common project documentation",
      files = {
        ".clinerules",
        ".cursorrules",
        ".goosehints",
        ".rules",
        ".windsurfrules",
        ".github/copilot-instructions.md",
        "AGENT.md",
        "AGENTS.md",
        { path = "CLAUDE.md", parser = "claude" },
        { path = "CLAUDE.local.md", parser = "claude" },
        { path = "~/.claude/CLAUDE.md", parser = "claude" },
        "README.md",
        "CHANGELOG.md",
        "CONFIGURATION.md",
        "CONTRIBUTING.md",
        "INSTALL.md",
      },
    },
    docs = {
      description = "Project documentation",
      files = {
        "docs/",
        "./docs/",
        "/docs/",
      },
    },
    cursor = {
      description = "Cursor AI project files",
      files = {
        ".cursor/",
        ".cursorrules",
        ".cursor/**/*.md",
      },
    },
    markdown = {
      description = "All markdown files in the project",
      enabled = function()
        local md_files = vim.fn.glob("**/*.md", false, true)
        return #md_files > 0
      end,
      files = {
        "**/*.md",
        "*.md",
      },
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
    spinner = {
      enabled = true,
    },
  },
}
