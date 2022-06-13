# ENV variables
source ~/.config/fish/secrets.fish

set -x JAVA_HOME (/usr/libexec/java_home -v 11)
set -x PATH $PATH $JAVA_HOME/bin
set -x PATH $PATH /usr/local/bin
set -x PATH $PATH /Applications/Postgres.app/Contents/Versions/latest/bin
set -x PATH $PATH /Users/tjones/.cargo/bin
set -x PATH $PATH /Users/tjones/.tug/bin
set -x PATH $PATH /Users/tjones/.scripts
set -x PATH $PATH /Users/tjones/.gatling/gatling-charts-highcharts-bundle-2.3.1/bin
set -x PATH $PATH /Users/tjones/go/bin
set -x PATH $PATH /usr/local/go/bin/

# Flags
set -x RUSTFLAGS $RUSTFLAGS " -A dead_code"
set -x LIBRARY_PATH $LIBRARY_PATH:/usr/local/lib # used by sdl2
set -x CLASSPATH "$CLASSPATH:$HOME/etc/jars/*" # local jar files
set -x HOMEBREW_NO_INSTALL_CLEANUP true

# Keys and Tokens
set -x M2_HOME /Users/tjones/.m2/ # help gradle
set -x RUST_SRC_PATH /Users/tjones/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src/
set -x RIPGREP_CONFIG_PATH /Users/tjones/.ripgreprc
set -x TUG_ROOT $HOME/.tug
set -x TUG_RELEASE_CHANNEL stable
set -x VAULT_ADDR https://vault.devops.jive.com


# alias
alias uuid="python -c 'import uuid; print(uuid.uuid4())'"
alias dc="docker-compose"
alias ll="exa -lF --git"
alias la="exa -lF --all --git"
alias ls="exa"
alias hex="hexyl"
alias py="python"
alias kc="kubectl"
alias vt="volta"
# Prompt
starship init fish | source
fish_add_path /usr/local/opt/node@14/bin

#Notes
# https://github.com/jorgebucaran/cookbook.fish - great function references
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
