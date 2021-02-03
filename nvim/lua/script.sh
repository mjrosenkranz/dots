#!/bin/bash
# start racket and get the pid
#      racket -f % -i

# find the pane with that pid
#
# send text to that pane
#   maybe start new tmux session
#   tmux neww -t ${filename-racket}
#tmux list-panes -F '#{pane_active} #{pane_pid}'

# start racket with file
#racket -t <(sed -n '/^#lang/!p' ${file}) -

# get string from vim
# add clear and enter!
