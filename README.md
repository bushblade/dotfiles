# Just my dotfiles 👨🏻‍💻

### Install packages

- neovim
  - nvim config in separate repo [bushblade/nvim](https://github.com/bushblade/nvim)
- kitty
  - [ kitty vim navigator ](https://github.com/knubie/vim-kitty-navigator)
- ~~tmux~~
  - ~~[ Tmux Plugin Manager ](https://github.com/tmux-plugins/tpm)~~
- fish
  - fisher
  - z
- ~~ranger~~
- nnn
- starship
- exa
- bat
- fd
- tldr
- ripgrep
- cht.sh
- node & npm
- python & pip
- stow

### Change shell to fish

```
chsh -s /bin/fish
```

### Clone the repo

```
git clone https://github.com/bushblade/dotfiles.git dotfiles
```

### Use GNU stow to create symlinks to config files

```
cd dotfiles
stow */
```

### No sudo on global npm packages

[ Detailed instructions ](https://github.com/sindresorhus/guides/blob/main/npm-global-without-sudo.md)

```
mkdir ~/.npm-packages
npm config set prefix '~/.npm-packages'
```

### TODO

- ✅ Replace createSymLinks with [ stow ](https://www.gnu.org/software/stow/)
