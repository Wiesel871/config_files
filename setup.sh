#!/bin/bash

sudo apt update
sudo apt install git
sudo apt upgrade

echo "email for git: "
read answer
git config --global user.mail "$answer"
echo "name for git:"
read answer
git config --global user.name "$answer"
echo "email for ssh key for github: "
read answer
ssh-keygen -t ed25519 -C "$answer"
cat ~/.ssh/id_ed25519.pub
echo "copy this into the new ssh key on github, after you are done press <enter>"
read answer


apt_installs=(cargo gcc clang python3 steam golang npm default-jdk "-y dotnet-sdk-8.0")

PTH=$(pwd)

for inst in "${apt_installs[@]}"; do
    echo "install $inst? y/n"
    read answer
    if [[ "$answer" =~ .*n.* ]]; then
        continue;
    fi
    sudo apt install $inst
done

echo "install neovim? y/n"
read answer
if [[ "$answer" =~ .*y.* ]]; then
    sudo snap install neovim
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    cd "$HOME/.config"
    rm -rf nvim
    ln -s "$PTH/nvim" .
fi

echo "install i3? y/n"
read answer
if [[ "$answer" =~ .*y.* ]]; then
    sudo apt install i3
    cd "$HOME/.config"
    rm -rf i3
    ln -s "$PTH/i3" .
fi

echo "install tmux? y/n"
read answer
if [[ "$answer" =~ .*y.* ]]; then
    sudo apt install tmux
    cd "$HOME/.config"
    rm -rf tmux
    ln -s "$PTH/tmux" .
fi

echo "install zsh? y/n"
read answer
if [[ "$answer" =~ .*y.* ]]; then
    sudo apt install i3
    cd "$HOME"
    rm .zshrc
    rm .zsh_profile
    ln -s "$PTH/zsh/.zshrc" .
    ln -s "$PTH/zsh/.zsh_profile" .

    echo "install ohmyzsh? y/n"
    read answer
    if [[ "$answer" =~ .*y.* ]]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        rm -rf .oh-my-zsh
        ln -s "$PTH/zsh/.oh-my-zsh" .
    fi
fi


echo "install haskell? y/n"
read answer
if [[ "$answer" =~ .*y.* ]]; then
    curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
fi

echo "install gogh terminal themes? y/n"
read answer
if [[ "$answer" =~ .*y.* ]]; then
    mkdir -p "$HOME/src"
    cd "$HOME/src"
    git clone https://github.com/Gogh-Co/Gogh.git gogh
fi
