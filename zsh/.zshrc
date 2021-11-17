
SAVEHIST=10000
HISTFILE=~/.zsh_history

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# tmux aliases
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'

alias ..="cd .."
alias r="ranger"
alias x="exit"
alias nv="nvim"
alias rm="rm -i"
alias mv="mv -i"
alias zshconfig='nvim ~/.zshrc'
alias cl='clear'
alias ignorenode='attr -s com.dropbox.ignored -V 1 node_modules'
alias find='fd'
alias rm='trash'
alias ls='exa -l'
alias la='exa -la'
alias cat='bat'

# cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

# nnn quit on exit
n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

# nnn trash instead of rm
NNN_TRASH=1 


# powelevel10k theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
VISUAL=nvim; export VISUAL EDITOR=nvim; export EDITOR

# vi mode
bindkey -v

# bind jj to normal mode 
bindkey jj vi-cmd-mode

# ssh aliases
if [ -r ~/Dropbox/.ssh.zsh ]; then
    source ~/Dropbox/.ssh.zsh
fi
export PATH="$HOME/.deno/bin:$PATH"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$PATH:$NPM_PACKAGES/bin"

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
