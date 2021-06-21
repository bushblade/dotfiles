# Just my dotfiles 👨🏻‍💻

### Install packages

- neovim 
    - [ Plug ]( https://github.com/junegunn/vim-plug )
- kitty
    - [ kitty vim navigator ](https://github.com/knubie/vim-kitty-navigator)
- ~~tmux~~
    - ~~[ Tmux Plugin Manager ](https://github.com/tmux-plugins/tpm)~~
- fish
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

### Create symbolic links

make createSymLinks.js executable

```
chmod +x createSymLinks.js
```

run script

```
./createSymLinks.js
```

### No sudo on global npm packages
[ Detailed instructions ](https://github.com/sindresorhus/guides/blob/main/npm-global-without-sudo.md)

```
mkdir ~/.npm-packages
npm config set prefix '~/.npm-packages'
```

### TODO

- Replace createSymLinks with [ stow ](https://www.gnu.org/software/stow/)



