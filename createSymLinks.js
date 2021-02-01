#!/usr/bin/node

const fs = require("fs");
const path = require("path");

const HOME = process.env.HOME;

const links = [
  { target: "init.vim", link: ".config/nvim/init.vim" },
  { target: "kitty.conf", link: ".config/kitty/kitty.conf" },
  { target: "config.fish", link: ".config/fish/config.fish" },
  { target: "starship.toml", link: ".config/starship.toml" },
  { target: "tmux.conf", link: ".tmux.conf" },
  { target: "zshrc", link: ".zshrc" },
  { target: "coc-settings.json", link: ".config/nvim/coc-settings.json" },
  { target: "coc/package.json", link: ".config/coc/extensions/package.json" },
  { target: "rifle.conf", link: ".config/ranger/rifle.conf" },
  { target: "rc.conf", link: ".config/ranger/rc.conf" },
];

links.forEach(({ target, link }) => {
  fs.symlinkSync(path.join(HOME, "dotfiles", target), path.join(HOME, link));
});

console.log("Sym links created!");
