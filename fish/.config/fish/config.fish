# set this to enable undercurls in Nvim in Wezterm
# set -gx TERM wezterm
set -gx EDITOR nvim
set -gx TERMINAL ghostty
set fish_greeting
fish_vi_key_bindings

# Set theme for bat
set -Ux BAT_THEME "TwoDark"

# TokyoNight Color Palette
set -l foreground c0caf5
set -l selection 283457
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
set -g fish_color_option $pink
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
set -g fish_pager_color_selected_background --background=$selection
  

# use eza to previw fzf directories
set fzf_preview_dir_cmd eza --all --color=always

# Ctrl + Alt + v for fzf files and Ctrl + Alt + h for fzf history
fzf_configure_bindings --variables=\e\cv --history=\e\ch

# abbr -a nv TERM= nvim
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
abbr -a tree exa -T --icons
abbr -a info info --vi-keys
abbr -a lg lazygit
abbr -a exa exa --icons
abbr -a pd prevd
abbr -a nd nextd

# tmux aliases
abbr -a ta tmux attach -t
abbr -a td tmux detach
abbr -a tad tmux attach -d -t
abbr -a ts tmux new-session -s
abbr -a tl tmux list-sessions
abbr -a tksv tmux kill-server
abbr -a tkss tmux kill-session -t

# Set up fzf key bindings
fzf --fish | source

# Add npm, lua, deno and cargo packages to PATH
set LUAROCKS "$HOME/.luarocks/bin"
set CARGO_PACKAGES "$HOME/.cargo/bin"
set GOPATH "$HOME/go/bin"
set BOBPATH "$HOME/.local/share/bob/nvim-bin"
set EXERCISM "$HOME/.exercism/bin"
fish_add_path $CARGO_PACKAGES $GOPATH $LUAROCKS $BOBPATH $EXERCISM


if test -e "$HOME/.config/fish/secret.fish"
  source "$HOME/.config/fish/secret.fish"
end

starship init fish | source

# function to convert all jpg images in directory to webp
function imgs_to_webp
 for file in *.jpg *.png
      cwebp -q 80 $file -o (basename $file | sed 's/\(.*\)\..*/\1/').webp
  end
end

function whatsrunningon
  set port $argv[1]
  lsof -i:$port
 end

# Yazi change working directory on exit
function yy
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

function delete_rsrc_files
    # Recursively find and delete .rsrc files in the current directory using fd
    fd -H -t f -e rsrc -X rm
    echo "Deleted all .rsrc files from the current directory and its subdirectories."
end

# use Neovim as sudo with my config
function sudonvim
    sudo XDG_CONFIG_HOME=/home/will/.config XDG_DATA_HOME=/home/will/.local/share XDG_CACHE_HOME=/home/will/.cache /home/will/.local/share/bob/nvim-bin/nvim $argv
end

# Function to find and trash all node_modules directories recursively.
# Usage: trash_node_modules
function trash_node_modules
    # Check for dependencies
    if not command -v fd > /dev/null
        echo "Error: 'fd' is not installed. Please install it to continue."
        return 1
    end

    if not command -v trash > /dev/null
        echo "Error: 'trash-cli' is not installed. Please install it to continue."
        return 1
    end

    # Find only the top-level 'node_modules' directories and move them to trash.
    echo "Searching for node_modules directories to trash..."
    fd --type d --hidden --no-ignore --prune 'node_modules' . | xargs -I {} trash {}
    echo "Cleanup complete."
end

 # Tell nvm to use latest version
 nvm use latest > /dev/null ^ /dev/null
