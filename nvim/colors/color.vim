highlight clear

if exists('syntax_on')
	syntax reset
endif

set background=dark
let g:colors_name = 'color'

" editor
hi Normal ctermfg=7
hi link NormalFloat Normal
hi Visual ctermfg=15 ctermbg=8
hi link VisualNOS Visual
hi StatusLine ctermfg=2 ctermbg=0 cterm=bold
hi StatusLineNC ctermfg=8 ctermbg=0 cterm=bold
hi TabLine ctermfg=15 ctermbg=0 cterm=NONE
hi TabLineFill ctermfg=0 ctermbg=0 cterm=NONE
hi TabLineSel ctermfg=1 ctermbg=0 cterm=bold,italic
hi NormalNC ctermfg=8
hi NonText ctermfg=8 ctermbg=0 cterm=NONE
hi Conceal ctermfg=8 ctermbg=0 cterm=NONE
hi Error ctermfg=0 ctermbg=3 cterm=NONE
hi Todo ctermfg=0 ctermbg=2 cterm=NONE
hi EndOfBuffer ctermfg=8
hi VertSplit ctermbg=8
hi Folded ctermfg=7 ctermbg=4
hi link FoldColumn Folded
hi link SignColumn EndOfBuffer
hi ErrorMsg ctermfg=3 ctermbg=0 cterm=bold
hi WarningMsg ctermfg=4 cterm=bold
hi ModeMsg ctermfg=8
hi link MsgSeparator ModeMsg
hi MoreMsg ctermfg=8

" cursor and line number
hi Cursor ctermbg=4 cterm=NONE
hi link ColorColumn Cursor
hi link CursorIM Cursor
hi CursorLine ctermbg=8 cterm=NONE
hi link CursorColumn CursorLine
hi link TermCursor Cursor
hi link TermCursorNC Cursor
hi LineNr ctermfg=8
hi CursorLineNr ctermfg=1
hi MatchParen ctermbg=8

" Menu
hi Pmenu ctermfg=0 ctermbg=8
hi PmenuSel ctermfg=0 ctermbg=1
hi PmenuSbar ctermfg=8 ctermbg=8
hi PmenuThumb ctermfg=1 ctermbg=1
hi link WildMenu Pmenu

" search
hi Search ctermbg=1
hi link IncSearch Search
hi link Substitute Search

" browser?
hi Directory ctermfg=2

" diff
hi DiffAdd ctermfg=1 ctermbg=0
hi DiffChange ctermfg=2 ctermbg=0
hi DiffDelete ctermfg=3 ctermbg=0
hi DiffText ctermfg=2 ctermbg=0 cterm=bold

" code
hi Comment ctermfg=8 ctermbg=0 cterm=NONE
hi Constant ctermfg=3 ctermbg=0 cterm=NONE
hi String ctermfg=2 ctermbg=0 cterm=NONE
hi link Character String
hi link Number Constant
hi link Float Constant
hi Identifier ctermfg=1 ctermbg=0 cterm=NONE
hi Function ctermfg=1 ctermbg=0 cterm=bold
hi Statement ctermfg=1 ctermbg=0 cterm=NONE
hi Keyword ctermfg=1 ctermbg=0 cterm=bold
hi Exception ctermfg=3 ctermbg=0 cterm=NONE
hi link Operator Exception
hi PreProc ctermfg=3 ctermbg=0 cterm=NONE
hi Type ctermfg=2 ctermbg=0 cterm=italic
hi Special ctermfg=4 ctermbg=0 cterm=bold

" spell
hi SpellBad ctermfg=3 ctermbg=0 cterm=undercurl
hi link SpellCap SpellBad
hi SpellLocal ctermfg=4  ctermbg=0 cterm=underline
hi link SpellRare SpellLocal

" misc
hi Underlined ctermfg=7 ctermbg=0 cterm=underline
hi link Ignore Comment
hi Question ctermfg=1 cterm=italic
hi SpecialKey ctermfg=4 cterm=italic
hi link Whitespace Comment

" nvim
hi NvimInternalError ctermfg=0 ctermbg=3

hi markdownItalic cterm=italic
hi markdownBold cterm=bold
hi markdownH1 ctermbg=0 ctermfg=7 cterm=bold
hi link markdownH2 markdownH1
hi link markdownH3 markdownH1
hi link markdownH4 markdownH1
hi link markdownH5 markdownH1
hi link markdownH6 markdownH1
hi markdownAutomaticLink ctermbg=NONE ctermfg=2 cterm=underline
hi link markdownUrl markdownAutomaticLink
hi link markdownError Error
hi markdownCode ctermbg=NONE ctermfg=3
hi markdownCodeBlock ctermbg=NONE ctermfg=3
hi markdownCodeDelimiter ctermbg=NONE ctermfg=1

hi link htmlH1 mardkownH1
hi link htmlH2 htmlH1
hi link htmlH3 htmlH1
hi link htmlH4 htmlH1
hi link htmlH5 htmlH1
hi link htmlH6 htmlH1
