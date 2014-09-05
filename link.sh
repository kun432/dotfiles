#!/bin/bash

target_dotfiles=".gitconfig .zshrc .vimrc .vim .peco"

repo_dir="$(cd "$(dirname "${BASH_SOURCE:-$0}")"; pwd)"

for dotfile in $target_dotfiles
do
  echo "ln -sf $repo_dir/$dotfile $HOME"
  ln -sf $repo_dir/$dotfile $HOME
done

