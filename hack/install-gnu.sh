#!/usr/bin/env bash

# https://gist.github.com/xuhdev/8b1b16fb802f6870729038ce3789568f

set -e

# core
brew install coreutils

# key commands
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

# OS X ships a GNU version, but too old
brew install bash
brew install make --with-default-names
brew install gpatch
brew install m4
# brew install gdb  # gdb requires further actions to make it work. See `brew info gdb`.
