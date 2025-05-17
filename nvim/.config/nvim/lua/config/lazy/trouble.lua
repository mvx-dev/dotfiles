return {
    {
        "folke/trouble.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("trouble").setup({
                modes = {
                    preview_float = {
                        mode = "diagnostics",
                        preview = {
                            type = "float",
                            relative = "editor",
                            border = "rounded",
                            title = "Preview",
                            title_pos = "center",
                            position = { 0, -2 },
                            size = { width = 0.3, height = 0.3 },
                            zindex = 200,
                        },
                    },
                },
            })

            vim.keymap.set("n", "<leader>tt", function()
                require("trouble").toggle("diagnostics")
            end)

            vim.keymap.set("n", "[t", function()
                require("trouble").next({skip_groups = true, jump = true});
            end)

            vim.keymap.set("n", "]t", function()
                require("trouble").previous({skip_groups = true, jump = true});
            end)

        end
    },
}
