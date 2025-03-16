
-- Setup autopairs.
local utils = require('config.utils')
local buffer_manager = utils.get_package('buffer_manager')

if buffer_manager then
	buffer_manager.setup({
		line_keys = "1234567890",
		focus_alternate_buffer = true,
		width = 100,
		height = 10,
		show_depth = false,
		short_file_names = false,
		short_term_names = true,
		loop_nav = true,
		highlight = 'Normal:BufferManagerBorder',
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		format_function = nil,
		order_buffers = nil,
		show_indicators = nil,
		win_extra_options = {
			winhighlight = 'Normal:BufferManagerNormal',
	  	},
		select_menu_item_commands = {
			edit = {
				key = 'l', -- '<CR>',
				command = "edit"
	    	},
	  		v = {
				key = '<C-v>',
				command = 'vsplit'
	  		},
	  		h = {
				key = '<C-s>',
				command = 'split'
	  		}
	  	},
	})
end

-- Navigate buffers bypassing the menu
local opts = {noremap = true}
local map = vim.keymap.set
local bmui = require('buffer_manager.ui')
local keys = '1234567890'

for i = 1, #keys do
	local key = keys:sub(i,i)

	map(
		'n',
		string.format('<C-%s>', key),
		function () bmui.nav_file(i) end,
		opts
	)
end

-- Just the menu
map({ 't', 'n' }, '<C-b>', bmui.toggle_quick_menu, opts)
-- Next/Prev
map('n', '<C-h>', bmui.nav_prev, opts)
map('n', '<C-l>', bmui.nav_next, opts)
