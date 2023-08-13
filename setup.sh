#!/bin/bash

sudo apt update
sudo apt upgrade

sudo apt install zsh
sudo apt install i3
sudo apt install gcc
sudo apt install clang
sudo apt install python3
sudo apt install steam
sudo apt install golang
sudo apt install neovim
sudo apt install npm
sudo apt install default-jdk

mkdir ~/.config
mkdir ~/.config/nvim
git clone git@github.com:Wiesel871/my_nvim_setup.git ~/.config/nvim/

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

mkdir -p "$HOME/src"
cd "$HOME/src"
git clone https://github.com/Gogh-Co/Gogh.git gogh
cd gogh

zsh
echo "export TERMINAL=gnome-terminal" >> ~/.zshrc
