function tig
    set firstarg $argv[1] # indices start at 1 in fish
    if test -z $firstarg;
        set firstarg "\"\"" # keeps empty quotes as first arg
    end
    set x "/Users/tjones/.tug/bin/tugctl ps $firstarg"

    for arg in $argv[2..-1] # list slice the remaining args
        set x $x "grep \"$arg\""
    end
    set x (string join ' | ' $x)
    eval $x
end