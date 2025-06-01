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
                    cascade = {
                        mode = "diagnostics", -- inherit from diagnostics mode
                        filter = function(items)
                            local severity = vim.diagnostic.severity.HINT
                            for _, item in ipairs(items) do
                                severity = math.min(severity, item.severity)
                            end
                            return vim.tbl_filter(function(item)
                                return item.severity == severity
                            end, items)
                        end,
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
