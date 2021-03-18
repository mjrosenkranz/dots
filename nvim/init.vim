" plugins
call plug#begin('~/.config/plugged')
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'junegunn/goyo.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'wlangstroth/vim-racket'
Plug 'ziglang/zig.vim'
call plug#end()

" file explorer
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_browse_split=0
let g:netrw_winsize=20

" help
cabbrev h rightb vert h

" tabs/spaces
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " number of spaces to use for autoindent set expandtab
set expandtab       " we want spaces!
set autoindent
set copyindent      " copy indent from the previous line

" line numbers
set number
" make the sign column in the numbers
set signcolumn=number
" line wrapping
set nowrap
noremap <silent> k gk
noremap <silent> j gj

set nofoldenable

" clipboard and mouse
"set clipboard=unnamed
set clipboard+=unnamedplus
set mouse=a

" get rid of pesky swap files
set noswapfile
" allow us to swap between buffers
set hidden

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
" autocmd VimLeave * silent !echo -ne "\033]12;#0000ff\007"
" use \003]12;gray\007 for gnome-terminal


"keybindings
let mapleader = ","
nnoremap <leader>s :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>r :tabe ~/.config/nvim/init.vim<cr>
nnoremap <leader>p :silent exec "!pdflatex %"<cr>
nnoremap <leader>n :noh <cr>

" Telescope keybindings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope live_grep<cr>
"nnoremap <leader>h <cmd>Telescope help_tags<cr>

packloadall

" right now its disabled but this shows a dotted line for tabs
set nolist
"set listchars=tab:\¦\ 
" set the vertical line character
set fillchars+=vert:\▏

let g:vimsyn_embed = 'l'

" lsp stuffs
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategry_list = ['exact', 'substring', 'fuzzy']
" root_dir = root_pattern("compile_flags.txt");

lua << EOF
local nvim_lsp = require('lspconfig')
-- general lsp stuff
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- completion
  require'completion'.on_attach()

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- c#
nvim_lsp.omnisharp.setup {
    cmd = {
        "/home/xenone/docs/code/omnisharp-linux-x86/run",
        "--languageserver",
        "--hostPID",
        tostring(vim.fn.getpid())
    };
    on_attach = on_attach;
}

-- c/c++
nvim_lsp.clangd.setup {
  on_attach = on_attach;
}

-- zig
nvim_lsp.zls.setup {
  on_attach = on_attach;
}

-- racket
nvim_lsp.racket_langserver.setup {
  on_attach = on_attach;
}
EOF

" racket stuff
vnoremap <silent> <C-c><C-c> "ry :silent :call luaeval("require'repl'.send_to_tmux(_A)", @r)<CR>



" TODO: make popups a different color
" tab completion
