################################### Zplug ######################################
# Check if zplug is installed
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
zplug "tj/git-extras", as:command, use:"bin/git-*", hook-build:"make install"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

################################### Settings ###################################
set -o emacs
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export TERM=xterm-256color

# editor
export EDITOR='vim'

# http_proxy
export http_proxy='http://0.0.0.0:8964'
export https_proxy='http://0.0.0.0:8964'
export no_proxy='localhost,127.0.0.1,127.0.1.1'

# fzf
export FZF_DEFAULT_OPTS='--height 20% --layout=reverse --border'

################################### PATH #######################################
# go
export GOROOT='/usr/local/opt/go/libexec'
export GOPATH="$HOME/.go:$HOME/Code/go"
export PATH="$GOROOT/bin:$HOME/.go/bin:$HOME/Code/go/bin:$PATH"

# rust
export PATH="$HOME/.cargo/bin:$PATH"

# pipenv
export PIPENV_VENV_IN_PROJECT="1"

# java
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export MAVEN_OPTS="-Xms128m -Xmx512m -XX:MaxPermSize=512M"

# n-install
export N_PREFIX="$HOME/.n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# GNU tools
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/m4/bin:$PATH"

# brew
export PATH="/usr/local/sbin:$PATH"

################################### Alias ######################################
alias g=git
alias v=vim
alias pg='postgres -D /usr/local/var/postgres'
alias less='less --LONG-PROMPT --LINE-NUMBERS --ignore-case --QUIET'
alias cleards="find ~ -name '*.DS_Store' -type f -delete && echo 'ALL .DS_STORE FILES RECURSIVELY REMOVED'"
alias en0="echo $(ifconfig en0 | grep netmask | awk '{print $2}')"
alias gr='grep --color -n -E'

################################# Function ####################################
function md() {
	mkdir -p "$@" && cd "$@"
}

function f() {
	find . -name "$1" 2>&1 | grep -v 'Permission denied'
}

function t() {
    tmux a -t $1
}

function rgg() {
    rg $1 -g '!{vendor,thrift_gen,clients}' -tgo
}

# iterm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
