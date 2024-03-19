return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	opts = {},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true,
					show_hidden_count = true,
					hide_dotfiles = false,
					hide_gitignored = true,
					hide_by_name = {
						-- '.git',
						".DS_Store",
						"thumbs.db",
					},
					never_show = {},
				},
			},
			name = {
				trailing_slash = false,
			},
		})
		vim.keymap.set("n", "<C-b>", ":Neotree filesystem toggle<CR>")
		vim.keymap.set("n", "<F3>", ":Neotree filesystem focus<CR>")
		vim.keymap.set("n", "<leader>gt", ":Neotree reveal_file=%p<CR>")
	end,
}
