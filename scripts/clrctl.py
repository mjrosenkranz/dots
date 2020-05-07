#!/usr/bin/env python3
"""
CLRCTL
Author: xenone
usage: 
"""

import os
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

    parser.add_argument("-t", "--tmux", action="store_true", help="print escapes in tmux compatible way")
    parser.add_argument("-d", "--set-default", action="store_true",
            help="change default color sceme")

    args = parser.parse_args()

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
            print(get_escape(cm, args.tmux))
        else:
            verify_colorname(args.esc)
            print(get_escape(cm, args.tmux, args.esc))
    else:
        print(get_escape(cm, args.tmux))

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
        

def get_escape(colormap, tmux, c=None):
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
    esc_str = "\033Ptmux;\033\033]{}{}\007\a\033\\\n" if tmux else "\033]{}{}\007\n"
    #esc_str = "\033Ptmux;\033\033]{}{}\007\a\033\\\n"


    # a map of lists of escape strings
    escmap = {
            'bg'        : ['11;', '708;', '4;0;'],
            'bg_alt'    : ['4;8;'],
            'primary'   : ['4;1;', '4;9;'],
            'secondary' : ['4;2;', '4;10;'],
            'alert'     : ['4;3;', '4;11;', '17;'], # 17 : selection
            'cursor'    : ['4;4;', '4;12;', '12;'], # 12 : cursor
            'fill'      : ['4;5;', '4;13;', '4;6;', '4;14;'],
            'fg'        : ['10;', '4;7;'],
            'fg_alt'    : ['4;15;'],
    }

    # the string we are going to return
    ret = ""

    if c:
        c = c.lower()
        if c in colormap.keys():
            for esc in escmap[c]:
                ret += esc_str.format(esc, colormap[c])
    else:
        # print all escape sequences
        for c in colormap.keys():
            for esc in escmap[c]:
                ret += esc_str.format(esc, colormap[c])
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

    colormap = {
            'fg'        : '',
            'bg'        : '',
            'fg_alt'    : '',
            'bg_alt'    : '',
            'cursor'    : '',
            'alert'     : '',
            'primary'   : '',
            'secondary' : '',
            'fill'      : '',
    }

    # attempt to open the file
    file_path = os.path.expandvars(file_path)
    try:
        with open(file_path) as f:
            lines = f.readlines()
            # go through the file and try to assign the colors
            for l in lines:
                # break line into columns
                col = l.split()
                # the color name column
                c = col[1].lower()
                # the value column
                v = col[2]
                # check if we have an appropriate color name
                if c in colormap.keys():
                    colormap[c] = v

        # check if the map is complete
        for c in colormap.keys():
            if colormap[c] == '':
                print("Color \"{}\" not assigned, using default value of #00ff00"
                        .format(c))
                colormap[c] = "#00ff00"
        return colormap
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
