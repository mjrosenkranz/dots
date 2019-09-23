highlight clear

if exists('syntax_on')
	syntax reset
endif

set background=dark
let g:colors_name = 'mariana'

let s:bg =		'#3b4650'

let s:black =		'#475561'
let s:red =			'#ca575d'
let s:green =		'#76a770'
let s:yellow =		'#d09854'
let s:blue =		'#5885b2'
let s:magenta =		'#b48ab4'
let s:cyan =		'#569a9a'
let s:white =		'#abb4c4'
let s:brblack =		'#596b7a'
let s:brred =		'#ed6970'
let s:brgreen =		'#99c794'
let s:bryellow =	'#f0b062'
let s:brblue =		'#6699cc'
let s:brmagenta =	'#ca9dca'
let s:brcyan =		'#6abcbc'
let s:brwhite =		'#d8dee9'

function! s:HL(group, fg, bg, attr)
	let l:attr = a:attr

	if !empty(a:fg)
		exec 'hi ' . a:group . ' guifg=' . a:fg
	endif
	if !empty(a:bg)
		exec 'hi ' . a:group . ' guibg=' . a:bg
	endif
	if !empty(a:attr)
		exec 'hi ' . a:group . ' gui=' . l:attr . ' cterm=' . l:attr
	endif
endfun

" func call					fg				bg				gui
call s:HL('Normal',			s:white,		'NONE',			'NONE')
call s:HL('NormalNC',		s:brblack,		'NONE',			'NONE')
call s:HL('StatusLine',		s:green,			'NONE',			'NONE')
call s:HL('LineNr',			s:brblack,		'NONE',			'NONE')
call s:HL('CursorLineNr',	s:yellow,		'NONE',			'NONE')
call s:HL('ModeMsg',		s:brblack,		'NONE',			'NONE')
call s:HL('NonText',		s:black,		'NONE',			'NONE')
call s:HL('Visual',			'NONE',			s:black,		'NONE')

" editor
call s:HL('Cursor',			s:white,		s:yellow,		'NONE')
call s:HL('CursorLine',		'NONE',			s:brblack,		'NONE')
call s:HL('Comment',		s:brblack,		'NONE',			'NONE')
call s:HL('Constant',		s:brgreen,		'NONE',			'NONE')
call s:HL('Identifier',		s:brmagenta,	'NONE',			'NONE')
call s:HL('Statement',		s:magenta,		'NONE',			'NONE')
call s:HL('PreProc',		s:red,			'NONE',			'NONE')
call s:HL('Type',			s:brblue,	   	'NONE',			'NONE')
call s:HL('Special',		s:brcyan,	   	'NONE',			'NONE')
call s:HL('Underlined',		s:brcyan,	   	'NONE',			'bold')
call s:HL('Error',			s:brwhite,	   	s:brred,		'NONE')
call s:HL('Todo',			s:brblack,	   	s:bryellow,		'NONE')
