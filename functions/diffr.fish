# alternates: delta, icdiff

function diffr
    echo "args: $argv"
    set firstarg $argv[1]
    if test $firstarg = "git"
        set x "git show | diffr"
        eval $x
    else
        set x "diff -u $argv[1] $argv[2] | /usr/local/bin/diffr"
        echo "command: $x"
        eval $x
    end
end