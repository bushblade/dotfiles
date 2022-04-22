# Just my dotfiles 👨🏻‍💻

### Install packages

- [ neovim ](https://neovim.io/)
  - nvim config in separate repo [bushblade/nvim](https://github.com/bushblade/nvim)
- [ kitty ](https://sw.kovidgoyal.net/kitty/)
  - [ kitty vim navigator ](https://github.com/knubie/vim-kitty-navigator)
- ~~tmux~~
  - ~~[ Tmux Plugin Manager ](https://github.com/tmux-plugins/tpm)~~
- [ fish ](https://fishshell.com/)
  - [ fisher ](https://github.com/jorgebucaran/fisher)
  - [ z ](https://github.com/jethrokuan/z)
- ~~ranger~~
- [ nnn-nerd ](https://github.com/jarun/nnn)
- [ starship ](https://starship.rs/)
- [ exa ](https://the.exa.website/introduction)
- [ bat ](https://github.com/sharkdp/bat)
- [ fd ](https://github.com/sharkdp/fd)
- [ tldr ](https://tldr.sh/)
- [ ripgrep ](https://github.com/BurntSushi/ripgrep)
- [ cht.sh ](http://cht.sh/)
- [ node & npm ](https://nodejs.org/en/)
- [ python ](https://www.python.org/) & [ pip ](https://pypi.org/project/pip/)
- [ stow ](https://www.gnu.org/software/stow/)
- [lazygit](https://github.com/jesseduffield/lazygit)
  - [git-delta](https://github.com/dandavison/delta)
- [cwebp](https://developers.google.com/speed/webp/docs/cwebp)

set PATH $PATH $NPM_PACKAGES $DENO_PACKAGES $CARGO_PACKAGES

### Change shell to fish

```bash
chsh -s /bin/fish
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

### No sudo on global npm packages

[ Detailed instructions ](https://github.com/sindresorhus/guides/blob/main/npm-global-without-sudo.md)

```bash
mkdir ~/.npm-packages
npm config set prefix '~/.npm-packages'
```
