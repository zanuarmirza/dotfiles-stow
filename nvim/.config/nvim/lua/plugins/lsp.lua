return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        opts = {},
    },

    {
        "nvim-lua/lsp-status.nvim",
        config = function()
            local lsp_status = require("lsp-status")

            lsp_status.register_progress()
            lsp_status.config({
                indicator_errors = "E",
                indicator_warnings = "W",
                indicator_info = "i",
                indicator_hint = "?",
                indicator_ok = "Ok",
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },              -- Required
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" }, -- Optional
        },
        config = function()
            local lsp_defaults = require('lspconfig').util.default_config

            -- Add cmp_nvim_lsp capabilities settings to lspconfig
            -- This should be executed before you configure any language server
            lsp_defaults.capabilities = vim.tbl_deep_extend(
                'force',
                lsp_defaults.capabilities,
                require('cmp_nvim_lsp').default_capabilities()
            )

            function ToggleInlay()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end

            vim.diagnostic.config({
                virtual_text = true
            })

            function ToggleInlineError()
                vim.diagnostic.config({
                    virtual_text = not vim.diagnostic.config().virtual_text
                })
            end

            vim.api.nvim_create_autocmd("LspAttach", {
                desc = "LSP actions",
                callback = function(event)
                    local opts = { buffer = event.buf, remap = false }
                    local severity_error = { severity = vim.diagnostic.severity.ERROR }
                    vim.keymap.set("n", "gd", function()
                        vim.lsp.buf.definition()
                    end, opts)
                    vim.keymap.set("n", "gc", function()
                        vim.lsp.buf.incoming_calls()
                    end, opts)
                    vim.keymap.set("n", "gi", function()
                        vim.lsp.buf.implementation()
                    end, opts)
                    vim.keymap.set("n", "gr", function()
                        vim.lsp.buf.references()
                    end, opts)
                    vim.keymap.set("n", "gt", function()
                        vim.lsp.buf.type_definition()
                    end, opts)
                    vim.keymap.set("n", "K", function()
                        vim.lsp.buf.hover()
                    end, opts)
                    vim.keymap.set("n", "<leader>vws", function()
                        vim.lsp.buf.workspace_symbol()
                    end, opts)
                    vim.keymap.set("n", "<leader>vf", function()
                        vim.diagnostic.open_float()
                    end, opts)
                    vim.keymap.set("n", "]d", function()
                        vim.diagnostic.goto_next()
                    end, opts)
                    vim.keymap.set("n", "[d", function()
                        vim.diagnostic.goto_prev()
                    end, opts)
                    vim.keymap.set("n", "]e", function()
                        vim.diagnostic.goto_next(severity_error)
                    end, opts)
                    vim.keymap.set("n", "[e", function()
                        vim.diagnostic.goto_prev(severity_error)
                    end, opts)
                    vim.keymap.set("n", "<leader>ca", function()
                        vim.lsp.buf.code_action()
                    end, opts)
                    vim.keymap.set("n", "<leader>rn", function()
                        vim.lsp.buf.rename()
                    end, opts)
                    vim.keymap.set("i", "<C-h>", function()
                        vim.lsp.buf.signature_help()
                    end, opts)
                    vim.keymap.set("n", "ti", ToggleInlay, opts)
                    vim.keymap.set("n", "te", ToggleInlineError, opts)
                    -- The following command requires plug-ins "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", and optionally "kyazdani42/nvim-web-devicons" for icon support
                    vim.api.nvim_set_keymap(
                        "n",
                        "<leader>vd",
                        "<cmd>FzfLua diagnostics_document<CR>",
                        { noremap = true, silent = true }
                    )
                    -- If you don't want to use the telescope plug-in but still want to see all the errors/warnings, comment out the telescope line and uncomment this:

                    vim.api.nvim_set_keymap(
                        "n",
                        "<leader>VD",
                        "<cmd>FzfLua diagnostics_workspace<CR>",
                        { noremap = true, silent = true }
                    )
                    vim.api.nvim_set_keymap(
                        "n",
                        "<leader>VE",
                        "<cmd>lua vim.diagnostic.setqflist({severity=vim.diagnostic.severity.ERROR})<CR>",
                        { noremap = true, silent = true }
                    )
                    vim.api.nvim_set_keymap(
                        "n",
                        "<leader>li",
                        "<cmd>LspEslintFixAll<CR>",
                        { noremap = true, silent = true }
                    )
                end,
            })
            require("mason-lspconfig").setup({
                ensure_installed = { "eslint" },
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({})
                    end,
                },
            })

            -- local ls = require('luasnip')

            -- (Optional) Configure lua language server for neovim
            -- lsp.nvim_workspace()


            vim.lsp.config('ts_ls', {
                on_attach = function(client, bufnr)
                    -- ts_ls provides `source.*` code actions that apply to the whole file. These only appear in
                    -- `vim.lsp.buf.code_action()` if specified in `context.only`.
                    vim.api.nvim_buf_create_user_command(0, 'LspTypescriptSourceAction', function()
                        local source_actions = vim.tbl_filter(function(action)
                            return vim.startswith(action, 'source.')
                        end, client.server_capabilities.codeActionProvider.codeActionKinds)

                        vim.lsp.buf.code_action({
                            context = {
                                only = source_actions,
                            },
                        })
                    end, {})
                    vim.api.nvim_buf_create_user_command(0, 'LspOrganizeImports', function()
                        local params = {
                            command = "_typescript.organizeImports",
                            arguments = { vim.api.nvim_buf_get_name(0) },
                            title = "",
                        }

                        client:request_sync('workspace/executeCommand', params, nil, bufnr)
                    end, {})
                end,
            })
            local function set_filetype(pattern, filetype)
                vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
                    pattern = pattern,
                    command = "set filetype=" .. filetype,
                })
            end

            set_filetype({ "docker-compose.yaml" }, "yaml.docker-compose")
        end,
    }, -- Required
    dependencies = {
        -- Autocompletion
        { "hrsh7th/cmp-buffer" },       -- Optional
        { "hrsh7th/cmp-path" },         -- Optional
        { "saadparwaiz1/cmp_luasnip" }, -- Optional
        { "hrsh7th/cmp-nvim-lua" },     -- Optional

        -- Snippets
        { "rafamadriz/friendly-snippets" }, -- Optional
    },
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        build = "make install_jsregexp"
    },

    {
        "hrsh7th/nvim-cmp",
        event = 'InsertEnter',
        config = function()
            local cmp = require("cmp")
            -- local function luasnip_safe_jump_forward()
            --     if ls.jumpable(1) then
            --         ls.jump(1)
            --     end
            -- end
            -- local function luasnip_safe_jump_backward()
            --     if ls.jumpable(-1) then
            --         ls.jump(-1)
            --     end
            -- end

            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            cmp.setup({
                sources = {
                    { name = "nvim_lsp" },
                    { name = "nvim_lua" },
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    -- ["<Tab>"] = luasnip_safe_jump_forward,
                    -- ["<S-Tab>"] = luasnip_safe_jump_backward,
                }),
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
            })
        end,
    }, -- Required
}
