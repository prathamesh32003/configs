return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
	opts = {
		indent = { enable = true },
		highlight = { enable = true },
		folds = { enable = true },
	},
	config = function()
		local TS = require("nvim-treesitter")
		TS.install({ "bash", "lua", "luadoc", "vim", "vimdoc", "java" })
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "bash", "lua", "vim", "java" },
			callback = function()
				vim.treesitter.start()
				vim.wo.foldmethod = "expr"
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.wo.foldlevel = 99
			end,
		})
	end,
}
