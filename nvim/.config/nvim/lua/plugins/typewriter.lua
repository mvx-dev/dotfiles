vim.pack.add({ "https://github.com/joshuadanpeterson/typewriter.nvim" })

require("typewriter").setup({
	enable_horizontal_scroll = false,
	always_center = true,
	always_center_filetypes = { "tex", "markdown" },
	keep_cursor_position = true,
	enable_notifications = false,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "tex", "markdown" },
	callback = function()
		vim.cmd("TWEnable")
	end,
})
