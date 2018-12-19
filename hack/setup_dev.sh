#!/usr/bin/env bash

set -e

e_header()   { echo -e "\n\033[1m$@\033[0m"; }
e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }
e_arrow()    { echo -e " \033[1;33m➜\033[0m  $@"; }

if [[ "$(uname)" != "Darwin" ]]; then
  e_error "Cannot run on platform other than OSX"
  exit 1
fi

# brew
if !(which brew > /dev/null); then
  e_header "Installing brew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# gnu tools
brew install coreutils
brew install moreutils
brew install findutils
brew install binutils
brew install diffutils
brew install ed --with-default-names
brew install findutils --with-default-names
brew install gawk
brew install gnu-indent --with-default-names
brew install gnu-sed --with-default-names
brew install gnu-tar --with-default-names
brew install gnu-which --with-default-names
brew install grep --with-default-names
brew install gnutls
brew install gzip
brew install watch
brew install wdiff --with-gettext
brew install bash
brew install make --with-default-names
brew install gpatch
brew install m4
# brew install gdb  # gdb requires further actions to make it work. See `brew info gdb`.

# common tools
brew install ssh-copy-id openssl gnupg cowsay
brew install git diff-so-fancy tmux ack ripgrep tree jq fzf wget
brew install neovim
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
brew install cmake

# util
brew install m-cli
brew install screenfetch
brew tap cjbassi/gotop
brew install gotop
brew cask install kap

# programming languages
brew install python elixir ocaml go
curl https://sh.rustup.rs -sSf | sh
brew install yarn --without-node

# vim plug
e_header "Downloading vim plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# macOS defaults
e_header "Tuning macOS defaults..."
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g KeyRepeat -int 0
mkdir -p ~/Screenshot
defaults write com.apple.screencapture name ""
defaults write com.apple.screencapture location ~/Screenshot
killall SystemUIServer
defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO
# sudo pmset -b tcpkeepalive 0

# fonts
brew tap caskroom/fonts
brew cask install font-fira-code

# apps
brew cask install iina

e_header "Happy hacking~"

# zsh!!!
# chsh -s `which zsh`
# curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
# curl -L https://git.io/n-install | N_PREFIX=~/.n bash
# npm install -g pure-prompt # pure theme, don't forget to install [powerline fonts](https://github.com/powerline/fonts)
