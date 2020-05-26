# path
set -u fish_user_paths $HOME/dots/scripts/
# colors
clrmgr.py
#
set fish_greeting "Hi, xenone"

# vi keybindings
set -g fish_key_bindings fish_vi_key_bindings
set fish_cursor_insert line
set fish_cursor_default block
set fish_cursor_replace_one underscore
set fish_cursor_visual block
set -g prompt_emoji 💩


set fish_color_normal white
set fish_color_command red --bold
set fish_color_quote brwhite
set fish_color_redirection blue
set fish_color_end brblack
set fish_color_error yellow
set fish_color_param white
set fish_color_comment brblack
set fish_color_match green
set fish_color_selection brblack
set fish_color_search_match brwhite
set fish_color_operator blue
set fish_color_escape green --bold
set fish_color_autosuggestion brblack -i
set fish_color_cancel yellow

# source
source $HOME/dots/fish/alias.fish
