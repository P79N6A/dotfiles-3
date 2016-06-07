#!/bin/bash
#
# Sync dotfiles
WHITE="\033[0;0m"
GREEN="\033[0;32m"
ROOT=$PWD

link_to() {
    printf "${GREEN}+ ${WHITE}linking ${1} to ${2}\n"
    ln -fs $1 $2
}

link() {
    cd ${ROOT}/${1}
    for file in `find . -not -name .`
    do
        dot_name=`echo $file | sed 's/^\.\//\./'`
        name=`echo $file | sed 's/^\.\///'`
        link_to $PWD/${name} $HOME/${dot_name}
    done
}

link_emacs() {
    cd ${ROOT}/emacs
    local emacsd=$HOME/.emacs.d
    mkdir -p $emacsd $emacsd/conf $emacsd/plugins
    link_to $PWD/init.el $emacsd/
    cd ${ROOT}/emacs/conf
    for f in *; do
        link_to $PWD/$f ${emacsd}/conf/
    done
    cd ${ROOT}/emacs/plugins
    for f in *; do
        link_to $PWD/$f ${emacsd}/plugins/
    done
}

# Link files
for d in git vim zsh tmux rubygem; do
    link ${d}
done
link_emacs
