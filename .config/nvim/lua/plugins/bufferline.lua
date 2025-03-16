
local bufferline = require('config.utils').get_package('bufferline')

if bufferline then
	vim.opt.termguicolors = true bufferline.setup{
		highlights = {
		  	buffer_selected = { bold = true },
			diagnostic_selected = { bold = true },
			info_selected = { bold = true },
			info_diagnostic_selected = { bold = true },
			warning_selected = { bold = true },
			warning_diagnostic_selected = { bold = true },
			error_selected = { bold = true },
			error_diagnostic_selected = { bold = true },
		},
		options = {
			separator_style = "slant",
			show_buffer_icons = false,
			indicator = {
				style = 'underline'
			},
			hover = {
				enabled = true,
				delay = 150,
				reveal = {'close'}
			},
			offsets = {
				{
				filetype = "NvimTree",
				text="Nvim Tree",
				separator= true,
				text_align = "left"
				}
			},
		},
	}

end

