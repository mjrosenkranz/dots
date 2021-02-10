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
    face global type ${cur}
    face global variable ${pri}
    face global module ${alert}
    face global function ${pri}
    face global string ${sec}
    face global keyword ${pri}
    face global operator ${cur}
    face global attribute ${pri}
    face global comment ${com}
    face global documentation comment
    face global meta ${cur}
    face global builtin ${alert}+b
    face global DiagnosticWarning ${cur}+ub
    face global DiagnosticError ${alert}+ub
    face global LineFlagErrors ${alert}
"

# For markup
echo "
    face global title ${pri}
    face global header ${sec}
    face global mono ${fg}
    face global block ${fg},${block}
    face global link ${pri}
    face global bullet ${fg}
    face global list ${fg}
"

# builtin faces
echo "
    face global Default default,default
    face global PrimarySelection default,${bg_alt}
    face global SecondarySelection default,${fg_alt}+fg
    face global PrimaryCursor black,${cur}+fg
    face global SecondaryCursor PrimaryCursor
    face global PrimaryCursorEol PrimaryCursor
    face global SecondaryCursorEol PrimaryCursor

    face global LineNumbers ${com},default+d
    face global LineNumberCursor ${com},default+b

    face global MenuForeground ${block},${pri}+b
    face global MenuBackground ${block},${com}
    face global MenuInfo ${pri}
    face global Information ${bg},${pri}
    face global Error ${fg},${alert}
    face global StatusLine ${pri},default
    face global StatusLineMode ${cur},default
    face global StatusLineInfo ${pri},default
    face global StatusLineValue ${pri},default
    face global StatusCursor ${bg},${pri}
    face global Prompt ${cur},default
    face global MatchingChar ${sec},default+bu
    face global Whitespace default,default+f
    face global BufferPadding comment
"
}
