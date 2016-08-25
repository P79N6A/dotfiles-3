Feel free to borrow my config files:)

# Setup && Sync

`make setup` to setup develop environment and install necessary tools.

`make sync` to sync dotfiles.

## Emacs

First install golang environment, then download go tools.

```
go get golang.org/x/tools/cmd/oracle
go get golang.org/x/tools/cmd/guru
```

## Vim

Install vim plugin manager vim-plug:

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Zsh

Install [pure](https://github.com/sindresorhus/pure) theme:

```
n stable # install node stable version
npm install --global pure-prompt # pure theme
```

Private environment variables set in `~/.zshenv`.
