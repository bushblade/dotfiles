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
- [most](https://github.com/FauxFaux/most-pager)

**... and a nice patched nerd font!** - [Victor Mono](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/VictorMono/Light/complete/Victor%20Mono%20Light%20Nerd%20Font%20Complete.ttf)

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
