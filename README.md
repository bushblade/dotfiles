# Just my dotfiles 👨🏻‍💻

### Install packages

- neovim 
    - [ Plug ]( https://github.com/junegunn/vim-plug )
- kitty
- tmux 
    - [ Tmux Plugin Manager ](https://github.com/tmux-plugins/tpm)
- fish
- ranger
- nnn
- starship
- exa
- bat
- fd
- tldr
- cht.sh
- node & npm
- python & pip

### Change shell to fish

```
chsh -s /bin/fish
```

### Create symbolic links

make file executable

```
chmod +x createSymLinks.json
```

run script

```
./createSymLinks.js
```

AutoStart for compton...

```bash
sh -c picom --config ~/.config/compton.conf -b
```
