function sshcfg --wraps='cat ~/.ssh/config' --description 'alias sshcfg=cat ~/.ssh/config'
  cat ~/.ssh/config $argv
        
end
