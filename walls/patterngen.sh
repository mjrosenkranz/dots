#!/bin/bash
# https://www.imagemagick.org/script/formats.php#builtin-images
convert -size 32x32 pattern:hs_diagonal \
-fill "$(clr -x color0)" -opaque black   -fill "$(clr -x color10)" -opaque white \
newpattern.png
#convert -size 1920x1080 tile:pattern.gif pattern_bg.jpg
