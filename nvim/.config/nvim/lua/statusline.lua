_G.context = function()
    local treesitter = require("nvim-treesitter")

    if not vim.b.treesitter then
        return ""
    end
    local ctx = treesitter.statusline({
        type_patterns = {"class", "function", "method", "type_spec", "struct", "impl_item"},
        separator == "/"
    })
    return ctx and ("/" .. ctx) or ""
end

vim.opt.statusline = " %<%f%=%l,%c%V %P %{v:lua.context()}"
