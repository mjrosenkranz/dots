function debug --description "run debugg (lldb) on the following command"
  # use this is you want breakpoints on thrown errors: -o 'breakpoint set -E c++'
  lldb -o 'run' $argv[1] -- $argv[2..]
end
