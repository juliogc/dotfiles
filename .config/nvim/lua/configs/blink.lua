-- █▄▄ █░░ █ █▄░█ █▄▀
-- █▄█ █▄▄ █ █░▀█ █░█

local create_autocmd = vim.api.nvim_create_autocmd

create_autocmd("User", {
  pattern = "BlinkCmpMenuOpen",
  callback = function()
    vim.b.copilot_suggestion_hidden = true
  end,
})

create_autocmd("User", {
  pattern = "BlinkCmpMenuClose",
  callback = function()
    vim.b.copilot_suggestion_hidden = false
  end,
})

local M = {
  appearance = { nerd_font_variant = "normal" },
  completion = {
    documentation = { auto_show = true },
    menu = {
      border = "none",
      draw = {
        padding = 0,
        columns = { { "label" }, { "kind_icon" }, { "kind" } },
        components = {
          kind_icon = {
            text = function(ctx)
              local icons = require "icons"
              local icon = (icons[ctx.kind] or "󰈚")
              return icon
            end,
          },
        },
      },
    },
  },
  cmdline = { enabled = true },

  snippets = { preset = "luasnip" },

  sources = {
    default = { "lsp", "path", "snippets", "buffer", "copilot" },
    providers = {
      copilot = {
        name = "copilot",
        module = "blink-cmp-copilot",
        score_offset = 100,
        async = true,
        transform_items = function(_, items)
          local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
          local kind_idx = #CompletionItemKind + 1
          CompletionItemKind[kind_idx] = "Copilot"
          for _, item in ipairs(items) do
            item.kind = kind_idx
          end
          return items
        end,
      },
    },
  },

  fuzzy = { implementation = "prefer_rust" },

  keymap = {
    preset = "default",
    ["<CR>"] = { "accept", "fallback" },
    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
    ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<C-e>"] = { "hide" },
  },
}

return M
