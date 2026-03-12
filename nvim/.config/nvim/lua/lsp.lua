vim.lsp.config["rust_analyzer"] = {
	on_attach = function(client, bufnr)
		if client:supports_method("textDocument/inlayHint") then
			-- Enable inlay hints for this buffer
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

			-- Force a refresh so any hints already sent by rust-analyzer are drawn
			vim.lsp.buf_request(bufnr, "textDocument/inlayHint/refresh", {}, function() end)
		end
	end,
	cmd = { "rust-analyzer" },
	settings = {
		["rust-analyzer"] = {
			inlayHints = {
				enable = true,
				typeHints = { enable = true },
				parameterHints = { enable = true },
				chainingHints = { enable = true },
			},
		},
	},
}

vim.lsp.enable({
	"lua_ls",
	"clangd",
	"zls",
	"rust_analyzer",
	"ts_ls",
	"bashls",
	"fish_lsp",
	"basedpyright",
	"vscode-css-languageserver",
	"gopls",
	"pyright",
})
vim.cmd("set completeopt+=noselect")

-- lsp specific keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if not client then
			return
		end
		-- if client.server_capabilities.inlayHintProvider then
		-- 	vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
		-- end

		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc })
		end

		map("n", "grd", vim.lsp.buf.definition, "Goto Definition")
		map("n", "grD", vim.lsp.buf.declaration, "Goto Declaration")
		map("n", "gri", vim.lsp.buf.implementation, "Goto Implementation")
		map("n", "grr", vim.lsp.buf.references, "Goto References")
		map("n", "grt", vim.lsp.buf.type_definition, "Goto Type Definition")
		map("n", "grs", vim.lsp.buf.signature_help, "Show Signature")
		map("n", "grn", vim.lsp.buf.rename, "Rename symbol")
		map({ "n", "v" }, "gra", vim.lsp.buf.code_action, "Code Action")
	end,
})
