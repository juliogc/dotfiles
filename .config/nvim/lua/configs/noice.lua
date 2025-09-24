local M = {}

M.setup = function()
  require("notify").setup({
    background_colour = "#000000",
  })
  
  require("noice").setup({})
end

return M
