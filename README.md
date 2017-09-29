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

### YouCompleteMe

After installing go and rust, build YouCompleteMe...

```
cd ~/.vim/plugged/YouCompleteMe
python install.py --clang-completer --gocode-completer --racer-completer
```

## Zsh

Install [pure](https://github.com/sindresorhus/pure) theme:

```
n stable # install node stable version
npm install --global pure-prompt # pure theme
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

## Modify IDEA vmoptions

`cp ./idea/idea.vmoptions ~/Library/Preferences/IntelliJIdea<VERSION>` and restart the IDE

## Modify macOS preferences

* `defaults write -g KeyRepeat -int 0`
* `defaults write com.apple.screencapture location ~/Documents/screenshots && killall SystemUIServer`
