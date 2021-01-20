" plugins
call plug#begin('~/.config/plugged')
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'junegunn/goyo.vim'
call plug#end()

" markdown preview
let g:mkdp_refresh_slow=1

" file explorer
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_browse_split=0
let g:netrw_winsize=20

" help
cabbrev h rightb vert h

" tabs/spaces
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent set expandtab
set autoindent
set copyindent      " copy indent from the previous line

" line numbers
set number
" line wrapping
set wrap
noremap <silent> k gk
noremap <silent> j gj

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

" status line
set laststatus=2
set statusline=%f\ 
set statusline+=%m
set statusline+=%=
set statusline+=%{GetFileType(&filetype)}\ 
set statusline+=%{&ff}\ 
" tabline
set showtabline=2

" colorz
syntax on
colo color
"if exists('+termguicolors')
"	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"	set termguicolors
"endif

"make the cursor color stay
	" use an orange cursor in insert mode
	let &t_SI = "\<Esc>]12;orange\x7"
	" use a red cursor otherwise
	let &t_EI = "\<Esc>]12;red\x7"
	silent !echo -ne "\033]12;red\007"
	" reset cursor when vim exits
	autocmd VimLeave * silent !echo -ne "\033]12;#0000ff\007"
	" use \003]12;gray\007 for gnome-terminal


"keybindings
let mapleader = ","
nnoremap <leader>s :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>r :tabe ~/.config/nvim/init.vim<cr>
nnoremap <leader>p :silent exec "!pdflatex %"<cr>
nnoremap <leader>n :noh <cr>

packloadall

set list
set listchars=tab:\│\ 

