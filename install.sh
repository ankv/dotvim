#! /usr/bin/bash

# creating bundle directory to install all plugins
mkdir ~/.vim/bundle

# cloning vundle repo to start handling all other installation
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# installing all remaining plugin
vim +PluginInstall +qall
