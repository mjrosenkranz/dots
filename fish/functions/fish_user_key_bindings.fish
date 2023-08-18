function fish_user_key_bindings
  fish_vi_key_bindings
  bind -M default / reverse_history_search
end

function reverse_history_search                                    
  history | fzf --no-sort | read -l command                                    
  if test $command                                    
    commandline -rb $command                                    
  end                                    
end
