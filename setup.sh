#!/bin/bash
#
# Setup development

# Homebrew
`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

brew=/usr/local/bin/brew

for cmd in ack ssh-copy-id openssl git cmake git-flow the_silver_searcher cowsay tmux ctags tree wget fortune; do
    echo "install ${cmd}"
    `${brew} install ${cmd}`
done

`${brew} install emacs --with-cocoa`
`${brew} install lua luajit python3`
`${brew} install vim --with-lua --with-luajit --with-python3`

# Zsh plugins
`git clone https://github.com/b4b4r07/zplug ~/.zplug`

echo "Please follow README"
