zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light paulirish/git-open
zinit ice as"program" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat
zinit light zsh-users/zsh-completions

# fzf キーバインディング (Ctrl+R: 履歴, Ctrl+T: ファイル, Alt+C: ディレクトリ)
if [[ -f "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh" ]]; then
    source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
fi
if [[ -f "$(brew --prefix)/opt/fzf/shell/completion.zsh" ]]; then
    source "$(brew --prefix)/opt/fzf/shell/completion.zsh"
fi
