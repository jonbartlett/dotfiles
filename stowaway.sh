#!/bin/bash

#
# Script to sym link dotfile from this Git Repo
#  lastest version: https://github.com/jonbartlett/dotfiles/blob/master/link.sh
#
# for d in `ls .`;
# do
#   ( stow $d )
# done
#

stow stow
stow vim
stow git
stow screen
stow inputrc
stow tmux

chmod +x subversion/.subversion/svnvimdiff.sh
rm ~/.subversion/config; stow subversion

# ssh config
if [ ! -d "$~/.ssh" ]; then
  mkdir ~/.ssh
fi

ln -s "$(pwd)/ssh_config" ~/.ssh/config

# bash - you might not want to automate this if working between multiple OS - manually merge instead
#ln -s "$(pwd)/.bashrc_osx" ~/.bashrc
#ln -s "$(pwd)/.bashrc_ubuntu" ~/.bashrc
#
# merge contents into current bashrc
#cat "$(pwd)/.bashrc_osx" >> ~/.bashrc
#cat "$(pwd)/.bashrc_ubuntu" >> ~/.bashrc

