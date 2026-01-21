# chezmoi_dotfiles

[chezmoi](https://www.chezmoi.io/) で管理する dotfiles

## 管理対象ファイル

| ソースファイル | 配置先 |
|---------------|--------|
| `.chezmoi.toml.tmpl` | `~/.config/chezmoi/chezmoi.toml` |
| `dot_zshrc` | `~/.zshrc` |
| `dot_claude/settings.local.json` | `~/.claude/settings.local.json` |
| `dot_config/ghostty/config` | `~/.config/ghostty/config` |
| `dot_config/zsh/*.zsh` | `~/.config/zsh/*.zsh` |

## セットアップ

### 新しいマシンへのインストール

```bash
# chezmoi をインストール
brew install chezmoi

# dotfiles を適用（初回はマシンタイプを聞かれる）
chezmoi init --source=/path/to/chezmoi_dotfiles
# "Machine type (personal/work) [work]:" → Enter または値を入力
chezmoi apply
```

### マシンタイプについて

初回 `chezmoi init` 時に `machineType` を設定します。

| タイプ | 説明 | デフォルト条件 |
|-------|------|---------------|
| `personal` | 個人端末用（全エイリアス有効） | ホスト名が `MacBookPro` |
| `work` | 会社PC用（共通エイリアスのみ） | 上記以外 |

設定は `~/.config/chezmoi/chezmoi.toml` に保存されます。

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
chezmoi init --source=/path/to/chezmoi_dotfiles
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
