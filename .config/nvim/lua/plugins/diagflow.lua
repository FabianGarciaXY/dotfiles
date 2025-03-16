
-- Set up nvim-cmp.
local diagflow = require('config.utils').get_package('diagflow')


if diagflow then
	diagflow.setup({
	    enable = true,
	    max_width = 60,  -- The maximum width of the diagnostic messages
	    max_height = 10, -- the maximum height per diagnostics
	    gap_size = 1,
	    scope = 'line', -- 'cursor', 'line' this changes the scope, so instead of showing errors under the cursor, it shows errors on the entire line.
	    padding_top = 0,
	    padding_right = 0,
	    text_align = 'right', -- 'left', 'right'
	    placement = 'top', -- 'top', 'inline'
	    inline_padding_left = 0, -- the padding left when the placement is inline
	    show_sign = false, -- set to true if you want to render the diagnostic sign before the diagnostic message
	    show_borders = false,
	    toggle_event = { }, -- if InsertEnter, can toggle the diagnostics on inserts
	    update_event = { 'DiagnosticChanged', 'BufReadPost' }, -- the event that updates the diagnostics cache
	    render_event = { 'DiagnosticChanged', 'CursorMoved' },
	    format = function(diagnostic)
			return diagnostic.message
	    end,
	    severity_colors = {  -- The highlight groups to use for each diagnostic severity level
	        error = "DiagnosticFloatingError",
	        warning = "DiagnosticFloatingWarn",
	        info = "DiagnosticFloatingInfo",
	        hint = "DiagnosticFloatingHint",
	    },
	    border_chars = {
			top_left = "┌",
	      	top_right = "┐",
	      	bottom_left = "└",
	      	bottom_right = "┘",
	      	horizontal = "─",
	      	vertical = "│"
	    },
	})
end

