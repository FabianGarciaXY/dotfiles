
local M = {}


-- Autocommand that reloads neovim whenever you save the plugins.lua file
M.packer_autoload = function()
	vim.cmd([[
		augroup packer_user_config
			autocmd!
			autocmd BufWritePost plugins.lua source <afile> | PackerSync
		augroup end
	]])
end

-- Treesitter autocommands after packer setup
M.treesitter_autoload = function()
	vim.api.nvim_create_autocmd('User', {
		pattern = 'PackerComplete',
		callback = function()
			print('INFO: Configuring Treesitter after Packer installation...')
			require('plugins.treesitter').config()
		end,
	})
end

-- Fern autocommand after packer setup 
M.fern_setup = function()
	vim.api.nvim_create_augroup('FernGroup', { clear = true })	

	vim.api.nvim_create_autocmd('User', {
		pattern = 'PackerComplete',
		callback = function()
			print('INFO: Setting up fern configuring after Packer installation...')
			vim.opt_local.number = false            -- Disable absolute line numbers in explorer
			vim.opt_local.relativenumber = false	-- Disable relative line numbers in	explorer
			vim.opt_local.bufhidden = 'wipe'
			vim.g['fern#renderer'] = 'nerdfont'
			vim.api.nvim_set_hl(0, 'FernRootSymbol', { fg = '#ffaa00', bold = true })
		end,
	})
end

-- Fern autocommand each refresh
M.fern_autoload = function()
	vim.api.nvim_create_augroup('FernGroup', { clear = true })	

	-- Use augroup to disable line numbers in Fern explorer
	vim.api.nvim_create_autocmd('FileType', {
		group = 'FernGroup',
		pattern = 'fern',
		callback = function()
			vim.opt_local.number = false            -- Disable absolute line numbers in explorer
			vim.opt_local.relativenumber = false	-- Disable relative line numbers in	explorer
			vim.opt_local.bufhidden = 'wipe'
			vim.g['fern#renderer'] = 'nerdfont'
			vim.api.nvim_set_hl(0, 'FernRootSymbol', { fg = '#ffaa00', bold = true })
			vim.cmd('hi EndOfBuffer guifg=bg')		-- Hide '~'
		end,
	})
end


return M

