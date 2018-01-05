#!/usr/bin/env bash

# Homebrew
`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

`brew install ssh-copy-id openssl ack cmake git git-flow cowsay tmux ctags tree wget fortune thefuck tldr luajit pyenv python3 mas`

`brew cask install keepingyouawake`

# install gnu tools
`/bin/bash ./hack/install-gnu.sh`

# Zsh plugin manager(https://github.com/zplug/zplug)
`curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh`

echo "Please follow README"
