
-- Set up Markdown viewer.
local render_markdown = require('config.utils').get_package('render-markdown')

if render_markdown then
	require('render-markdown').setup({
		render_modes = true,
		heading = {
			sign = false,
		},
	})
end
