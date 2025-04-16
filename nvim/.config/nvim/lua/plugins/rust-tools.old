local lsp_zero = require('lsp-zero')

local lsp_status = require('lsp-status')

local capabilities = vim.tbl_extend('keep', lsp_zero.get_capabilities() or {}, lsp_status.capabilities)
vim.g.rustaceanvim = {
    inlay_hints = {
        highlight = "NonText",
    },
    tools = {
        -- hover_actions = {
        --     auto_focus = true,
        -- },
    },
    -- LSP configuration
    server = {
        -- on_attach = function(client, bufnr)
        --     require("lsp-inlayhints").on_attach(client, bufnr)
        -- end,
        on_attach = lsp_zero.on_attach,
        capabilities = capabilities,
        default_settings = {
            -- rust-analyzer language server configuration
            ['rust-analyzer'] = {
                procMacro = {
                    ignored = {
                        leptos_macro = {
                            -- optional: --
                            -- "component",
                            "server",
                        },
                    },
                },
            },
        },
    },
    -- DAP configuration
    dap = {
    },
}
