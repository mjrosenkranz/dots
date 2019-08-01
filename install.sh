#!/usr/bin/env bash
BASEDIR="$HOME/dots"
ln -sf $BASEDIR/berry/ $HOME/.config/berry/
ln -sf $BASEDIR/nvim/ $HOME/.config/nvim/
ln -sf $BASEDIR/misc/inputrc $HOME/.inputrc
ln -sf $BASEDIR/bash/bashrc $HOME/.bashrc
ln -sf $BASEDIR/tmux/tmux.conf $HOME/.tmux.conf
ln -sf $BASEDIR/xfiles/xres $HOME/.Xresources
source $BASEDIR/bash/bashrc
