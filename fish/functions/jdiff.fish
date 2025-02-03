function jdiff -a file1 file2 --description "gives the diff between two json files"
  if test ! -e $file1
    echo "$file1 doesn't exist"
    return -1
  end

  if test ! -e $file2
    echo "$file2 doesn't exist"
    return -1
  end

  diff (jq --sort-keys . $file1 | psub) (jq --sort-keys . $file2 | psub)
end
