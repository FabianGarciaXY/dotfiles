
local gitblame = require('config.utils').get_package('gitblame')

if gitblame then
	gitblame.setup {
		enabled = true,
	}
end
