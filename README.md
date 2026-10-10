# Just my dotfiles 👨🏻‍💻

### Install packages

- [ neovim ](https://neovim.io/) Editor and IDE
  - nvim config in separate repo [bushblade/nvim](https://github.com/bushblade/nvim)
- [Ghostty](https://ghostty.org/) Terminal emulator
- [fzf](https://github.com/junegunn/fzf)
- [Zoxide](https://github.com/ajeetdsouza/zoxide) Easily jump to directories 
- [ Tmux ](https://github.com/tmux/tmux/wiki)
  - [ Tmux Plugin Manager ](https://github.com/tmux-plugins/tpm)
- [Herdr](https://herdr.dev/) Terminal Multiplexer
  - [vim-herdr-navigation](https://github.com/paulbkim-dev/vim-herdr-navigation)
    navigate vim/herdr splits
- [ fish ](https://fishshell.com/)
  - [ fisher ](https://github.com/jorgebucaran/fisher) Plugin manager for fish
  - [ nvm ](https://github.com/jorgebucaran/nvm.fish) Node version manager
  - [fzf.fish](https://github.com/PatrickF1/fzf.fish)
- [ Yazi ](https://yazi-rs.github.io/) Another terminal file manager!
  - [ Tokyonight theme for Yazi](https://github.com/BennyOe/tokyo-night.yazi)
- [ SuperFile ](https://superfile.dev/) Another terminal file manager!
- [ starship ](https://starship.rs/) Prompt
- [ eza ](https://github.com/eza-community/eza)
- [ bat ](https://github.com/sharkdp/bat)
- [ fd ](https://github.com/sharkdp/fd)
- [ tldr ](https://tldr.sh/)
- [ ripgrep ](https://github.com/BurntSushi/ripgrep)
- [ stow ](https://www.gnu.org/software/stow/)
- [lazygit](https://github.com/jesseduffield/lazygit)
  - [git-delta](https://github.com/dandavison/delta)

**... and a nice patched nerd font!** - [Victor Mono](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/VictorMono/Light/complete/Victor%20Mono%20Light%20Nerd%20Font%20Complete.ttf)

### Change shell to fish

```bash
chsh -s /bin/fish
```

### Clone the repo

```bash
git clone git@github.com:bushblade/dotfiles.git
```

### Use GNU stow to create symlinks to config files

```bash
cd dotfiles
stow */
```

### Install the vim-herdr-navigation plugin

[`vim-herdr-navigation`](https://github.com/paulbkim-dev/vim-herdr-navigation)
lets `ctrl+h/j/k/l` move between Vim/Neovim splits and Herdr panes as if they
were one app.

Clone it into Herdr's plugin directory (this is the path the
[bushblade/nvim](https://github.com/bushblade/nvim) config loads the editor side
from, via `lua/plugins/navigator.lua`):

```bash
git clone https://github.com/paulbkim-dev/vim-herdr-navigation.git \
  ~/.config/herdr/plugins/vim-herdr-navigation
```

Register it with Herdr (the keybindings are already declared in
`herdr/.config/herdr/config.toml`):

```bash
herdr plugin link ~/.config/herdr/plugins/vim-herdr-navigation
```

Reload Herdr with `prefix+shift+r` (or restart), then confirm the actions are
registered:

```bash
herdr plugin action list --plugin vim-herdr-navigation
```

> **Note:** Requires `jq` (used by `navigate.sh` to detect when a pane is
> running Vim/Neovim) and Herdr `>= 0.7.0`.

### Install Node and npm with nvm

```bash
nvm install latest
nvm use latest
```

> **Note:** With using nvm to install NodeJS then globally installed npm packages don't
> need or use sudo to install as they are installed in users home directory.

