return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {},
    config = function()
        require("fzf-lua").setup({
            "hide",
            win_options = {
                preview = {
                    default = "bat",
                },
            },
            git = {
                file_icons = true,
            },
            files = {
                case_mode = "smart"
            }
        })
    end
}
