# chezmoi_dotfiles

[chezmoi](https://www.chezmoi.io/) で管理する dotfiles

## 管理対象ファイル

| ソースファイル | 配置先 |
|---------------|--------|
| `dot_zshrc` | `~/.zshrc` |
| `dot_claude/settings.local.json` | `~/.claude/settings.local.json` |
| `dot_config/ghostty/config` | `~/.config/ghostty/config` |
| `dot_config/zsh/*.zsh` | `~/.config/zsh/*.zsh` |

## セットアップ

### 新しいマシンへのインストール

```bash
# chezmoi をインストール
brew install chezmoi

# dotfiles を適用
chezmoi init --source=/path/to/chezmoi_dotfiles
chezmoi apply
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

## zsh 設定構成

| ファイル | 内容 |
|---------|------|
| `aliases.zsh` | エイリアス定義 |
| `functions.zsh` | カスタム関数 |
| `p10k.zsh` | Powerlevel10k テーマ設定 |
| `plugins.zsh` | Zinit プラグイン設定 |
| `syntax-highlight-styles.zsh` | シンタックスハイライト設定 |

## 依存関係

- [Zinit](https://github.com/zdharma-continuum/zinit) - Zsh プラグインマネージャー
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k) - Zsh テーマ
- [Ghostty](https://ghostty.org/) - ターミナルエミュレータ
