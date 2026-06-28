vim.pack.add({ "https://github.com/lervag/vimtex" })
vim.g.vimtex_compiler_method = "generic"
vim.g.vimtex_compiler_generic = {
	command = "ls *.tex | entr -n -c tectonic /_ --synctex --keep-logs",
}

vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.vimtex_fold_enabled = 0

vim.g.vimtex_quickfix_ignore_filter = {
	"Underfull \\hbox",
	"Overfull \\hbox",
	"LaTeX Warning: .+ float specifer changed to",
}
