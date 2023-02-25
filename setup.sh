#!/bin/bash

cp .vimrc .zshrc .bashrc .tmux.conf .zshenv ~/bashtest
cd ~/bashtest && mkdir .config || cd .config || mkdir zsh && cd zsh || mkdir plugins || cd plugins && mkdir zsh-autosuggesions zsh-syntax-highlighting;
mv ~/bashtest zshrc .
