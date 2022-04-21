# TokyoNight Color Palette
set -l foreground c0caf5
set -l selection 33467C
set -l comment 565f89
set -l red f7768e
set -l orange ff9e64
set -l yellow e0af68
set -l green 9ece6a
set -l purple 9d7cd8
set -l cyan 7dcfff
set -l pink bb9af7

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment

set -gx EDITOR nvim
set fish_greeting
fish_vi_key_bindings

abbr -a r ranger
abbr -a nv nvim
abbr -a x exit
abbr -a cat bat
abbr -a find fd
abbr -a .. cd ..
abbr -a rm trash
abbr -a mv mv -i
abbr -a cl clear
abbr -a ignorenode attr -s com.dropbox.ignored -V 1 node_modules
abbr -a ls exa -l --icons
abbr -a la exa -la --icons
abbr -a icat kitty +kitten icat
abbr -a tree exa -T --icons
abbr -a info info --vi-keys
abbr -a lg lazygit
abbr -a exa exa --icons

# cleanup orphaned packages
abbr -a cleanup sudo pacman -Rns (pacman -Qtdq)

# tmux aliases
abbr -a ta tmux attach -t
abbr -a tad tmux attach -d -t
abbr -a ts tmux new-session -s
abbr -a tl tmux list-sessions
abbr -a tksv tmux kill-server
abbr -a tkss tmux kill-session -t


# no sudo on npm global packages
# instructions at
# https://github.com/sindresorhus/guides/blob/main/npm-global-without-sudo.md

# Add npm deno and cargo packages to PATH
set NPM_PACKAGES "$HOME/.npm-packages/bin"
set DENO_PACKAGES "$HOME/.deno/bin"
set CARGO_PACKAGES "$HOME/.cargo/bin"

set PATH $PATH $NPM_PACKAGES $DENO_PACKAGES $CARGO_PACKAGES

# man pages for npm packages
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

# function to convert all jpg images in directory to webp
function imgs_to_webp
 for file in *.jpg *.png
      cwebp -q 80 $file -o (basename $file | sed 's/\(.*\)\..*/\1/').webp
  end
end

