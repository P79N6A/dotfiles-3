################################### Zplug ####################################

if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi

source ~/.zplug/init.zsh

zplug "mafredri/zsh-async"
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "ael-code/zsh-colored-man-pages"
zplug "supercrabtree/k"
zplug "b4b4r07/enhancd", use:init.sh

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

################################### Settings #################################

username=`whoami`

set -o emacs
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
[ -z "$TMUX" ] && export TERM=screen-256color

# editor
export EDITOR='nvim'

# fzf
export FZF_DEFAULT_OPTS='--height 20% --layout=reverse --border'

# http_proxy
if [ $username = "yurunyu" ]; then
    export http_proxy=10.110.216.52:3128 https_proxy=10.110.216.52:3128
    export no_proxy='.byted.org,.cn,localhost,127.0.0.1,127.0.1.1'
else
    export http_proxy='http://0.0.0.0:6152' https_proxy='http://0.0.0.0:6152'
    export no_proxy='localhost,127.0.0.1,127.0.1.1'
fi

################################### PATH #####################################
BINPATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

if [ $username = "yurunyu" ]; then
    # linuxbrew
    BINPATH+=":/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin"

    # go
    export GOPATH="$HOME/repos/go"
    BINPATH+=":$GOROOT/bin:$GOPATH/bin"

    # other
    BINPATH+=":$HOME/bin:/opt/tiger/ss_lib/bin:/opt/tiger/ss_bin"
else
    # GNU tools
    BINPATH+=":/usr/local/opt/coreutils/libexec/gnubin"

    # go
    export GO111MODULE=on
    export GOROOT='/usr/local/opt/go/libexec'
    export GOPATH="$HOME/Code/go"
    BINPATH+=":$GOROOT/bin:$GOPATH/bin"

    # python
    BINPATH+=":$HOME/.conda/bin"

    # flutter
    BINPATH+=":$HOME/Code/flutter/bin"

    # java
    # export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
fi

# n-install
export N_PREFIX="$HOME/.n";
BINPATH+=":$N_PREFIX/bin"

# rust
BINPATH+=":$HOME/.cargo/bin"

export PATH=$BINPATH

################################### Alias ####################################

alias g=git
alias v=nvim
alias vi=vim
alias pg='postgres -D /usr/local/var/postgres'
alias less='less --LONG-PROMPT --LINE-NUMBERS --ignore-case --QUIET'
alias gr='grep --color -n -E'

if [ $username = "yurunyu" ]; then
    alias tmux=/home/linuxbrew/.linuxbrew/bin/tmux
    alias tp=~/repos/toutiao/runtime/bin/python
    alias onboard='ssh yurunyu@10.3.23.40'
else
    alias en0="echo $(ifconfig en0 | grep netmask | awk '{print $2}')"
    alias cleards="find ~ -name '*.DS_Store' -type f -delete && echo 'ALL .DS_STORE FILES RECURSIVELY REMOVED'"
fi

################################# Function ###################################

function t() {
    tmux a -t $1
}

function rgg() {
    rg $1 -g '!{vendor,thrift_gen,clients}' -tgo
}

function cheat() {
    curl cheat.sh/$1
}

function md() {
	mkdir -p "$@" && cd "$@"
}

function f() {
	find . -name "$1" 2>&1 | grep -v 'Permission denied'
}

# build with os default path
function rawpath() {
    path2=$PATH
    export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
    command $@
    export PATH=$path2
}

# iterm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
