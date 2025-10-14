return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {},
	config = function()
		require("toggleterm").setup()
		vim.keymap.set({ "n", "t" }, "<C-/>", "<cmd>ToggleTerm<cr>", { desc = "Show/Hide Terminal" })
	end,
}
