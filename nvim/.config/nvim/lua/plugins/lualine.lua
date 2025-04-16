return {
    'nvim-lualine/lualine.nvim',
    dependencies = { { 'kyazdani42/nvim-web-devicons', 'Mofiqul/dracula.nvim' } },
    config = function()
        require("lualine").setup({
            options = {
                theme = 'dracula'
            },
            sections = {
                lualine_c = { { 'filename', path = 1, shorting_target = 0 }, "require'lsp-status'.status()" },
                lualine_x = {}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { { 'filename', path = 1, shorting_target = 0 } },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {
                lualine_b = { { 'filename', path = 1, shorting_target = 0 } },
                lualine_c = {},
                lualine_x = {
                    { 'encoding' },
                    {
                        'fileformat',
                        icons_enabled = true,
                        symbols = {
                            unix = ' LF', -- e712
                            dos = ' CRLF', -- e70f
                            mac = ' CR', -- e711
                        },
                    },
                    { 'filetype' }
                },
                lualine_y = {},
                lualine_z = { 'tabs' }
            }
        })
    end
}
