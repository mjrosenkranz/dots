if status is-interactive
    # Commands to run in interactive sessions can go here
end

# add nix to path
set PATH /Users/mjr/.nix-profile/bin /nix/var/nix/profiles/default/bin $PATH
# add pyenv path
set PYENV_ROOT "$HOME/.pyenv"
set PATH $PYENV_ROOT/bin $PATH
# add brew path
set PATH /opt/homebrew/bin $PATH

# setup direnv
direnv hook fish | source

# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set fish_cursor_default block
# Set the insert mode cursor to a line
set fish_cursor_insert line
# Set the replace mode cursor to an underscore
set fish_cursor_replace_one underscore
# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
set fish_cursor_visual block

# get pyenv workin
source (pyenv init - | psub)
abbr -a -- gs 'git status'
