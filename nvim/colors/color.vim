highlight clear

if exists('syntax_on')
	syntax reset
endif

set background=dark
let g:colors_name = 'color'

"let s:bg	=system("clr -x fg")
"let s:bg_alt	=	system("clr -x bg_alt")
"let s:fg	=	system("clr -x fg")
"let s:fg_alt	=	system("clr -x fg_alt")
"let s:cur = system("clr -x cursor")
"let s:alert = system("clr -x alert")
"let s:pri = system("clr -x primary")
"let s:sec = system("clr -x secondary")
"let s:alert = system("clr -x alert")
"let s:color1 = system("clr -x color1")
"let s:color2 = system("clr -x color2")
"let s:color3 = system("clr -x color3")


let s:bg	= $BG
let s:bg_alt	=	$BG_ALT
let s:fg	=	$FG
let s:fg_alt	=	$FG_ALT
let s:cur = "#00ff00"
let s:alert = $ALERT
let s:pri = $PRIMARY
let s:sec = $SECONDARY
let s:color1 = $COLOR1
let s:color2 = $COLOR2
let s:color3 = $COLOR3


function! s:HL(group, bg, fg, cbg, cfg, attr)
	let l:attr = a:attr

	if !empty(a:fg)
		exec 'hi ' . a:group . ' guifg=' . a:fg
	endif
	if !empty(a:bg)
		exec 'hi ' . a:group . ' guibg=' . a:bg
	endif
	if !empty(a:cfg)
		exec 'hi ' . a:group . ' ctermfg=' . a:cfg
	endif
	if !empty(a:cbg)
		exec 'hi ' . a:group . ' ctermbg=' . a:cbg
	endif
	if !empty(a:attr)
		exec 'hi ' . a:group . ' gui=' . l:attr . ' cterm=' . l:attr
	endif
endfun

call s:HL('Normal',			'NONE',				s:fg,		'NONE',		7,			'NONE')
call s:HL('NonText',		'NONE',				s:bg_alt,		'NONE', 	8,			'NONE')
call s:HL('Comment',		'NONE',				s:bg_alt,		'NONE', 	8,			'NONE')
call s:HL('Conceal', 		'NONE',				'NONE',			'NONE',		'NONE',	'NONE')
call s:HL('Constant',		'NONE',				s:alert,		'NONE', 	1,			'NONE')
call s:HL('Error',			s:alert,			s:bg,				1			,		0,			'NONE')
call s:HL('Identifier',	'NONE',				s:alert,		'NONE',		1,			'BOLD')
call s:HL('Ignore',			s:fg_alt,			s:fg,		8			,		0,			'NONE')
call s:HL('PreProc',		'NONE',				s:alert,		'NONE',		4,			'NONE')
call s:HL('Special',		'NONE',				s:sec,		'NONE',		3,			'NONE')
call s:HL('Statement',		'NONE',			s:alert,			'NONE',			1,			'NONE')
call s:HL('String',				'NONE', 		s:pri,			'NONE', 		2,			'NONE')
call s:HL('Number',				'NONE', 		s:alert,			'NONE', 		1,			'NONE')
call s:HL('Type',					'NONE', 		s:sec, 		'NONE', 		3, 		 	'NONE')
call s:HL('Underlined',		'NONE', 		s:fg,			'NONE', 		7,			'underline')
call s:HL('TabLine',			'NONE', 		s:bg_alt,			'NONE', 		15,			'NONE')
call s:HL('TabLineFill',	'NONE', 		'NONE',				'NONE', 		'NONE',	'NONE')
call s:HL('TabLineSel',		'NONE', 		s:pri,			'NONE', 		2,			'NONE')
call s:HL('Title',				'NONE', 		s:fg,			'NONE', 		7,			'NONE')
call s:HL('LineNr',				'NONE', 		s:bg_alt,			'NONE', 		8,			'NONE')
call s:HL('CursorLineNr', 'NONE', 		s:pri,			'NONE', 		2,			'NONE')
call s:HL('helpLeadBlank','NONE', 		s:fg,			'NONE', 		7,			'NONE')
call s:HL('helpNormal',		'NONE', 		s:fg,			'NONE', 		7,			'NONE')
call s:HL('VisualNOS',		'NONE', 		s:alert,			'NONE', 		1,			'NONE')
call s:HL('FoldColumn',		'NONE', 		s:fg,			'NONE', 		7,			'NONE')
call s:HL('Folded',				'NONE', 		s:fg,			'NONE', 		7,			'NONE')
call s:HL('SpecialKey',		'NONE', 		s:alert,			'NONE', 		4,			'NONE')
call s:HL('DiffAdd',			'NONE', 		s:pri,			'NONE', 		2,			'NONE')
call s:HL('Visual',				s:sec,			s:bg,		3,				0,					'NONE')
call s:HL('CursorLine',		s:bg_alt, 	s:fg,			8, 				7,					'NONE')

