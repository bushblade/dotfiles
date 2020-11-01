
SAVEHIST=1000
HISTFILE=~/.zsh_history

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

alias r="ranger"
alias x="exit"
alias nv="nvim"
alias rm="rm -i"
alias mv="mv -i"
alias zshconfig='nvim ~/.zshrc'
alias cl='clear'
alias ignorenode='attr -s com.dropbox.ignored -V 1 node_modules'

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
