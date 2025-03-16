
local fzf_lua = require('config.utils').get_package('fzf-lua')

if fzf_lua then
    local actions = fzf_lua.actions

	fzf_lua.setup{
		defaults = { file_icons = true },
		previewers = {
		    cat = {
		      cmd             = "cat",
		      args            = "-n",
		    },
		    bat = {
		      cmd             = "bat",
		      args            = "--color=always --style=numbers,changes",
		    },
		    head = {
		      cmd             = "head",
		      args            = nil,
		    },
		    git_diff = {
		      -- if required, use `{file}` for argument positioning
		      -- e.g. `cmd_modified = "git diff --color HEAD {file} | cut -c -30"`
		      cmd_deleted     = "git diff --color HEAD --",
		      cmd_modified    = "git diff --color HEAD",
		      cmd_untracked   = "git diff --color --no-index /dev/null",
		      -- git-delta is automatically detected as pager, set `pager=false`
		      -- to disable, can also be set under 'git.status.preview_pager'
		    },
		    man = {
		      -- NOTE: remove the `-c` flag when using man-db
		      -- replace with `man -P cat %s | col -bx` on OSX
		      cmd             = "man -c %s | col -bx",
		    },
		    builtin = {
		      syntax          = true,         -- preview syntax highlight?
		      syntax_limit_l  = 0,            -- syntax limit (lines), 0=nolimit
		      syntax_limit_b  = 1024*1024,    -- syntax limit (bytes), 0=nolimit
		      limit_b         = 1024*1024*10, -- preview limit (bytes), 0=nolimit
		      -- previewer treesitter options:
		      -- enable specific filetypes with: `{ enabled = { "lua" } }
		      -- exclude specific filetypes with: `{ disabled = { "lua" } }
		      -- disable `nvim-treesitter-context` with `context = false`
		      -- disable fully with: `treesitter = false` or `{ enabled = false }`
		      treesitter      = {
		        enabled = true,
		        disabled = {},
		        -- nvim-treesitter-context config options
		        context = { max_lines = 1, trim_scope = "inner" }
		      },
		      -- By default, the main window dimensions are calculated as if the
		      -- preview is visible, when hidden the main window will extend to
		      -- full size. Set the below to "extend" to prevent the main window
		      -- from being modified when toggling the preview.
		      toggle_behavior = "default",
		      -- Title transform function, by default only displays the tail
		      -- title_fnamemodify = function(s) vim.fn.fnamemodify(s, ":t") end,
		      -- preview extensions using a custom shell command:
		      -- for example, use `viu` for image previews
		      -- will do nothing if `viu` isn't executable
		      extensions      = {
		        -- neovim terminal only supports `viu` block output
		        ["png"]       = { "viu", "-b" },
		        -- by default the filename is added as last argument
		        -- if required, use `{file}` for argument positioning
		        ["svg"]       = { "chafa", "{file}" },
		        ["jpg"]       = { "ueberzug" },
		      },
		      -- if using `ueberzug` in the above extensions map
		      -- set the default image scaler, possible scalers:
		      --   false (none), "crop", "distort", "fit_contain",
		      --   "contain", "forced_cover", "cover"
		      -- https://github.com/seebye/ueberzug
		      ueberzug_scaler = "cover",
		      -- Custom filetype autocmds aren't triggered on
		      -- the preview buffer, define them here instead
		      -- ext_ft_override = { ["ksql"] = "sql", ... },
		      -- render_markdown.nvim integration, enabled by default for markdown
		      render_markdown = { enabled = true, filetypes = { ["markdown"] = true } },
		    },
		    -- Code Action previewers, default is "codeaction" (set via `lsp.code_actions.previewer`)
		    -- "codeaction_native" uses fzf's native previewer, recommended when combined with git-delta
		    codeaction = {
		      -- options for vim.diff(): https://neovim.io/doc/user/lua.html#vim.diff()
		      diff_opts = { ctxlen = 3 },
		    },
		    codeaction_native = {
		      diff_opts = { ctxlen = 3 },
		      -- git-delta is automatically detected as pager, set `pager=false`
		      -- to disable, can also be set under 'lsp.code_actions.preview_pager'
		      -- recommended styling for delta
		      --pager = [[delta --width=$COLUMNS --hunk-header-style="omit" --file-style="omit"]],
		    },
		},
		keymap = {
			-- Below are the default binds, setting any value in these tables will override
    		-- the defaults, to inherit from the defaults change [1] from `false` to `true`
    		builtin = {
    		  -- neovim `:tmap` mappings for the fzf win
    		  -- true,        -- uncomment to inherit all the below in your custom config
    		  ["<M-Esc>"]     = "hide",     -- hide fzf-lua, `:FzfLua resume` to continue
    		  ["<F1>"]        = "toggle-help",
    		  ["<F2>"]        = "toggle-fullscreen",
    		  -- Only valid with the 'builtin' previewer
    		  ["<F3>"]        = "toggle-preview-wrap",
    		  ["<F4>"]        = "toggle-preview",
    		  -- Rotate preview clockwise/counter-clockwise
    		  ["<F5>"]        = "toggle-preview-ccw",
    		  ["<F6>"]        = "toggle-preview-cw",
    		  -- `ts-ctx` binds require `nvim-treesitter-context`
    		  ["<F7>"]        = "toggle-preview-ts-ctx",
    		  ["<F8>"]        = "preview-ts-ctx-dec",
    		  ["<F9>"]        = "preview-ts-ctx-inc",
    		  ["<S-Left>"]    = "preview-reset",
    		  ["<S-down>"]    = "preview-page-down",
    		  ["<S-up>"]      = "preview-page-up",
    		  ["<M-S-down>"]  = "preview-down",
    		  ["<M-S-up>"]    = "preview-up",
    		},
    		fzf = {
    		  -- fzf '--bind=' options
    		  -- true,        -- uncomment to inherit all the below in your custom config
    		  ["ctrl-z"]      = "abort",
    		  ["ctrl-u"]      = "unix-line-discard",
    		  ["ctrl-f"]      = "half-page-down",
    		  ["ctrl-b"]      = "half-page-up",
    		  ["ctrl-a"]      = "beginning-of-line",
    		  ["ctrl-e"]      = "end-of-line",
    		  ["alt-a"]       = "toggle-all",
    		  ["alt-g"]       = "first",
    		  ["alt-G"]       = "last",
    		  -- Only valid with fzf previewers (bat/cat/git/etc)
    		  ["f3"]          = "toggle-preview-wrap",
    		  ["f4"]          = "toggle-preview",
    		  ["shift-down"]  = "preview-page-down",
    		  ["shift-up"]    = "preview-page-up",

      ['ctrl-w'] = 'ignore'
    		},
		},
		actions = {
		    -- Below are the default actions, setting any value in these tables will override
		    -- the defaults, to inherit from the defaults change [1] from `false` to `true`
		    files = {
		      -- true,        -- uncomment to inherit all the below in your custom config
		      -- Pickers inheriting these actions:
		      --   files, git_files, git_status, grep, lsp, oldfiles, quickfix, loclist,
		      --   tags, btags, args, buffers, tabs, lines, blines
		      -- `file_edit_or_qf` opens a single selection or sends multiple selection to quickfix
		      -- replace `enter` with `file_edit` to open all files/bufs whether single or multiple
		      -- replace `enter` with `file_switch_or_edit` to attempt a switch in current tab first
		      ["enter"]       = actions.file_edit_or_qf,
		      ["ctrl-s"]      = actions.file_split,
		      ["ctrl-v"]      = actions.file_vsplit,
		      ["ctrl-t"]      = actions.file_tabedit,
		      ["alt-q"]       = actions.file_sel_to_qf,
		      ["alt-Q"]       = actions.file_sel_to_ll,
		      ["alt-i"]       = actions.toggle_ignore,
		      ["alt-h"]       = actions.toggle_hidden,
		      ["alt-f"]       = actions.toggle_follow,
		    },
		},
	}
end

