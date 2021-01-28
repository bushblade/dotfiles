set -gx EDITOR nvim
set fish_greeting

abbr -a r ranger
abbr -a nv nvim
abbr -a x exit

# tmux aliases
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'

alias ..="cd .."
alias rm="rm -i"
alias mv="mv -i"
alias cl='clear'
alias ignorenode='attr -s com.dropbox.ignored -V 1 node_modules'

# cleanup orphaned packages
# alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

starship init fish | source

