#!/bin/bash

# エラーが発生してもスクリプトを継続するように設定
set +e
set +o pipefail

# 現在のシェルでHomebrewのPATHを設定（念のため）
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "Installing packages from Brewfile..."
echo "Note: Some packages might fail to install, but the process will continue."

# brew bundleを実行
brew bundle --global --file="$HOME/.Brewfile"

echo "Brewfile processing completed."
echo "Note: If any packages failed to install, you can try installing them manually later."

exit 0
