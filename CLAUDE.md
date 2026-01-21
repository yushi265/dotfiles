# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

これはchezmoiで管理されたdotfilesリポジトリです。個人用マシンと会社用マシンの設定をテンプレート機能で切り替えて管理しています。

## 主要なChezmoiコマンド

```bash
# 設定の編集・適用
chezmoi edit <ファイルパス>     # 管理ファイルを編集
chezmoi diff                    # 変更をプレビュー
chezmoi apply                   # 変更を適用
chezmoi apply --dry-run         # テスト実行（適用しない）

# テンプレートの確認
chezmoi cat <ファイルパス>      # テンプレート展開結果を確認
chezmoi data                    # 設定データ（machineType等）を表示
chezmoi managed                 # 管理対象ファイル一覧

# パッケージ管理
# dot_Brewfileを編集後、以下を実行
chezmoi apply && brew bundle --file=~/.Brewfile
```

## アーキテクチャ

### マシンタイプによる条件分岐

`.chezmoi.toml.tmpl`でマシンタイプ（personal/work）を定義。`.tmpl`拡張子のファイルはGoテンプレートで条件分岐が可能：

```go
{{- if eq .machineType "personal" }}
# 個人マシン専用の設定
{{- end }}
```

### Zsh設定のモジュール構成

`dot_zshrc`は`~/.config/zsh/`配下の全`.zsh`ファイルを自動読み込み：

- `aliases.zsh.tmpl` - エイリアス定義（マシンタイプで分岐）
- `functions.zsh.tmpl` - カスタム関数
- `plugins.zsh` - Zinitプラグイン管理
- `p10k.zsh` - Powerlevel10kテーマ設定
- `syntax-highlight-styles.zsh` - シンタックスハイライト

### 命名規則

- `dot_` → 実際のファイルでは`.`に変換
- `.tmpl` → Goテンプレートとして処理
- `run_once_*.sh` → 初回のみ実行されるスクリプト

## 依存関係

- **Homebrew** - パッケージ管理（`dot_Brewfile`で定義）
- **Zinit** - Zshプラグイン管理（初回起動時に自動インストール）
- **Volta** - Node.jsバージョン管理
- **Ghostty** - ターミナルエミュレータ（`dot_config/ghostty/config`）
