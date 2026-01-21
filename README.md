# dotfiles

[chezmoi](https://www.chezmoi.io/) で管理する dotfiles

## セットアップ

### 新しいマシンへのインストール

```bash
# chezmoi をインストール
brew install chezmoi

# dotfiles を初期化して適用（初回はマシンタイプを聞かれる）
chezmoi init --apply https://github.com/yushi265/dotfiles.git
# "Machine type (personal/work) [work]:" → Enter または値を入力
```

### 既存マシンでの設定変更

```bash
# ファイルを編集
chezmoi edit ~/.zshrc

# 変更を確認
chezmoi diff

# 適用
chezmoi apply
```

### よく使うコマンド

```bash
# テンプレート展開結果を確認（適用前のプレビュー）
chezmoi cat ~/.config/zsh/aliases.zsh

# 現在の設定データを確認
chezmoi data

# 管理対象ファイル一覧
chezmoi managed

# ソースディレクトリを開く
chezmoi cd

# 変更を適用（dry-run）
chezmoi apply --dry-run

# machineType を再設定したい場合
chezmoi init
```

## zsh 設定構成

| ファイル | 内容 |
|---------|------|
| `aliases.zsh.tmpl` | エイリアス定義（テンプレート） |
| `functions.zsh.tmpl` | カスタム関数（テンプレート） |
| `p10k.zsh` | Powerlevel10k テーマ設定 |
| `plugins.zsh` | Zinit プラグイン設定 |
| `syntax-highlight-styles.zsh` | シンタックスハイライト設定 |

## 依存関係

- [Zinit](https://github.com/zdharma-continuum/zinit) - Zsh プラグインマネージャー
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k) - Zsh テーマ
- [Ghostty](https://ghostty.org/) - ターミナルエミュレータ
