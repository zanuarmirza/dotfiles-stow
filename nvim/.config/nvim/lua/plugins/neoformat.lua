return {
    'sbdchd/neoformat',
    config = function()
        vim.g.neoformat_try_node_exe = 1
        vim.g.neoformat_verbose = 0
        vim.g.neoformat_enabled_javascript = { 'prettier', 'biome' }
        vim.g.neoformat_enabled_javascriptreact = { 'prettier', 'biome' }
        vim.g.neoformat_enabled_typescript = { 'prettier', 'biome' }
        vim.g.neoformat_enabled_typescriptreact = { 'prettier', 'biome' }
        vim.g.neoformat_enabled_json = { 'prettier', 'biome' }
    end
}