call s:HL('Pmenu',				s:bg_alt, 	s:fg,		  8, 				7	,	  			'NONE')
call s:HL('PmenuSbar',		s:fg_alt, 	s:fg,		  15, 				7	,	  			'NONE')
call s:HL('PmenuSel',			s:pri,			s:fg,		  1, 				7,	  			'NONE')
call s:HL('PmenuThumb',		s:bg_alt, 	s:fg,		  8, 				7	,	  			'NONE')
call s:HL('WildMenu',			s:pri, 	s:bg,		  5, 				0	,	  			'NONE')

call s:HL('TermCursorNC', s:cur, 	s:fg,		  1, 				7	,	  			'NONE')
call s:HL('Todo',					s:pri, 	s:bg,		  2, 				0	,	  			'NONE')
call s:HL('StatusLine',		'NONE', 	s:pri,		'NONE', 	2	,	  			'NONE')
call s:HL('StatusLineNC', 'NONE', 	s:bg_alt,		  8, 				0	,	  			'NONE')

call s:HL('VertSplit',		'NONE', 	s:bg_alt,		  8, 				0	,	  			'NONE')
call s:HL('DiffChange',		'NONE',			s:alert,			'NONE',		1,				 'NONE')
call s:HL('DiffDelete',		'NONE',			s:alert,			'NONE',		1,				 'NONE')
call s:HL('DiffText',			'NONE',			s:alert,			'NONE',		1,				 'NONE')

call s:HL('Directory',		'NONE',			s:sec,			'NONE',		3,				 'NONE')
call s:HL('signColumn',		'NONE',			s:color1,			'NONE',		4,				 'NONE')
call s:HL('ErrorMsg',			'NONE',			s:alert,			'NONE',		1,				 'NONE')
call s:HL('ModeMsg',			'NONE',			s:pri,			'NONE',		2,				 'NONE')
call s:HL('MoreMsg',			'NONE',			s:pri,			'NONE',		2,				 'NONE')
call s:HL('Question',			'NONE',			s:sec,			'NONE',		3,				 'NONE')
call s:HL('Cursor',				'NONE',			s:cur,			4,		'NONE',				 'NONE')
call s:HL('Structure',		'NONE',			s:alert,			'NONE',		1,				 'NONE')
call s:HL('ModeMsg',			'NONE',			s:bg_alt,			'NONE',		8,				 'NONE')
call s:HL('SpellBad',			'NONE',			s:alert,			'NONE',		1,				 'underline')
call s:HL('SpellCap',			'NONE',			s:color1,			'NONE',		4,				 'underline')
call s:HL('SpellLocal',		'NONE',			s:color1,			'NONE',		4,				 'underline')
call s:HL('SpellRare',		'NONE',			s:color1,			'NONE',		4,				 'underline')
call s:HL('Character',		'NONE',			s:alert,			'NONE',		1,				'NONE')
call s:HL('Define',				'NONE',			s:alert,			'NONE',		1,				'NONE')
call s:HL('Delimiter',		'NONE',			s:alert,			'NONE',		1,				'NONE')
call s:HL('Float',				'NONE',			s:alert,			'NONE',		1,				'NONE')
call s:HL('Include',			'NONE',			s:alert,			'NONE',		1,				'NONE')
call s:HL('Operator',			'NONE',			s:fg,			'NONE',		7,				'NONE')
call s:HL('Typedef',			'NONE',			s:alert,			'NONE',		1,				'NONE')

call s:HL('Conditional',	'NONE',			s:pri,			'NONE',		2,				'NONE')
call s:HL('Boolean',			'NONE',			s:pri,			'NONE',		2,				'NONE')
call s:HL('Repeat',				'NONE',			s:pri,			'NONE',		2,				'NONE')
call s:HL('SpecialChar',	'NONE',			s:pri,			'NONE',		2,				'NONE')

call s:HL('Keyword',			'NONE',			s:sec,			'NONE',		3,				'NONE')
call s:HL('Label',				'NONE',			s:sec,			'NONE',		3,				'NONE')
call s:HL('Tag',					'NONE',			s:sec,			'NONE',		3,				'NONE')

