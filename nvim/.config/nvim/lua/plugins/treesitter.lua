return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = vim.fn.argc(-1) == 0,
        init = function(plugin)
            -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
            -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
            -- no longer trigger the **nvim-treesitter** module to be loaded in time.
            -- Luckily, the only things that those plugins need are the custom queries, which we make available
            -- during startup.
            require("lazy.core.loader").add_to_rtp(plugin)
            require("nvim-treesitter.query_predicates")
        end,
        opts_extend = { "ensure_installed" },
        opts = {
            -- a list of parser names, or "all" (the four listed parsers should always be installed)
            -- ensure_installed = { "help", "javascript", "typescript", "c", "lua", "vim", "help" },
            ensure_installed = { "c", "lua", "vim", "query", "javascript", "typescript" },
            -- install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- automatically install missing parsers when entering buffer
            -- recommendation: set to false if you don't have `tree-sitter` cli installed locally
            auto_install = true,

            highlight = {
                enable = true,

                -- setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- using this option may slow down your editor, and you may see some duplicate highlights.
                -- instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
            context_commentstring = {
                enable = true,
                enable_autocmd = false,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn",
                    scope_incremental = "grc",
                    node_incremental = "grn",
                    node_decremental = "grm",
                },
            },
            indent = {
                enable = true,
            },
            autotag = {
                enable = true,
                enable_close_on_slash = false,
            },
            textobjects = {
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        ["]m"] = "@function.outer",
                        ["]]"] = { query = "@class.outer", desc = "Next class start" },
                    },
                    goto_next_end = {
                        ["]M"] = "@function.outer",
                        ["]["] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["[m"] = "@function.outer",
                        ["[["] = "@class.outer",
                    },
                    goto_previous_end = {
                        ["[M"] = "@function.outer",
                        ["[]"] = "@class.outer",
                    },
                },
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = "nvim-treesitter/nvim-treesitter",
    },
    {
        "nvim-treesitter/playground",
        dependencies = "nvim-treesitter/nvim-treesitter",
    },
}
