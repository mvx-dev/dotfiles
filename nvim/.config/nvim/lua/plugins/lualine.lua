vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" })

require("lualine").setup({
	options = {
		theme = "auto",
		globalstatus = true,
		component_separators = "",
		section_separators = "",
		disabled_filetypes = { statusline = { "NvimTree", "neo-tree" } },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			{
				"diff",
				symbols = { added = "+", modified = "~", removed = "-" },
			},
		},
		lualine_c = {
			{ "filename", path = 1 },
			{
				"aerial",
				sep = " > ",
				depth = nil,
				dense = false,
				colored = false,
			},
		},
		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = "E:", warn = "W:", info = "I:", hint = "H:" },
				"filetype",
			},
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_c = { { "filename", path = 1 } },
		lualine_x = { "location" },
	},
})
