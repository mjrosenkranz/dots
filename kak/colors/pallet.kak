# Kakoune default color scheme

evaluate-commands %sh{
    fg="rgb:$(pallet -x fg | cut -c 2-)"
    fg_alt="rgb:$(pallet -x fg_alt | cut -c 2-)"
    bg="rgb:$(pallet -x bg | cut -c 2-)"
    bg_alt="rgb:$(pallet -x bg_alt | cut -c 2-)"
    pri="rgb:$(pallet -x pri | cut -c 2-)"
    sec="rgb:$(pallet -x sec | cut -c 2-)"
    alert="rgb:$(pallet -x alert | cut -c 2-)"
    cur="rgb:$(pallet -x cur | cut -c 2-)"
    com="rgb:$(pallet -x com | cut -c 2-)"
    block="rgb:$(pallet -x block| cut -c 2-)"
# For Code
echo "
    face global value ${alert}
    face global type cur
    face global variable green
    face global module green
    face global function cyan
    face global string magenta
    face global keyword blue
    face global operator cur
    face global attribute green
    face global comment cyan
    face global documentation comment
    face global meta magenta
    face global builtin default+b
"

# For markup
echo "
    face global title blue
    face global header cyan
    face global mono green
    face global block magenta
    face global link cyan
    face global bullet cyan
    face global list cur
"

# builtin faces
echo "
    face global Default default,default
    face global PrimarySelection white,blue+fg
    face global SecondarySelection black,blue+fg
    face global PrimaryCursor black,white+fg
    face global SecondaryCursor black,white+fg
    face global PrimaryCursorEol black,cyan+fg
    face global SecondaryCursorEol black,cyan+fg
    face global LineNumbers default,default
    face global LineNumberCursor default,default+r
    face global MenuForeground white,blue
    face global MenuBackground blue,white
    face global MenuInfo cyan
    face global Information black,cur
    face global Error black,${alert}
    face global StatusLine cyan,default
    face global StatusLineMode cur,default
    face global StatusLineInfo blue,default
    face global StatusLineValue green,default
    face global StatusCursor black,cyan
    face global Prompt cur,default
    face global MatchingChar default,default+b
    face global Whitespace default,default+f
    face global BufferPadding blue,default
"
}
