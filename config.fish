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
# alias rm="rm -i"
alias rm="trash"
alias mv="mv -i"
alias cl='clear'
alias ignorenode='attr -s com.dropbox.ignored -V 1 node_modules'
alias ls='exa -l'
alias la='exa -la'
alias icat='kitty +kitten icat'

# no sudo on npm global packages
# instructions at
# https://github.com/sindresorhus/guides/blob/main/npm-global-without-sudo.md

set NPM_PACKAGES "$HOME/.npm-packages"

set PATH $PATH $NPM_PACKAGES/bin

set MANPATH $NPM_PACKAGES/share/man $MANPATH  

starship init fish | source

# NNN trash instead of rm
set -gx NNN_TRASH 1

# NNN cd on exit
# Rename this file to match the name of the function
# e.g. ~/.config/fish/functions/n.fish
# or, add the lines to the 'config.fish' file.
function n --wraps nnn --description 'support nnn quit and change directory'
    # Block nesting of nnn in subshells
    if test -n "$NNNLVL"
        if [ (expr $NNNLVL + 0) -ge 1 ]
            echo "nnn is already running"
            return
        end
    end

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "-x" as in:
    #    set NNN_TMPFILE "$XDG_CONFIG_HOME/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    if test -n "$XDG_CONFIG_HOME"
        set -x NNN_TMPFILE "$XDG_CONFIG_HOME/nnn/.lastd"
    else
        set -x NNN_TMPFILE "$HOME/.config/nnn/.lastd"
    end

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn $argv

    if test -e $NNN_TMPFILE
        source $NNN_TMPFILE
        rm $NNN_TMPFILE
    end
end


