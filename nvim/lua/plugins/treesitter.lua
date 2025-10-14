return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        treesitter = require("nvim-treesitter")
        treesitter.install({"lua"})
    end
}
