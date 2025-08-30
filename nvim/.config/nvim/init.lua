-- Call Neovim settings
require("config.settings")

-- Call lazy.nvim
require("config.lazy")

-- Call custom keybinds for plugins
require("config.keybinds")

-- Call LSP and related settings
require("config.lsp")

require("notify").setup({
    background_colour = "#000000",
})
