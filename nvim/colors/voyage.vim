highlight clear

if exists('syntax_on')
	syntax reset
endif

set background=light
let g:colors_name = 'mariana'

let s:bg =		'#3b4650'

let s:black =		'#5b5769'
let s:red =			'#e35829'
let s:green =		'#619d57'
let s:yellow =		'#eeb070'
let s:blue =		'#7d91b1'
let s:magenta =		'#a98ead'
let s:cyan =		'#1f8dc2'
let s:white =		'#d3d7e3'
let s:brblack =		'#1a191e'
let s:brred =		'#e35829'
let s:brgreen =		'#a3cfba'
let s:bryellow =	'#f6ca88'
let s:brblue =		'#91b2dd'
let s:brmagenta =	'#bba7b3'
let s:brcyan =		'#92b3df'
let s:brwhite =		''

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
call s:HL('Normal',			s:yellow,		'NONE',			'NONE')
call s:HL('NormalNC',		s:brblack,		'NONE',			'NONE')
call s:HL('StatusLine',		s:brgreen,		'NONE',			'NONE')
call s:HL('LineNr',			s:blue,			'NONE',			'NONE')
call s:HL('CursorLineNr',	s:yellow,		'NONE',			'NONE')
call s:HL('ModeMsg',		s:white,		'NONE',			'NONE')
call s:HL('NonText',		s:magenta,		'NONE',			'NONE')
call s:HL('Visual',			'NONE',			s:blue,		'NONE')

" editor
call s:HL('Cursor',			s:white,		s:yellow,		'NONE')
call s:HL('CursorLine',		'NONE',			s:brblack,		'NONE')
call s:HL('Comment',		s:magenta,		'NONE',			'NONE')
call s:HL('Constant',		s:brgreen,		'NONE',			'NONE')
call s:HL('Identifier',		s:brmagenta,	'NONE',			'NONE')
call s:HL('Statement',		s:bryellow,		'NONE',			'NONE')
call s:HL('PreProc',		s:red,			'NONE',			'NONE')
call s:HL('Type',			s:brblue,	   	'NONE',			'NONE')
call s:HL('Special',		s:brcyan,	   	'NONE',			'NONE')
call s:HL('Underlined',		s:brcyan,	   	'NONE',			'bold')

call s:HL('Error',			s:brwhite,	   	s:brred,		'NONE')
call s:HL('Todo',			s:brblack,	   	s:bryellow,		'NONE')
