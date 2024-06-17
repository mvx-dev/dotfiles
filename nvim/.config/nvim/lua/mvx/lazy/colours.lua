function ColourMyPencils(colour)
    colour = colour or "catppuccin"
    vim.cmd.colorscheme(colour)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

return {
    {
        "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup({
                style = "storm",
                transparent = true,
                terminal_colors = true,
                styles = {
                    comments = { italic = true},
                    keywords = { italic = false},

                    sidebars = "dark",
                    floats = "dark",
                },
            })
        end
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                disable_background = true,
            })

        end
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",

                transparent_background = true,
                term_colors = true,

                styles = {
                    comments = {"italic"},
                    conditionals = {},
                }
            })

            vim.cmd.colorscheme("catppuccin")

            ColourMyPencils()
        end
    }
}


