set -gx EDITOR nvim
set fish_greeting

abbr -a r ranger
abbr -a nv nvim
abbr -a x exit
abbr -a cat bat
abbr -a find fd

# cleanup orphaned packages
abbr -a cleanup sudo pacman -Rns (pacman -Qtdq)

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
alias ls='exa -l'
alias la='exa -la'

# no sudo on npm global packages
# instructions at
# https://github.com/sindresorhus/guides/blob/main/npm-global-without-sudo.md

set NPM_PACKAGES "$HOME/.npm-packages"

set PATH $PATH $NPM_PACKAGES/bin

set MANPATH $NPM_PACKAGES/share/man $MANPATH  

starship init fish | source
