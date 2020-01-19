" file explorer
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_browse_split=3
let g:netrw_winsize=20
set fillchars=vert:░

" tabs/spaces
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line

" line numbers
set number
" line wrapping
set nowrap

set nofoldenable

" clipboard and mouse
"set clipboard=unnamed
set clipboard+=unnamedplus
set mouse=a

" get rid of pesky swap files
set noswapfile

function! GetFileType(filetype)
	if a:filetype == ''
		return "none"
	else
		return a:filetype
	endif
endfunction

set laststatus=2
set statusline=%f\ 
set statusline+=%m
set statusline+=%=
set statusline+=%{GetFileType(&filetype)}\ 
set statusline+=%{&ff}\ 

" colorz
syntax on
colo voyage

if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif


"keybindings
let mapleader = ","
nnoremap <leader>s :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>r :tabe ~/.config/nvim/init.vim<cr>

