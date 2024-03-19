return {
	"numToStr/Comment.nvim",
	lazy = false,
	opts = {},
	config = function()
		require("Comment").setup({
			toggler = {
				line = "<C-/>",
			},
		})
	end,
}
