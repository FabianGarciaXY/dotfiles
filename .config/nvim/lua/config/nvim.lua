
-- General neovim settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.mouse = 'a'
vim.opt.clipboard:append('unnamedplus')
vim.opt.wrap = false
vim.opt.encoding = 'utf-8'
vim.opt.guicursor = 'n:block-blinkwait400-blinkon400-blinkoff400,i:ver25-blinkwait400-blinkon400-blinkoff400' -- Cursor settings
vim.opt.guifont = 'Cascadia Code:h11'
vim.opt.cursorline = true

-- Show messages
vim.diagnostic.config({ virtual_lines = true})
