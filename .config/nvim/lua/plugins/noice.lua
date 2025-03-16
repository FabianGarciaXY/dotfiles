
-- CMD line --
local noice = require('config.utils').get_package('noice')

if noice then
	noice.setup{
		lsp = {
			override = {
				['vim.lsp.util.convert_input_to_markdown_lines'] = true,
				['vim.lsp.util.stylize_markdown'] = true,
				['cmp.entry.get_documentation'] = true,
			},
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = false,
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
	}
end

