
local M = {}

-- Handler to for plugins manager (packer)
M.validate = function()
	local packer_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

	if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
		print('WARNING: Packer not found. Installing, please wait...')

	    vim.fn.system({
			'git',
			'clone',
			'--depth',
			'1',
			'https://github.com/wbthomason/packer.nvim',
			packer_path	
		})

	    vim.cmd [[packadd packer.nvim]]
		print("INFO: Packer Installed!")

	    return true
	else
		return false
	end
end

return M
