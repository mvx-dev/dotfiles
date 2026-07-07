vim.pack.add({ "https://github.com/stevearc/aerial.nvim" })

require("aerial").setup({
	backends = { "treesitter", "lsp", "markdown", "man" },
	layout = { min_width = 28 },
})
