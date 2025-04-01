function debug --description "run debugg (lldb) on the following command"
  lldb -o 'breakpoint set -E c++' -o 'run' $argv[1] -- $argv[2..]
end
