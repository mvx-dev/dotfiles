local group = vim.api.nvim_create_augroup("mvxgroup", { clear = true })

-- Pad the bottom of the screen so the cursor remains centered
vim.api.nvim_create_autocmd("CursorMoved", {
    group = "mvxgroup",
    pattern = "*",
    command = "exec 'norm zz'"
})