call s:HL('IncSearch',		s:sec,		s:bg,			3,				0,				'NONE')
call s:HL('Search',				s:sec, 	s:bg,			3, 				0,				'NONE')
call s:HL('MatchParen',		s:alert, 	s:bg,			1, 				0,				'NONE')
call s:HL('ColorColumn',	s:alert, 	s:bg,			4, 				0,				'NONE')
call s:HL('WarningMsg',		s:alert, 	s:bg,			1, 				0,				'NONE')
call s:HL('CursorColumn',	s:bg_alt, 	s:fg,			8, 				7,				'NONE')
call s:HL('vimUserCommand', 'NONE', s:alert, 'NONE', 1, 'BOLD')
call s:HL('cssMultiColumnAttr', 'NONE', s:pri,	'NONE', 2, 'NONE')
call s:HL('markdownAutomaticLink',	'NONE', s:pri,'NONE', 2, 'underline')
call s:HL('markdownCodeDelimiter', 'NONE',	s:color2, 'NONE',	5, 'NONE')
call s:HL('vimNotation',			'NONE',		s:color1,		'NONE',		4,		'NONE')
call s:HL('vimMapModKey', 		'NONE', 	s:color1,		'NONE', 	4,		'NONE')
call s:HL('vimBracket',				'NONE', 	s:fg,		'NONE', 	7,		'NONE')
call s:HL('vimCommentString', 'NONE', 	s:alert,		'NONE', 	1,		'NONE')
call s:HL('htmlLink',					'NONE', 	s:alert,		'NONE', 	1,		'underline')
call s:HL('htmlBold',					'NONE', 	s:sec,		'NONE', 	3,		'BOLD')
call s:HL('htmlItalic',				'NONE', 	s:color2,		'NONE', 	5,		'NONE')
call s:HL('htmlEndTag',				'NONE', 	s:fg,		'NONE', 	7,		'NONE')
call s:HL('htmlTag',					'NONE', 	s:fg,		'NONE', 	7,		'NONE')
call s:HL('htmlTagName',			'NONE', 	s:alert,		'NONE', 	1,		'BOLD')
call s:HL('htmlH1',						'NONE', 	s:fg,		'NONE', 	7,		'NONE')
call s:HL('cssBraces',				'NONE', 	s:fg,		'NONE', 	7,		'NONE')
call s:HL('cssValueLength',		'NONE', 	s:fg,		'NONE', 	7,		'NONE')
call s:HL('cssUnitDecorators','NONE', 	s:fg,		'NONE', 	7,		'NONE')
call s:HL('cssValueNumber',		'NONE', 	s:fg,		'NONE', 	7,		'NONE')
call s:HL('cssNoise',					'NONE', 	s:alert,		'NONE', 	1,		'NONE')
call s:HL('cssTagName',				'NONE', 	s:alert,		'NONE', 	1,		'NONE')
call s:HL('cssFunctionName',	'NONE', 	s:color1,		'NONE', 	4,		'NONE')
call s:HL('scssSelectorChar',	'NONE', 	s:fg,		'NONE', 	7,		'NONE')
call s:HL('scssAttribute',		'NONE', 	s:fg,		'NONE', 	7,		'NONE')
call s:HL('sassidChar',				'NONE', 	s:alert,		'NONE', 	1,		'NONE')
call s:HL('sassClassChar',		'NONE', 	s:color2,		'NONE', 	5,		'NONE')
call s:HL('sassInclude',			'NONE', 	s:color2,		'NONE', 	5,		'NONE')
call s:HL('sassMixing',				'NONE', 	s:color2,		'NONE', 	5,		'NONE')
call s:HL('sassMixinName',		'NONE', 	s:color1,		'NONE', 	4,		'NONE')
call s:HL('javaScript',				'NONE', 	s:fg,		'NONE', 	7,		'NONE')
call s:HL('javaScriptBraces',	'NONE', 	s:fg,		'NONE', 	7,		'NONE')
call s:HL('javaScriptNumber',	'NONE', 	s:color2,		'NONE', 	5,		'NONE')
call s:HL('markdownH1',				'NONE', 	s:fg,		'NONE', 	7,		'NONE')
call s:HL('markdownError',		'NONE',		s:fg,		'NONE',		7,		'NONE')
call s:HL('markdownCode',			'NONE',		s:sec,		'NONE',		3,		'NONE')
call s:HL('markdownCodeBlock','NONE',		s:sec,		'NONE',		3,		'NONE')
call s:HL('xdefaultsValue',		'NONE', 	s:fg,		'NONE', 	7,		'NONE')
call s:HL('rubyInclude',			'NONE', 	s:color1,		'NONE', 	4,		'NONE')
call s:HL('rubyDefine',				'NONE', 	s:color2,		'NONE', 	5,		'NONE')
call s:HL('rubyFunction',			'NONE', 	s:color1,		'NONE', 	4,		'NONE')
call s:HL('rubyInteger',				'NONE', s:sec,	'NONE', 3,	'NONE')
call s:HL('rubyAttribute',			'NONE', s:color1,	'NONE', 4,	'NONE')
call s:HL('rubyConstant',				'NONE', s:sec,	'NONE', 3,	'NONE')
call s:HL('rubyInterpolation',	'NONE', s:pri,	'NONE', 2,	'NONE')
call s:HL('rubyRegexp',					'NONE', s:color3,	'NONE', 6,	'NONE')
call s:HL('rubySymbol',					'NONE', s:pri,	'NONE', 2,	'NONE')
call s:HL('rubyTodo',						'NONE', s:color3,	'NONE', 6,	'NONE')
call s:HL('pythonOperator',			'NONE', s:color2,	'NONE', 5,	'NONE')
call s:HL('pythonFunction',			'NONE', s:color1,	'NONE', 4,	'NONE')
call s:HL('pythonRepeat',				'NONE', s:color2,	'NONE', 5,	'NONE')
call s:HL('pythonStatement',		'NONE', s:alert,	'NONE', 1,	'BOLD')
call s:HL('pythonBuiltIn',			'NONE', s:color1,	'NONE', 4,	'NONE')
call s:HL('phpMemberSelector',	'NONE', s:fg,	'NONE', 7,	'NONE')
call s:HL('phpComparison',			'NONE', s:fg,	'NONE', 7,	'NONE')
call s:HL('phpParent',					'NONE', s:fg,	'NONE', 7,	'NONE')
call s:HL('cOperator',					'NONE', s:color3,	'NONE', 6,	'NONE')
call s:HL('cPreCondit',					'NONE', s:color2,	'NONE', 5,	'NONE')
call s:HL('SignifySignAdd',			'NONE', s:pri,	'NONE', 2,	'NONE')
call s:HL('SignifySignChange',	'NONE', s:color1,	'NONE', 4,	'NONE')
call s:HL('SignifySignDelete',	'NONE', s:alert,	'NONE', 1,	'NONE')
call s:HL('NERDTreeDirSlash',		'NONE', s:color1,	'NONE', 4,	'NONE')
call s:HL('NERDTreeExecFile',		'NONE', s:fg,	'NONE', 7,	'NONE')
call s:HL('ALEErrorSign',				'NONE', s:alert,	'NONE', 1,	'NONE')
call s:HL('ALEWarningSign',			'NONE', s:sec,	'NONE', 3,	'NONE')
call s:HL('ALEError',						'NONE', s:alert,	'NONE', 1,	'NONE')
call s:HL('ALEWarning',					'NONE', s:sec,	'NONE', 3,	'NONE')
call s:HL('rubyRegexpAnchor',		'NONE', s:fg,	'NONE', 7,	'NONE')
call s:HL('rubyStringDelimiter', 'NONE', s:pri,'NONE', 2, 'NONE')
call s:HL('rubyInterpolationDelimiter', 'NONE', s:sec, 'NONE', 3, 'NONE')

hi markdownItalic		cterm=Italic
hi markdownBold			cterm=Bold
hi link htmlH2 htmlH1
hi link htmlH3 htmlH1
hi link htmlH4 htmlH1
hi link htmlH5 htmlH1
hi link htmlH6 htmlH1
hi link vimMap vimUserCommand
hi link vimLet vimUserCommand
hi link vimCommand vimUserCommand
hi link vimFTCmd vimUserCommand
hi link vimAutoCmd vimUserCommand
hi link vimNotFunc vimUserCommand
hi link rubyRegexpQuantifier rubyRegexpAnchor
hi link markdownH2 markdownH1
hi link markdownH3 markdownH1
hi link markdownH4 markdownH1
hi link markdownH5 markdownH1
hi link markdownH6 markdownH1
hi link markdownUrl markdownAutomaticLink
hi link cssFontAttr cssMultiColumnAttr
hi link cssFlexibleBoxAttr cssMultiColumnAttr
hi link cssAttrComma cssBraces
hi link cssValueLength cssValueNumber
hi link scssDefinition cssNoise
