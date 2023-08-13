#!/bin/bash

sudo apt update
sudo apt upgrade

apt_installs=(zsh i3 gcc clang python steam golang neovim npm deafault-jdk)

for inst in apt_installs; do
    sudo apt install $inst
done

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

mkdir -p "$HOME/src"
cd "$HOME/src"
git clone https://github.com/Gogh-Co/Gogh.git gogh
cd gogh
echo "choose some gnome terminal themes"

ln -s nvim "$HOME/.config"
ln -s i3 "$HOME/.config"
ln -s tmux "$HOME/.config"

ln -s zsh/.zshrc "$HOME/"
ln -s zsh/.zsh_profile "$HOME/"
