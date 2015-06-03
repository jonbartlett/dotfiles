#!/bin/bash

#
# Script to sym link dotfile from this Git Repo
#

# vim
ln -s "$(pwd)/.vimrc" ~/.vimrc

# bash - you might not want to automate this if working between multiple OS - manually merge instead
#ln -s "$(pwd)/.bashrc" ~/.bashrc

# vim spell file
ln -s "$(pwd)/vimspellfile-en.utf-8.add" ~/vimspellfile-en.utf-8.add

# git config
ln -s "$(pwd)/.gitconfig" ~/.gitconfig
ln -s "$(pwd)/.gitignore_global" ~/.gitignore_global

# screen
ln -s "$(pwd)/.screenrc" ~/.screenrc

