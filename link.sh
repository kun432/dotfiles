#!/bin/bash

target_dotfiles=".gitconfig"

repo_dir="$(cd "$(dirname "${BASH_SOURCE:-$0}")"; pwd)"

for dotfile in "$target_dotfiles"
do
  ln -sf $repo_dir/$dotfile $HOME
done

