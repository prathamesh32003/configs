return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,

	config = function()
		vim.keymap.set("n", "<Leader>e", "<Cmd>Neotree toggle<CR>", { desc = "Move focus to the left window" })
	end,
}
