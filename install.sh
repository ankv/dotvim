#! /bin/bash

# delete existing .vimrc file 
if [ -f ~/.vimrc ];
then
  rm ~/.vimrc
fi

ln -s ~/.vim/vimrc ~/.vimrc

# delete existing .gvimrc file
if [ -f ~/.gvimrc ];
then
  rm ~/.gvimrc
fi

ln -s ~/.vim/gvimrc ~/.gvimrc

# creating bundle directory to install all plugins
mkdir ~/.vim/bundle

# cloning vundle repo to start handling all other installation
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# installing all remaining plugin
vim +PluginInstall +qall
