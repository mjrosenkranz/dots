#!/usr/bin/env python3
"""
CLRCTL
Author: xenone
usage: 
"""

import os
import yaml
import argparse

DEFAULT_PATH = "$HOME/dots/colors/"
DEFAULT_FILE = DEFAULT_PATH + "source"
COLORS = [
    'fg',
    'bg',
    'fg_alt',
    'bg_alt',
    'cursor',
    'alert',
    'primary',
    'secondary',
    'fill'
]



def main():
    parser = argparse.ArgumentParser()
    group = parser.add_mutually_exclusive_group()
    group2 = parser.add_mutually_exclusive_group()
    parser.add_argument("colorfile", type=str, nargs='?', help="color config we want to load")
    group.add_argument("-x", "--hex",
            help="Print specified color or all colors in hex",
            action="store", nargs='?', const="-")
    group.add_argument("-r", "--rgb",
            help="Print specified color or all colors in rgb",
            action="store", nargs='?', const="-")
    group.add_argument("-e", "--esc",
            help="Print specified color escape or all escape codes",
            action="store", nargs='?', const="-")

    group2.add_argument("-t", "--tmux", action="store_const",
            help="print escapes in tmux compatible way",
            const='tmux', dest='ttype')

    group2.add_argument("-i", "--iterm", action="store_const",
            help="print escapes in iterm2 compatible way",
            const='iterm', dest='ttype')

    parser.add_argument("-d", "--set-default", action="store_true",
            help="change default color sceme")

    args = parser.parse_args()
    if args.ttype is None:
        args.ttype = 'default'

    cm = get_colors()
    if args.colorfile:
        if args.set_default:
            # link to source
            os.unlink(os.path.expandvars(DEFAULT_FILE))
            os.symlink(os.path.expandvars(DEFAULT_PATH + args.colorfile), 
                    os.path.expandvars(DEFAULT_FILE))
            cm = get_colors()
        else:
            cm = get_colors(DEFAULT_PATH + args.colorfile)

    if args.hex:
        # print hex
        if args.hex == '-':
            for c in cm:
                print(cm[c])
        else:
            verify_colorname(args.hex)
            print(cm[args.hex])
    elif args.rgb:
        # print rgb
        if args.rgb == '-':
            for c in cm:
                print(get_rgb(cm[c]))
        else:
            verify_colorname(args.rgb)
            print(get_rgb(cm[args.rgb]))
    elif args.esc:
        # print rgb
        if args.esc == '-':
            print(get_escape(cm, args.ttype))
        else:
            verify_colorname(args.esc)
            print(get_escape(cm, args.ttype, args.esc))
    else:
        print(get_escape(cm, args.ttype))

def get_rgb(color):
    """
    Prints the rgb representation of the given color.
    Args:
    c -- a hexadecimal color to print
    """
    # divide in to each color
    r = color[1:3]
    g = color[3:5]
    b = color[5:]

    return "{}, {}, {}".format(int(r,16), int(g, 16), int(b, 16))
        

def get_escape(colormap, ttype, c=None):
    """
    Prints the escape sequence of the given color.
    If no color is specified then all escape codes are printed.
    Args:
    c -- string name of color to print.
    colormap -- map of possible colors.
    """

    # a string to use for escape sequences
    # the first value is part of the escape sequence
    # the second value is the color
    esc_str = {'tmux' : "\033Ptmux;\033\033]{}#{}\007\a\033\\\n",
            'default' : "\033]{}#{}\007\n",
            'iterm' : "\033]P{}{}\007\n"}


    # a map of lists of escape strings
    escmap = {
            'bg'        : ['11;', '4;0;'],
            'bg_alt'    : ['4;8;'],
            'primary'   : ['4;1;', '4;9;'],
            'secondary' : ['4;2;', '4;10;'],
            'alert'     : ['4;3;', '4;11;'], # 17 : selection
            'cursor'    : ['4;4;', '4;12;', '12;'], # 12 : cursor
            'fill'      : ['4;5;', '4;13;', '4;6;', '4;14;'],
            'fg'        : ['10;', '4;7;'],
            'fg_alt'    : ['4;15;', '17;'],
    }

    if ttype == 'iterm':
        escmap = {
            'bg'        : ['h', '0'],
            'bg_alt'    : ['8'],
            'primary'   : ['1', '9'],
            'secondary' : ['2', 'a'],
            'alert'     : ['3', 'b'],
            'cursor'    : ['4', 'c', 'l'],
            'fill'      : ['5', 'd', '6', 'e'],
            'fg'        : ['g', '7', 'k'],
            'fg_alt'    : ['j', 'f'],
        }

    # the string we are going to return
    ret = ""

    if c:
        c = c.lower()
        if c in colormap.keys():
            for esc in escmap[c]:
                ret += esc_str[ttype].format(esc, colormap[c].strip('#'))
    else:
        # print all escape sequences
        for c in colormap.keys():
            for esc in escmap[c]:
                ret += esc_str[ttype].format(esc, colormap[c].strip('#'))
        ret += "\033[H"

    return ret

def get_colors(file_path = DEFAULT_FILE):
    """
    Read colors from given file to the color dict.
    If no file is specified the default file is used.
    Args:
    file_path -- string path to the file to be read.
    Returns:
    A dictionary of color names to values in hex.
    """

    # attempt to open the file
    file_path = os.path.expandvars(file_path)
    try:
        with open(file_path) as f:
            data = yaml.load(f, Loader=yaml.FullLoader)
            # check that we have everything
            if set(data.keys()) == set(COLORS):
                return data
            else:
                print("keys missing")
                print(data.keys())
                print(COLORS)
                exit(1)
    except FileNotFoundError:
        print("file \"{}\" does not exist".format(file_path))

def verify_colorname(cn):
    if cn not in COLORS:
        print("color {} not found".format(cn))
        exit(1)

# print usage of this program
def usage():
    usage_string = """
usage: clrmgr [-xlr] index
possible opts:
nothing: prints colors out
	 -x: prints in hex
	 -s: prints as a string with formatting
	 -n: prints raw hex
	 -H: prints in hsl
	 -r: prints in rgb
	 -e: prints escape code
	 -c: changes the color file
	 -l: lists all color file choices
	 -a: applies colors to all terms
	 -v: exports colors as env variables
    """
    print(usage_string)




# run main if this is a script
if __name__ == "__main__":
    main()
