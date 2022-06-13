function dkill
    set proc (ps aux | grep $argv[1] |  grep -v "grep --color=auto")
    echo $proc
    kill -9 (ps aux | grep $argv[1] |  grep -v "grep --color=auto" | awk '{print $2}')
end