" plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'dylanaraps/wal.vim'
Plug 'itchyny/lightline.vim'
Plug 'chrisbra/colorizer'
call plug#end()

" colorscheme set termguicolors
colorscheme wal
:let g:colorizer_auto_color = 1
:au BufNewFile,BufRead *.css,*.html,*  :ColorHighlight!

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

set foldmethod=syntax

" clipboard and mouse
set clipboard=unnamed
set mouse=n



" get rid of pesky swap files
set noswapfile

let s:c00=	[ '', 0 ]
let s:c08=	[ '', 8 ]
let s:c01=	[ '', 1 ]
let s:c09=	[ '', 9 ]
let s:c02=	[ '', 2 ]
let s:c10=	[ '', 10 ]
let s:c03=	[ '', 3 ]
let s:c11=	[ '', 11 ]
let s:c04=	[ '', 4 ]
let s:c12=	[ '', 12 ]
let s:c05=	[ '', 5 ]
let s:c13=	[ '', 13 ]
let s:c06=	[ '', 6 ]
let s:c14=	[ '', 14 ]
let s:c07=	[ '', 7 ]
let s:c15=	[ '', 15 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left =	[ [ s:c00, s:c05 ], [ s:c08, s:c13 ], [ s:c15, s:c08 ] ]
let s:p.normal.right =	[ [ s:c08, s:c13 ], [ s:c15, s:c08 ] ]
let s:p.normal.middle =	[ [ s:c08, s:c00 ] ]
let s:p.normal.error =	[ [ s:c00, s:c01 ] ]
let s:p.normal.warning= [ [ s:c00, s:c03 ] ]

let s:p.insert.left =	[ [ s:c00, s:c06 ], [ s:c08, s:c14 ], [ s:c15, s:c08 ] ]
let s:p.insert.right =	[ [ s:c08, s:c14 ], [ s:c15, s:c08 ] ]

let s:p.visual.left =	[ [ s:c00, s:c02 ], [ s:c15, s:c10 ], [ s:c15, s:c08 ] ]
let s:p.visual.right =	[ [ s:c07, s:c10 ], [ s:c07, s:c08 ] ]

let s:p.replace.left = [ [ s:c08, s:c00 ], [ s:c00, s:c00 ] ]

let s:p.inactive.left =		[ [ s:c08, s:c04 ], [ s:c08, s:c10 ] ]
let s:p.inactive.right =	[ [ s:c08, s:c04 ], [ s:c00, s:c08 ] ]

let s:p.tabline.left =		[ [ s:c08, s:c05 ] ]
let s:p.tabline.tabsel =	[ [ s:c08, s:c13 ] ]
let s:p.tabline.middle =	copy(s:p.normal.middle)
let s:p.tabline.right =		[ [ s:c07, s:c05 ] ]

let g:lightline#colorscheme#term#palette = lightline#colorscheme#flatten(s:p)

" lightline
let g:lightline = {
  \ 'colorscheme': 'term',
  \ 'separator': { 'left': '▓▒░', 'right': '░▒▓' },
  \ 'subseparator': { 'left': '░', 'right': '░' },
	\ 'active': {
	\		'left':		[ [ 'mode' ], [ 'filename' ], [ 'modified' ] ],
	\		'right':	[ [ 'filetype' ], [ 'fileformat' ] ]
	\ }
\ }
	"\		'right':	[ [ 'lineinfo' ], [ 'filetype', 'fileformat' ] ]

let g:lightline.tab = {
	\ 'active': [ 'filename' ],
	\ 'inactive': [ 'filename', 'modified' ],
\ }

"keybindings
let mapleader = ","
nnoremap <leader>s :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>r :tabe ~/.config/nvim/init.vim<cr>
