local ok, codecompanion = pcall(require, "codecompanion")

if not ok then
  return
end

codecompanion.setup {
  opts = {
    log_level = "DEBUG", -- or "TRACE"
  },
  display = {
    diff = {
      enabled = true,
    },
  },
}
