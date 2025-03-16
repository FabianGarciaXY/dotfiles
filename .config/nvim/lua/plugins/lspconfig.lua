
-- LSP Configurations --
local lspconfig = require('config.utils').get_package('lspconfig')

if lspconfig then
	-- Lua
	lspconfig.lua_ls.setup({
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
		on_attach = function(client, bufnr)
			print("Lua LS attached!")
		end,
	})

	lspconfig.pyright.setup{}
	lspconfig.biome.setup{}
	lspconfig.groovy.setup{}

end

