#!/bin/bash

set -e

echo "🚀 Starting complete setup process..."

cd "$(chezmoi source-path)"

# 1. oh-my-zsh のセットアップ
echo "📦 Setting up oh-my-zsh..."
chmod +x .chezmoiscripts/run_once_01_setup_ohmyzsh.sh
./.chezmoiscripts/run_once_01_setup_ohmyzsh.sh

# 2. Homebrew のインストールと Brewfile からのパッケージインストール
echo "🍺 Installing Homebrew and packages..."
chmod +x .chezmoiscripts/run_once_02_install_homebrew.sh
./.chezmoiscripts/run_once_02_install_homebrew.sh

# 3. Cursor の設定
echo "⌨️ Setting up Cursor configuration..."
chmod +x .chezmoiscripts/run_once_03_setup_cursor_config.sh
./.chezmoiscripts/run_once_03_setup_cursor_config.sh

# 4. macOS のデフォルト設定
echo "🍎 Configuring macOS defaults..."
chmod +x .chezmoiscripts/run_once_04_setup_macos_defaults.sh
./.chezmoiscripts/run_once_04_setup_macos_defaults.sh

# 5. GitHub SSH の設定
echo "🔑 Setting up GitHub SSH..."
chmod +x .chezmoiscripts/run_once_05_setup_github_ssh.sh
./.chezmoiscripts/run_once_05_setup_github_ssh.sh

# 6. chezmoi の適用
echo "🏠 Applying chezmoi configuration..."
chezmoi apply

echo "✅ Setup completed successfully!"
echo "Note: Some changes may require a system restart to take effect."
