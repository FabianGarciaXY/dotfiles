
local hlchunk = require('config.utils').get_package('hlchunk')


if hlchunk then
	require('hlchunk').setup({
	    chunk = {
    		use_treesitter = true,
	        enable = true,
			priority = 15,
    		textobject = "",
    		max_file_size = 1024 * 1024,
    		error_sign = true,
    		duration = 310,
    		delay = 280,
    		style = {
				{ fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID('Whitescape')), 'fg', 'bg') },
    		    -- { fg = "#806d9c" },
    		    { fg = "#c21f30" },
    		},
    		chars = {
    		    horizontal_line = '─',
    		    vertical_line = '│',
    		    left_top = '╭',
    		    left_bottom = '╰',
    		    right_arrow = '►', -- '>,→'
    		},
	    },
	    indent = {
	        enable = false,
	    },
		line_num = {
			enable = false,
			style = "#806d9c",
    		priority = 100,
    		use_treesitter = false,
		},
		blank = {
			enable = false,
		}
	})
end

