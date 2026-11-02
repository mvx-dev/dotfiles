vim.pack.add({ { src = "https://github.com/nvim-treesitter/nvim-treesitter" } })

require("nvim-treesitter").install({
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
	"ron",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "ron" },
	callback = function()
		vim.treesitter.start()
	end,
})
