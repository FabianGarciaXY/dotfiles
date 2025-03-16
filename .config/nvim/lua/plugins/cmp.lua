
-- Set up nvim-cmp.
local cmp = require('config.utils').get_package('cmp')

if cmp then
	cmp.setup({
	    snippet = {
		    expand = function(args)
				vim.fn['vsnip#anonymous'](args.body)
			end,
		},
	    window = {
		    completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
	    },
	    mapping = cmp.mapping.preset.insert({
			-- Autocompletion key mappings
	        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
	        ['<C-f>'] = cmp.mapping.scroll_docs(4),
	        ['<C-Space>'] = cmp.mapping.complete(),
	        ['<C-e>'] = cmp.mapping.abort(),
	        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
			['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
			['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
			['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
	    }),
	    sources = cmp.config.sources({
	        { name = 'nvim_lsp' },
			{ name = 'vsnip' }, -- For vsnip users.
	    }, {
	        { name = 'buffer' },
	    })
	})
	
	-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline({ '/', '?' }, {
	    mapping = cmp.mapping.preset.cmdline(),
	    sources = {
			{ name = 'buffer' }
	    }
	})
	
	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(':', {
	    mapping = cmp.mapping.preset.cmdline(),
	    sources = cmp.config.sources({
			{ name = 'path' }
	    }, {
			{ name = 'cmdline' }
	    }),
	    matching = { 
			disallow_symbol_nonprefix_matching = false 
		}
	})

end

