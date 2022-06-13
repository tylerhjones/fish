function git
    if test "$argv[1]" = "push"
        set -l currentBranch (command git rev-parse --abbrev-ref HEAD)
        command git $argv --set-upstream origin $currentBranch
    else
        command git $argv
    end
end