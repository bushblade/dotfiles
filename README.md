# Just my dotfiles 👨🏻‍💻

### Install packages

- [ neovim ](https://neovim.io/) Editor and IDE
  - nvim config in separate repo [bushblade/nvim](https://github.com/bushblade/nvim)
- [ Wezterm ](https://wezfurlong.org/wezterm/) Terminal emulator
- [ Alacritty ](https://alacritty.org/) Terminal emulator
- [ kitty ](https://sw.kovidgoyal.net/kitty/) Terminal emulator
  - [ kitty vim navigator ](https://github.com/knubie/vim-kitty-navigator) Move
    between Vim splits and kitty panes
- tmux
  - [ Tmux Plugin Manager ](https://github.com/tmux-plugins/tpm)
- [ fish ](https://fishshell.com/)
  - [ fisher ](https://github.com/jorgebucaran/fisher) Plugin manager for fish
  - [ z ](https://github.com/jethrokuan/z) Easily jump to directories
  - [ nvm ](https://github.com/jorgebucaran/nvm.fish) Node version manager
- [lf file manager](https://github.com/gokcehan/lf) File manager
- [ nnn-nerd ](https://github.com/jarun/nnn) Patched version of nnn file manager
  with icons
- [ starship ](https://starship.rs/) Prompt
- [ exa ](https://the.exa.website/introduction)
- [ bat ](https://github.com/sharkdp/bat)
- [ fd ](https://github.com/sharkdp/fd)
- [ tldr ](https://tldr.sh/)
- [ ripgrep ](https://github.com/BurntSushi/ripgrep)
- [ cht.sh ](http://cht.sh/)
- [ node & npm ](https://nodejs.org/en/)
- [ stow ](https://www.gnu.org/software/stow/)
- [lazygit](https://github.com/jesseduffield/lazygit)
  - [git-delta](https://github.com/dandavison/delta)
- [cwebp](https://developers.google.com/speed/webp/docs/cwebp) Convert images to
  webp format

**... and a nice patched nerd font!** - [Victor Mono](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/VictorMono/Light/complete/Victor%20Mono%20Light%20Nerd%20Font%20Complete.ttf)

### Change shell to fish

```bash
chsh -s /bin/fish
```

### Set Catppuccin theme for fish

```
fisher install catppuccin/fish
fish_config theme save "Catppuccin Mocha"
```

### Clone the repo

```bash
git clone https://github.com/bushblade/dotfiles.git dotfiles
```

### Use GNU stow to create symlinks to config files

```bash
cd dotfiles
stow */
```

### Get the Catppuccin theme for Alacritty

```bash
git clone https://github.com/catppuccin/alacritty.git ~/.config/alacritty/catppuccin
```

### No sudo on global npm packages

[ Detailed instructions ](https://github.com/sindresorhus/guides/blob/main/npm-global-without-sudo.md)

```bash
mkdir ~/.npm-packages
npm config set prefix '~/.npm-packages'
```

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
