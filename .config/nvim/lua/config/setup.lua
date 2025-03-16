
-- Validate and initiate packer
local post_setup = require('config.post_setup')
local packer_loader = require('plugins.packer_loader').validate()
local utils = require('config.utils')

-- Get packer
local packer = utils.get_package('packer')

if packer then
	utils.set_packer_window(packer)

	-- Configure plugins and manager
	packer.startup( function(use)
		print('INFO: Starting up...')
		use { 'wbthomason/packer.nvim' }											    -- Package manager
		use { 'karb94/neoscroll.nvim' }    			      							    -- Scroll
		use { 'vmchale/dhall-vim' }         		      							    -- Dhall highlighting
		use { 'hrsh7th/cmp-nvim-lsp' }	    		      							    -- Autocompletion
		use { 'hrsh7th/cmp-buffer' }        		      							    -- Autocompletion
		use { 'hrsh7th/cmp-path' }		    		      							    -- Autocompletion
		use { 'hrsh7th/cmp-cmdline' }       		      							    -- Autocompletion
		use { 'hrsh7th/nvim-cmp' }					      							    -- Autocompletion
		use { 'ryanoasis/vim-devicons' }   			      							    -- Icons
		use { 'gen740/SmoothCursor.nvim' }                							    -- Cursor animation
		use { 'lambdalisue/vim-nerdfont' }											    -- Fonts and icons
		use { 'lambdalisue/fern.vim', after = 'vim-nerdfont' }						    -- Fern explorer
		use { 'lambdalisue/vim-fern-renderer-nerdfont', after = 'fern.vim' }		    -- Fern icons
		use { 'nvim-tree/nvim-web-devicons' }										    -- Fern dependecy
		use { 'rebelot/kanagawa.nvim' }					  							    -- Theme
		use { 'tomasr/molokai' }                          							    -- Theme
		use { 'ku1ik/vim-monokai' }                       							    -- Theme
		use { 'ayu-theme/ayu-vim' }                       							    -- Theme
		use { 'drewxs/ash.nvim' }		    			  							    -- Theme
		use { 'nyoom-engineering/oxocarbon.nvim' }        							    -- Theme
		use { 'catppuccin/nvim', as = 'catppuccin' }      							    -- Theme
		use { 'rose-pine/neovim', as = 'rose-pine' }      							    -- Theme
		use { 'tiagovla/tokyodark.nvim' }				  							    -- Theme
		use { 'Yazeed1s/minimal.nvim' }					  							    -- Theme
		use { 'olimorris/onedarkpro.nvim' }												-- Theme
		use { 'embark-theme/vim', as = 'embark' } 										-- Theme
		use { 'meatballs/notebook.nvim' }                 							    -- Jupyter renderer
		use { 'windwp/nvim-autopairs' }					  							    -- Auto enclosing chars 
		use	{ 'junegunn/fzf' }					    	  							    -- Fuzzy finder 
		use { 'junegunn/fzf.vim' }                        							    -- Fuzzy finder dependecy
		use	{ 'ibhagwan/fzf-lua' }					      							    -- Fuzzy finder improved
		use { 'nvim-treesitter/nvim-treesitter' }									    -- Syntax stuff
		use { 'akinsho/bufferline.nvim', tag = '*' }      							    -- Tabs
		use { 'williamboman/mason.nvim' }				  							    -- Lsp stuff
		use { 'williamboman/mason-lspconfig.nvim' }       							    -- Lsp stupp
		use { 'neovim/nvim-lspconfig'}					  							    -- Lsp
		use { 'nvim-lualine/lualine.nvim' }				  							    -- Status line
		use { 'MeanderingProgrammer/render-markdown.nvim', after = 'nvim-treesitter' }  -- Markdown render in nvim
		use { 'rlychrisg/keepcursor.nvim' }												-- Cursor position
		use { 'folke/noice.nvim', requires = 'MunifTanjim/nui.nvim' }                   -- CMD bar
		use { 'hedyhli/outline.nvim' }													-- Lateral symbols
		use { 'shellRaining/hlchunk.nvim' }												-- Identation guides
		use { 'bassamsdata/namu.nvim' }													-- Centred symbols
		use { 'nvim-lua/plenary.nvim' }													-- Buffer manager basic dependency		
		use { 'j-morano/buffer_manager.nvim' }											-- Buffer manager
	 	use	{ 'Pocco81/true-zen.nvim' }													-- Zen mode
		use { 'f-person/git-blame.nvim' }												-- Git blame
		use { 'sindrets/diffview.nvim' }										        -- optional - Diff integration
		use { 'NeogitOrg/neogit' }														-- Git features
		use { 'folke/tokyonight.nvim' }													-- Theme
		use { 'dgagn/diagflow.nvim' }													-- Highlighting
		use { 'rmagatti/goto-preview' }													-- Get previews
		use { 'mg979/vim-visual-multi' }												-- Multiple cursors
		-- use { 'rachartier/tiny-inline-diagnostic.nvim' }
		-- use 'sontungexpt/better-diagnostic-virtual-text'
		-- use { "willothy/nvim-cokeline" }
		use { 'otavioschwanck/cool-substitute.nvim'}

		require'cool-substitute'.setup({
		  setup_keybindings = true,
		  mappings = {
		  start = 'gm', -- Mark word / region
		  start_and_edit = 'gM', -- Mark word / region and also edit
		  start_and_edit_word = 'g!M', -- Mark word / region and also edit.  Edit only full word.
		  start_word = 'g!m', -- Mark word / region. Edit only full word
		  apply_substitute_and_next = 'M', -- Start substitution / Go to next substitution
		  apply_substitute_and_prev = '<C-b>', -- same as M but backwards
		  apply_substitute_all = 'ga', -- Substitute all
		  force_terminate_substitute = 'g!!', -- Terminate macro (if some bug happens)
		  terminate_substitute = '<esc>', -- Terminate macro
		  skip_substitute = 'n', -- Skip this occurrence
		  goto_next = '<C-j>', -- Go to next occurence
		  goto_previous = '<C-k>', -- Go to previous occurrence
		  },
		  reg_char = 'o', -- letter to save macro (Dont use number or uppercase here)
		  mark_char = 't', -- mark the position at start of macro
		  writing_substitution_color = "#ECBE7B", -- for status line
		  applying_substitution_color = "#98be65", -- for status line
		  edit_word_when_starting_with_substitute_key = true -- (press M to mark and edit when not executing anything anything)
		})
		-- Load plugins
		if packer_loader then
			print('INFO: Sync plugins...')
			packer.sync()
		end

		-- Load plugins config
		print('INFO: Loading plugins config...')
		require('plugins.lualine')				   -- Line status bar
		require('plugins.noice')				   -- CMD line
		require('plugins.fzf')					   -- Fuzzy finder
		require('plugins.fzflua')				   -- Improved fuzzy finder with Lua
		require('plugins.cmp')		      		   -- Autocompletion
		require('plugins.bufferline')	  		   -- Buffers like tabs
		require('plugins.lspconfig')      		   -- More lsp stuff
		require('plugins.mason')		  		   -- Lsp stuff
		require('plugins.notebooks')      		   -- Jupyter notebooks
		require('plugins.render_markdown')		   -- Markdown viewer
		require('plugins.keepcursor')              -- Cursor position
		require('plugins.outline')				   -- Lateral symbols navigator
		require('plugins.autopairs')			   -- Auto pairs
		require('plugins.hlchunk')				   -- Indent highlight
		require('plugins.namu')					   -- Centred symbols
		require('plugins.buffer_manager')		   -- Buffer manager
		require('plugins.gitblame')				   -- Git stuff
		require('plugins.diagflow')				   -- Diagnostig messages
		require('plugins.goto_preview')			   -- Get previews
		-- require('plugins.smoothcursor')			   -- Cursor animation
		print('INFO: Startup completed!')
	end)

	-- Activate autocommands
	post_setup.packer_autoload()
	post_setup.treesitter_autoload()
	post_setup.fern_setup()
	post_setup.fern_autoload()

	vim.cmd('hi EndOfBuffer guifg=bg')		-- Hide '~' by default
    vim.cmd([[colorscheme kanagawa]])
end

