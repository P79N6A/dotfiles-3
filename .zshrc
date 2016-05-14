################################### Zplug ######################################
source ~/.zplug/zplug

zplug "sindresorhus/pure"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "plugins/git", from:oh-my-zsh, if:"which git"
zplug "unixorn/git-extra-commands"
zplug "tj/n", do:"make install"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load --verbose

################################### Settings ###################################
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export TERM=xterm-256color

################################### Rbenv ######################################
# eval "$(rbenv init -)"

################################### Rvm ######################################
# install ruby comment out the zplug section
source ~/.rvm/scripts/rvm
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

################################## #Alias ######################################
alias d=docker
alias denv='eval "$(docker-machine env dev)"'
alias e='/usr/local/Cellar/emacs/24.5/bin/emacsclient -t'
alias eui='/usr/local/Cellar/emacs/24.5/bin/emacsclient -n'
alias g=git
alias gff='git flow feature'
alias gfr='git flow release'
alias gfh='git flow hotfix'
alias pg='postgres -D /usr/local/var/postgres'
alias rds=redis-server
alias wttr='curl -4 wttr.in/Beijing'
alias cow='cow -color -request'
alias ip='curl ip.cn'
alias vi='/usr/local/bin/vim' # brew install vim
