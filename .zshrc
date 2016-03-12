################################### Zplug ######################################
source ~/.zplug/zplug

zplug "sindresorhus/pure"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "tarruda/zsh-autosuggestions"
zplug "b4b4r07/enhancd", of:enhancd.sh
zplug "supercrabtree/k"
zplug "plugins/git", from:oh-my-zsh, if:"which git"
zplug "unixorn/git-extra-commands"
zplug "oldratlee/hacker-quotes"
zplug "tj/n", do:"make install"
zplug "felixr/docker-zsh-completion"
zplug "hlissner/zsh-autopair"

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
eval "$(rbenv init -)"

################################### Docker #####################################
eval "$(docker-machine env dev)"

################################### Alias ######################################
alias d=docker
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
