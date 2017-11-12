#!/usr/bin/env bash

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

link_karabinar() {
    cd ${ROOT}
    printf "${GREEN}+ ${WHITE}linking $PWD/karabiner to ~/.config\n"
    mkdir -p ~/.config/
    ln -s $PWD/karabiner ~/.config/
    # https://pqrs.org/osx/karabiner/document.html#configuration-file-path
    launchctl kickstart -k gui/`id -u`/org.pqrs.karabiner.karabiner_console_user_server
}

for d in git vim zsh tmux iterm; do
    link ${d}
done

link_karabinar
