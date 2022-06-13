function hig
  set x "history"
  set -l y " | head -n 10"
  for arg in $argv
    if test "$arg" = "--all"
      set y ""
    else
      set x $x "grep \"$arg\""
    end
  end
  set x (string join ' | ' $x)
  set x (string join '' $x $y)
  eval $x
end