function debug --description "run debugg (lldb) on the following command"
  lldb $argv[1] -- $argv[2..]
end
