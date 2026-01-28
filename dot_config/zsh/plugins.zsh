zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light paulirish/git-open
zinit ice as"program" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat
zinit light zsh-users/zsh-completions

# fzf設定 (fdを使用)
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'

# fzf キーバインディング (Ctrl+R: 履歴, Ctrl+T: ファイル, Alt+C: ディレクトリ)
if [[ -f "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh" ]]; then
    source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
fi
if [[ -f "$(brew --prefix)/opt/fzf/shell/completion.zsh" ]]; then
    source "$(brew --prefix)/opt/fzf/shell/completion.zsh"
fi
