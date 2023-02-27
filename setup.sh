#!/bin/bash

cp .vimrc .zshrc .bashrc .tmux.conf .zshenv aliases ~/

cd ~/

if [ ! -d ".config" ]; then
  mkdir .config && cd .config && mkdir zsh && mv ~/.zshrc ./zsh;
  mv ~/aliases ./zsh;
  cd zsh && mkdir plugins && cd plugins && git clone https://github.com/zsh-users/zsh-autosuggestions && git clone https://github.com/zsh-users/zsh-syntax-highlighting;
else 
  cd .config && (mkdir zsh || cd zsh) && mv ~/.zshrc ./zsh;
  mv ~/aliases ./zsh;
  cd zsh && (mkdir plugins || cd plugins) && git clone https://github.com/zsh-users/zsh-autosuggestions && git clone https://github.com/zsh-users/zsh-syntax-highlighting;
fi
