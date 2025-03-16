
-- Ensure Packer is loaded before configuring plugins
local packer = require('config.utils').get_package('packer')

packer.use({                                         -- Fuzzy finder 
	'junegunn/fzf',
	run = function()
		vim.fn['fzf#install']()
	end,
})
