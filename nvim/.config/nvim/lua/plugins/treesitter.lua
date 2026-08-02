vim.pack.add({ { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" } })

require("nvim-treesitter.config").setup({
	ensure_installed = {
		"rust",
		"c",
		"lua",
		"python",
		"javascript",
		"typescript",
		"html",
		"css",
		"svelte",
		"toml",
		"json",
		"yaml",
		"markdown",
		"gitignore",
		"latex",
		"wgsl",
	},
	auto_install = true,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})
