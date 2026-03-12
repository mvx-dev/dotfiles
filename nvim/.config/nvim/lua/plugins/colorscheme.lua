vim.pack.add({"https://github.com/catppuccin/nvim"})

require("catppuccin").setup({
    flavour = "mocha",
    transparent_background = true,
	on_colors = function(colors)
		colors.bg = "#000000"
	end,
})

