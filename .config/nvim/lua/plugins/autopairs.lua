
-- Setup autopairs.
local utils = require('config.utils')
local autopairs = utils.get_package('nvim-autopairs')


if autopairs then
	autopairs.setup {
	  check_ts = true,
	  ts_config = {
	    lua = { "string", "source" },
	    javascript = { "string", "template_string" },
	    java = false,
	  },
	  disable_filetype = { "TelescopePrompt", "spectre_panel" },
	  fast_wrap = {
	    map = "<M-e>",
	    chars = { "{", "[", "(", '"', "'" },
	    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
	    offset = 0,
	    end_key = "$",
	    keys = "qwertyuiopzxcvbnmasdfghjkl",
	    check_comma = true,
	    highlight = "PmenuSel",
	    highlight_grey = "LineNr",
	  },
	}

	local cmp = utils.get_package('cmp')
	local cmp_autopairs = utils.get_package('nvim-autopairs.completion.cmp')

	cmp.event:on(
		"confirm_done",
		cmp_autopairs.on_confirm_done{
			map_char = { tex = '' }
		}
	)
end

