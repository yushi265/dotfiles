alias coleta-next="/Users/shina/documents/coleta/coleta-next"
alias coleta="/Users/shina/documents/coleta/coleta/coleta-server"
alias awsp='export AWS_PROFILE="coleta/tf"'
alias awsd='export AWS_PROFILE="coleta-dev/tf"'
alias c="clear"
alias dc='docker compose'
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lal='ls -la'
alias lt='ls --tree'

# bat (cat の代替)
if builtin command -v bat > /dev/null; then
  alias cat="bat"
fi
