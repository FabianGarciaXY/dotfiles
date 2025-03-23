" These our just some sensible defaults that I don't know why aren't default
syntax on
set clipboard=unnamed  " use the clipboards of vim and win
set clipboard=unnamedplus
set paste               " Paste from a windows or from vim
set nofoldenable
set laststatus=0
autocmd VimEnter * highlight Normal guibg=NONE ctermbg=NONE
autocmd BufReadPost,BufNewFile * 
      \ if getline(1) !~# '^################################## LOGS ##################################' | execute "normal! ggO################################## LOGS ##################################" | endif |
      \ if getline('$') !~# '^################################## END LOGS ##################################' | execute "normal! Go\n################################## END LOGS ##################################" | endif

set nocompatible
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files

filetype plugin on
" change 4 to whatever tab length you prefer. set smarttab if you want to use
" spaces instead of tabs
set tabstop=4
set shiftwidth=4
set smartindent
" This makes it htat you can use your mouse for scrolling, resizing splits,
" switching between splits etc.
set mouse=a
" set rnu
" set nu
set nowrap
" Turns of highlighting after a seach is done.
set nohlsearch
set noerrorbells
" True color
set termguicolors
" If you have one file open, then you switch to another file, instead of
" giving you a warning then and there that the file is unsaved, the file will
" instead become a buffer and you can run Telescope buffers (or use the
" <SPC>bb keybind) to see all the
" open buffers
set hidden
set incsearch
" Only does case sensitive search with a capital is there in a search
set smartcase
" Case insensitive serach
set ignorecase
" Vim I don't want you creating files on my harddrive without my permission
" no matter your intent
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set scrolloff=8
set encoding=UTF-8
" Set the leader key to space, makes some shortcuts really easily, set this
" whatever key you want to the "\" key by default
let mapleader = " "
" Turns off line numbers when you call the :term command to use a terminal
" inside of neovim
autocmd TermOpen * setlocal nonumber  norelativenumber

" To remap in neovim you need to use the command (mode, i for insert, n, for
" normal, v for visual)map (key-you-want-to-map) (key-to-map-to)

" Use C-backspace to be able to delete words, it's a universal habit that I
" would like to keep using within neovim
inoremap <C-h> <C-w>
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $
nmap <silent>gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nnoremap K :call CocActionAsync('doHover')<cr>
nnoremap <leader>ff <CMD>Telescope find_files theme=ivy<CR>
nnoremap  <leader>gg <cmd>Telescope live_grep theme=ivy<cr>
nnoremap <leader> bb <cmd>Telescope buffers theme=ivy<CR>
"Vscode like keys for moving lines up and down
nmap <C-k> ddkP
vmap <c-k> dkPv
vmap <c-k> dkPv
vmap <c-j> dpv
" A quality of life command to be able to quickly switch back to your init.vim
" to make changes
" command Init :e! ~/.config/nvim/init.vim

" This gives us the ability to use <TAB> for snippet expanding, jumping to
" placeholder and completing autocomplete
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'

