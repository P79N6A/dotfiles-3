#!/bin/bash

brew=/usr/local/bin/brew

# Homebrew
`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

`${brew} install ack ssh-copy-id openssl git cmake git-flow cowsay tmux ctags tree wget fortune thefuck luajit python3`

`${brew} install vim --with-luajit --with-python3`
`${brew} install macvim --with-luajit --with-python3`

# Zsh plugin manager(https://github.com/zplug/zplug)
`curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh`

echo "Please follow README"
