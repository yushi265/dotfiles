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
# ソースディレクトリを開く
chezmoi cd

# machineType を再設定したい場合
chezmoi init
```

## 便利なコマンド集

### 設定の確認

```bash
# 管理対象ファイル一覧
chezmoi managed

# 現在の設定データを確認（machineType等）
chezmoi data

# テンプレート展開結果を確認（適用前のプレビュー）
chezmoi cat ~/.config/zsh/aliases.zsh

# 変更を適用（dry-run）
chezmoi apply --dry-run
```

### ファイル操作

```bash
# 新しいファイルを管理対象に追加
chezmoi add ~/.config/some/config

# 管理対象ファイルを直接編集
chezmoi edit ~/.zshrc

# 変更をプレビュー
chezmoi diff

# 変更を適用
chezmoi apply
```

### トラブルシューティング

```bash
# 特定ファイルの状態を確認
chezmoi status

# ソースと実際のファイルの差分を確認
chezmoi diff ~/.zshrc

# テンプレートのデバッグ（展開結果を確認）
chezmoi execute-template < ~/.local/share/chezmoi/dot_config/zsh/aliases.zsh.tmpl

# 強制的に再適用（変更がない場合も）
chezmoi apply --force
```

### Git連携

```bash
# ソースディレクトリで git 操作
chezmoi cd && git status

# 変更をコミット
chezmoi cd && git add -A && git commit -m "message"

# リモートから更新を取得して適用
chezmoi update
```

## カスタムエイリアス

| エイリアス | 実行コマンド | 説明 |
|-----------|-------------|------|
| `c` | `clear` | 画面クリア |
| `f` | `yazi` | ファイラーを開く |
| `moi` | `chezmoi` | chezmoi短縮形 |
| `dc` | `docker compose` | Docker Compose |
| `ls` | `lsd` | モダンなls |
| `l` | `ls -l` | 詳細表示 |
| `la` | `ls -a` | 隠しファイル含む |
| `lal` | `ls -la` | 詳細+隠しファイル |
| `lt` | `ls --tree` | ツリー表示 |
| `cat` | `bat` | シンタックスハイライト付きcat |
| `gs` | `git status` | gitステータス |
| `gl` | `git log` | gitログ |
| `glo` | `git log --oneline` | gitログ（1行） |
| `gw` | `git worktree` | git worktree |
| `gwl` | `git worktree list` | worktree一覧 |

## カスタム関数

### `repo` - リポジトリ選択

fzfでgitリポジトリ/worktreeを選択してcd。

```bash
repo
# → ~/Documents配下のリポジトリ一覧から選択
# → 緑: 通常リポジトリ、黄: worktree
# → 現在のリポジトリ関連が上位に表示
```

### `gd` - インタラクティブgit diff

fzfでgit diffをインタラクティブに表示・操作。

```bash
gd          # staged + unstaged両方表示
gd -s       # stagedのみ
gd -u       # unstagedのみ

# キー操作:
# ENTER   - diffを表示（delta）
# CTRL-E  - vimで編集
# CTRL-S  - stage/unstageトグル
# ESC     - 終了
```

## fzfキーバインド

| キー | 機能 |
|-----|------|
| `Ctrl+R` | コマンド履歴検索 |
| `Ctrl+T` | ファイル検索（プレビュー付き） |
| `Alt+C` | ディレクトリ検索してcd |

## zoxide（スマートcd）

```bash
z <キーワード>    # 過去に訪れたディレクトリへジャンプ
zi               # fzfでインタラクティブに選択
```

## CLIツール

| ツール | 説明 | 使用例 |
|-------|------|--------|
| `lsd` | モダンなls | `ls`, `lt`（ツリー） |
| `bat` | シンタックスハイライト付きcat | `cat file.py` |
| `fd` | 高速ファイル検索 | `fd pattern` |
| `rg` | 高速grep（ripgrep） | `rg pattern` |
| `delta` | 見やすいdiff表示 | git diffで自動使用 |
| `yazi` | ターミナルファイラー | `f` または `yazi` |
| `ghq` | リポジトリ管理 | `ghq get repo-url` |

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

## パッケージ管理

初回セットアップ時に `~/.Brewfile` から自動的にパッケージがインストールされます。

### パッケージの追加

```bash
# Brewfileを編集
chezmoi edit ~/.Brewfile

# 手動でインストール（既存マシン）
brew bundle --file=~/.Brewfile
```

### 現在管理しているパッケージ

- `lsd` - ls の代替
- `ripgrep` - 高速grep
- `fzf` - ファジーファインダー
- `ghq` - リポジトリ管理
