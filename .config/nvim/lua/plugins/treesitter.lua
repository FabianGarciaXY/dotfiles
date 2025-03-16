
local M = {}

-- Load Treesitter configurations
function M.config() 
	local configs = require('config.utils').get_package('nvim-treesitter.configs')

	configs.setup {
        ensure_installed = { 'lua', 'markdown', 'markdown_inline', 'bash', 'python', 'dhall', 'sql' },
        ignore_install = { '' },
        sync_install = false,
        highlight = {
            enable = true,
            disable = { 'css' },
        },
        autopairs = {
            enable = true,
        },
        indent = {
            enable = true,
            disable = { 'css' }
        },
        context_commentstring = {
            enable = true,
            enable_autocmd = false,
        },
    }
end

return M

