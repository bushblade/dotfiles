#!/usr/bin/node

const fs = require("fs");
const path = require("path");

const HOME = process.env.HOME;

const links = [
  { target: "init.vim", path: ".config/nvim/init.vim" },
  { target: "kitty.conf", path: ".config/kitty/kitty.conf" },
  { target: "config.fish", path: ".config/fish/config.fish" },
  { target: "starship.toml", path: ".config/starship.toml" },
  { target: "tmux.conf", path: ".tmux.conf" },
  { target: "zshrc", path: ".zshrc" },
  { target: "coc-settings.json", path: ".config/nvim/coc-settings.json" },
  { target: "coc/package.json", path: ".config/coc/extensions/package.json" },
  { target: "rifle.conf", path: ".config/ranger/rifle.conf" },
  { target: "rc.conf", path: ".config/ranger/rc.conf" },
];

links.forEach(({ target, path }) => {
  fs.symlinkSync(path.join(HOME, "dotfiles", target), path.join(HOME, path));
});

console.log("Sym links created!");
