#!/bin/bash

set -e

echo "🚀 Starting complete setup process..."

cd "$(chezmoi source-path)"

# 1. oh-my-zsh のセットアップ
echo "📦 Setting up oh-my-zsh..."
chmod +x .chezmoiscripts/run_once_01_setup_ohmyzsh.sh
./.chezmoiscripts/run_once_01_setup_ohmyzsh.sh

# 2. Homebrew のインストール
echo "🍺 Installing Homebrew..."
chmod +x .chezmoiscripts/run_once_02_install_homebrew.sh
./.chezmoiscripts/run_once_02_install_homebrew.sh

# 3. Homebrew パッケージのインストール
echo "📦 Installing Homebrew packages..."
chmod +x .chezmoiscripts/run_once_03_brew_bundle.sh
./.chezmoiscripts/run_once_03_brew_bundle.sh

# 4. Cursor の設定
echo "⌨️ Setting up Cursor configuration..."
chmod +x .chezmoiscripts/run_once_04_setup_cursor_config.sh
./.chezmoiscripts/run_once_04_setup_cursor_config.sh

# 5. macOS のデフォルト設定
echo "🍎 Configuring macOS defaults..."
chmod +x .chezmoiscripts/run_once_05_setup_macos_defaults.sh
./.chezmoiscripts/run_once_05_setup_macos_defaults.sh

# 6. GitHub SSH の設定
echo "🔑 Setting up GitHub SSH..."
chmod +x .chezmoiscripts/run_once_06_setup_github_ssh.sh
./.chezmoiscripts/run_once_06_setup_github_ssh.sh

# 7. chezmoi の適用
echo "🏠 Applying chezmoi configuration..."
chezmoi apply

echo "✅ Setup completed successfully!"
echo "Note: Some changes may require a system restart to take effect."
