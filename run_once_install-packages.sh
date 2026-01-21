#!/bin/sh

# パッケージインストールスクリプト（初回のみ実行）

# Homebrewがインストールされているか確認
if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Skipping package installation."
    exit 0
fi

echo "Installing packages via Homebrew Bundle..."

# Brewfileからパッケージをインストール
brew bundle --file="$HOME/.Brewfile"

echo "Package installation complete!"
