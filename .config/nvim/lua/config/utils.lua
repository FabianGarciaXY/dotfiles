
local M = {}


M.get_package = function(name)
  local ok, package = pcall(require, name)

  if not ok then
    print('WARNING: "'..name..'" not loaded, waiting for install...')
    return
  end

  return package
end

M.set_packer_window = function(packer)
	-- Have packer use a popup window
	packer.init({
		display = {
			open_fn = function()
				return require('packer.util').float({ border = 'rounded' })
			end,
		},
	})
end


return M

