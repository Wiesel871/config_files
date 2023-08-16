#!/bin/bash

sudo apt update
sudo apt upgrade

apt_installs=(zsh i3 gcc clang python steam golang neovim npm default-jdk)

PTH=$(pwd)

for inst in "${apt_installs[@]}"; do
    echo "install $inst? y/n"
    read answer
    if [[ "$answer" =~ .*n.* ]]; then
        continue;
    fi
    sudo apt install $inst
done

echo "install ohmyzsh? y/n"
read answer
if [[ "$answer" =~ .*y.* ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "install haskell? y/n"
read answer
if [[ "$answer" =~ .*y.* ]]; then
    curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
fi

echo "install rust? y/n"
read answer
if [[ "$answer" =~ .*y.* ]]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

echo "install gogh terminal themes? y/n"
read answer
if [[ "$answer" =~ .*y.* ]]; then
    mkdir -p "$HOME/src"
    cd "$HOME/src"
    git clone https://github.com/Gogh-Co/Gogh.git gogh
fi

cd "$HOME/.config"
ln -s "$PTH/nvim" .
ln -s "$PTH/i3" .
ln -s "$PTH/tmux" .

cd "$HOME"
ln -s "$PTH/zsh/.zshrc" .
ln -s "$PTH/zsh/.zsh_profile" .
ln -s "$PTH/zsh/.oh-my-zsh" .
