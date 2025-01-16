#!/bin/bash

mkdir -p ~/MyDev

echo "Setting up ZDOTDIR in /etc/zshenv..."
if [ ! -d /etc ]; then
    sudo mkdir -p /etc
fi

if [ ! -f /etc/zshenv ]; then
    sudo touch /etc/zshenv
fi
echo "ZDOTDIR=\$HOME/.config/zsh" | sudo tee /etc/zshenv

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing oh-my-zsh plugins..."
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use
git clone https://github.com/fdellwing/zsh-bat.git $ZSH_CUSTOM/plugins/zsh-bat
git clone --recurse-submodules https://github.com/olets/zsh-abbr.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-abbr
