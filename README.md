# Just my dotfiles 👨🏻‍💻

### Install packages

- [ neovim ](https://neovim.io/) Editor and IDE
  - nvim config in separate repo [bushblade/nvim](https://github.com/bushblade/nvim)
  - [bob](https://github.com/MordechaiHadad/bob) Neovim installer and version
    manager
- [Ghostty](https://ghostty.org/) Terminal emulator
- [ Wezterm ](https://wezfurlong.org/wezterm/) Terminal emulator
- [ Alacritty ](https://alacritty.org/) Terminal emulator
- ~~[ kitty ](https://sw.kovidgoyal.net/kitty/) Terminal emulator~~
  - ~~[ kitty vim navigator ](https://github.com/knubie/vim-kitty-navigator) Move~~
    between Vim splits and kitty panes
- [fzf](https://github.com/junegunn/fzf)
- [ Tmux ](https://github.com/tmux/tmux/wiki)
  - [ Tmux Plugin Manager ](https://github.com/tmux-plugins/tpm)
- [ fish ](https://fishshell.com/)
  - [ fisher ](https://github.com/jorgebucaran/fisher) Plugin manager for fish
  - [ z ](https://github.com/jethrokuan/z) Easily jump to directories
  - [ nvm ](https://github.com/jorgebucaran/nvm.fish) Node version manager
  - [fzf.fish](https://github.com/PatrickF1/fzf.fish)
- [ nnn-nerd ](https://github.com/jarun/nnn) Patched version of nnn file manager
  with icons
- [ Yazi ](https://yazi-rs.github.io/) Another terminal file manager!
  - [ Tokyonight theme for Yazi](https://github.com/BennyOe/tokyo-night.yazi)
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

### Install Node and npm with nvm

```bash
nvm install latest
nvm use latest
```

> **Note:** With using nvm to install NodeJS then globally installed npm packages don't
> need or use sudo to install as they are installed in users home directory.

### Setup file and image previews in nnn

[Detailed instructions](https://github.com/jarun/nnn/tree/master/plugins)

install plugins for nnn

```bash
curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh
```

Add the following to `~/.profile`

```bash
# previews in nnn
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='p:preview-tui;g:getplugs;o:organize;'
```

Activate the plugin in nnn after launching nnn by hitting `;p`
Update plugins with `;g`
