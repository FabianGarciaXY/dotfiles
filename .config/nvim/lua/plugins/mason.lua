
-- Mason Setup
local mason = require('config.utils').get_package('mason')
local mason_lspconfig = require('config.utils').get_package('mason-lspconfig')

if mason and mason_lspconfig then
	mason.setup()

	mason_lspconfig.setup({
		ensure_installed = { 'lua_ls', 'pyright', 'npm-groovy-lint' },
		automatic_installation = true ,
	})
end
