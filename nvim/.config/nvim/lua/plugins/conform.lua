return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            -- Customize or remove this keymap to your liking
            "gq",
            function()
                require("conform").format({ async = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    -- This will provide type hinting with LuaLS
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
        -- Define your formatters
        formatters_by_ft = {
            fish = { "fish_indent" },
            sh = { "shfmt" },
            lua = { "stylua" },
            javascript = { "prettierd", "prettier", stop_after_first = true },
            c = { "clangd-format" },
            cpp = { "clangd-format" },
        },
        -- Set default options
        default_format_opts = {
            lsp_format = "fallback",
        },
        -- Set up format-on-save
        format_on_save = { timeout_ms = 500 },
        -- Customize formatters
        formatters = {
            shfmt = {
                prepend_args = { "-i", "4" },
            },
            c = {
                prepend_args = { "--style=file" },
            }
        },
    },
    init = function()
        -- If you want the formatexpr, here is the place to set it
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
