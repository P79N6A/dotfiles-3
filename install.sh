#!/bin/sh

WHITE="\033[0;0m"
GREEN="\033[0;32m"

ZSHRC=".zshrc"
TMUX=".tmux.conf"
GIT_IGNORE=".gitignore"
GIT_CONFIG=".gitconfig"
GEMRC=".gemrc"
EMACS=".emacs.d"

# $1 $2 absolute path
link_to() {
    printf "${GREEN}+ ${WHITE}Linking $1 to $2...\n"
    ln -fs $1 $2
}

link_emacs() {
    local emacs="$HOME/$EMACS"
    mkdir -p $emacs $emacs/conf $emacs/plugins
    ln -fs "$PWD/init.el" "$emacs/init.el"
    cd $EMACS/conf/
    for cf in *; do
        link_to "$PWD/$cf" "$emacs/conf"
    done
    cd ../plugins
    for cf in *; do
        link_to "$PWD/$cf" "$emacs/plugins"
    done
}

# single file
CONFIG_FILES="$ZSHRC $TMUX $GIT_IGNORE $GIT_CONFIG $GEMRC"
for FILE in $CONFIG_FILES; do
    link_to "$PWD/$FILE" "$HOME/$FILE"
done

# emacs files
link_emacs
