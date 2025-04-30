#!/bin/bash

mkdir -p ~/MyDev

if [ "$SHELL" != "/bin/zsh" ]; then
    echo "Changing default shell to zsh..."
    chsh -s $(which zsh)
fi

echo "Setting up ZDOTDIR in /etc/zshenv..."
if [ ! -d /etc ]; then
    sudo mkdir -p /etc
fi

if [ ! -f /etc/zshenv ]; then
    sudo touch /etc/zshenv
fi
echo "ZDOTDIR=\$HOME/.config/zsh" | sudo tee /etc/zshenv

# 既存のoh-my-zshディレクトリを削除
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Removing existing oh-my-zsh installation..."
    rm -rf "$HOME/.oh-my-zsh"
fi

echo "Installing oh-my-zsh..."
# ZSH環境変数をクリアしてインストール
ZSH= sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo "Installing oh-my-zsh plugins..."
# プラグインディレクトリが存在する場合は削除
for plugin in zsh-completions zsh-autosuggestions zsh-syntax-highlighting you-should-use zsh-bat zsh-abbr; do
    plugin_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/$plugin"
    if [ -d "$plugin_dir" ]; then
        rm -rf "$plugin_dir"
    fi
done

# プラグインのインストール
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/you-should-use
git clone https://github.com/fdellwing/zsh-bat.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-bat
git clone --recurse-submodules https://github.com/olets/zsh-abbr.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-abbr
