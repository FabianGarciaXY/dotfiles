
-- Set 'space' as default leader key
vim.g.mapleader = ' '

-- Clear selection
vim.keymap.set('n', '<esc>', ':noh<cr>', { noremap = true, silent = true })

-- Tab size change key mappings
vim.keymap.set('n', '<C-Up>', '<C-w>-', { noremap = true })     -- Maximize bottom tab
vim.keymap.set('n', '<C-Down>', '<C-w>+', { noremap = true })   -- Minimize bottom tab
vim.keymap.set('n', '<C-Left>', '<C-w><', { noremap = true })   -- Maximize left tab
vim.keymap.set('n', '<C-Right>', '<C-w>>', { noremap = true })  -- Minimize left tab

-- Clipboard
vim.keymap.set({ 'n', 'x' }, '<C-S-C>', '"+y', { desc = 'Copy system clipboard' })
vim.keymap.set({ 'n', 'x' }, '<C-S-V>', '"+p', { desc = 'Paste system clipboard' })

-- Fern explorer
vim.keymap.set('n', '<C-n>', ':Fern . -drawer -keep -toggle<CR>', { noremap = true, silent = true, desc = 'New explorer and toggle' })
vim.keymap.set('n', '<C-r>', ':Fern . -drawer -keep -reveal=%<CR>', { noremap = true, silent = true, desc = 'Find buffer' })
vim.keymap.set('n', '<C-t>', ':Fern . -reveal=% -drawer -keep -toggle<CR>', { noremap = true, silent = true, desc = 'Toggle and find buffer' })

-- Fuzzy finder lua
local fzf_lua = require('config.utils').get_package('fzf-lua')

if fzf_lua then
	vim.keymap.set('n', '<C-f>', fzf_lua.files, { desc = 'FzfLua: Find files' })
	vim.keymap.set('n', '<C-g>', fzf_lua.live_grep, { desc = 'FzfLua: Live grep' })
	-- vim.keymap.set('n', '<C-h>', fzf_lua.help_tags, { desc = 'FzfLua: Find help tags' })
	-- vim.keymap.set('n', '<C-b>', fzf_lua.buffers, { desc = 'FzfLua: Find buffers' })
end

local outline = require('config.utils').get_package('outline')

if outline then
	vim.keymap.set('n', '<leader>o', '<cmd>Outline<CR>', { desc = 'Toggle Outline' })
end
