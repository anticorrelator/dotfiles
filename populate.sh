#/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

KARABINER_PATH=~/.config/karabiner
mkdir -p $KARABINER_PATH
ln -sFi $DIR/karabiner.json $KARABINER_PATH/karabiner.json

FISH_PATH=~/.config/fish
mkdir -p $FISH_PATH
ln -sFi $DIR/config.fish $FISH_PATH/config.fish

NVIM_PATH=~/.config/nvim
mkdir -p $NVIM_PATH
ln -sFi $DIR/vimrc $NVIM_PATH/init.vim
ln -sFi $DIR/vimrc ~/.vimrc

ln -sFi $DIR/slate ~/.slate

