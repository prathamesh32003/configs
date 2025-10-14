return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependancies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {},
	config = function()
		require("bufferline").setup()
		vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Go to Previous Buffer" })
		vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Go to Previous Buffer" })
	end,
}
