Feel free to borrow my config files:)

# Setup && Sync

`make setup` to setup develop environment and install necessary tools.

`make sync` to sync dotfiles.

## Generate SSH key

`ssh-keygen -t rsa -b 4096 -C "<YOUR EMAIL>"`

## Vim

Install vim plugin manager vim-plug:

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Zsh

First use Zsh in iTerm2:

```
chsh -s `which zsh`
```

Then download zplug for managing plugs:

```
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
```

Install [pure](https://github.com/sindresorhus/pure) theme:

```
curl -L https://git.io/n-install | N_PREFIX=~/.n bash
npm install -g pure-prompt # pure theme
```

Private environment variables set in `~/.zshenv`.

Don't forget to install [powerline fonts](https://github.com/powerline/fonts)

## Miniconda

https://conda.io/miniconda.html

`conda install virtualenv`

## Go

`brew install go`

## Rust

`curl https://sh.rustup.rs -sSf | sh`

## Java

See http://www.oracle.com/technetwork/java/javase/downloads/index.html

## YouCompleteMe

After installing go and rust, build YouCompleteMe...

```
cd ~/.vim/plugged/YouCompleteMe
python3 install.py --clang-completer --gocode-completer --racer-completer
```

## Modify IDEA vmoptions

`cp ./idea/idea.vmoptions ~/Library/Preferences/IntelliJIdea<VERSION>` and restart the IDE

## Modify macOS preferences

* `defaults write -g KeyRepeat -int 0`
* `defaults write com.apple.screencapture location ~/Screenshots && killall SystemUIServer`
