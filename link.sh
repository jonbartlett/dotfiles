#!/bin/bash

#
# Script to sym link dotfile from this Git Repo
#  lastest version: https://github.com/jonbartlett/dotfiles/blob/master/link.sh
#

# vim
ln -s "$(pwd)/.vimrc" ~/.vimrc

# vim spell file
ln -s "$(pwd)/vimspellfile-en.utf-8.add" ~/vimspellfile-en.utf-8.add

# git config
ln -s "$(pwd)/.gitconfig" ~/.gitconfig
ln -s "$(pwd)/.gitignore_global" ~/.gitignore_global

# screen
ln -s "$(pwd)/.screenrc" ~/.screenrc

# Bash Readline
ln -s "$(pwd)/.inputrc" ~/.inputrc

# TMUX
ln -s "$(pwd)/.tmux.conf" ~/.tmux.conf

# simplenote.vim
cp "$(pwd)/.simplenoterc" ~/.simplenoterc

#svn config # note this contains hardcoded reference to HOME dir
mkdir ~/.subversion
ln -s "$(pwd)/svn_config" ~/.subversion/config

ln -s "$(pwd)/svnvimdiff.sh" ~/.subversion/svnvimdiff.sh
chmod +x "$(pwd)/svnvimdiff.sh"

# ssh config
if [ ! -d "$~/.ssh" ];
  mkdir ~/.subversion
fi

ln -s "$(pwd)/ssh_config" ~/.ssh/config

# bash - you might not want to automate this if working between multiple OS - manually merge instead
#ln -s "$(pwd)/.bashrc_osx" ~/.bashrc
#ln -s "$(pwd)/.bashrc_ubuntu" ~/.bashrc
#
# merge contents into current bashrc 
#cat "$(pwd)/.bashrc_osx" >> ~/.bashrc
#cat "$(pwd)/.bashrc_ubuntu" >> ~/.bashrc

