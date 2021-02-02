#!/usr/bin/node

const fs = require("fs");
const path = require("path");

const HOME = process.env.HOME;

const links = [
  { target: "init.vim", linkPath: ".config/nvim", file: "init.vim" },
  { target: "kitty.conf", linkPath: ".config/kitty", file: "kitty.conf" },
  { target: "config.fish", linkPath: ".config/fish", file: "config.fish" },
  { target: "starship.toml", linkPath: ".config", file: "starship.toml" },
  { target: "tmux.conf", file: ".tumux.conf" },
  { target: "zshrc", file: ".zshrc" },
  {
    target: "coc-settings.json",
    linkPath: ".config/nvim/",
    file: "coc-settings.json",
  },
  {
    target: "./coc/package.json",
    linkPath: ".config/coc/extensions",
    file: "package.json",
  },
  { target: "rifle.conf", linkPath: ".config/ranger", file: "rifle.conf" },
  { target: "rc.conf", linkPath: ".config/ranger", file: "rc.conf" },
];

links.forEach(({ target, linkPath, file }) => {
  // check if linkPath exists and create if it doesn't
  if (linkPath && !fs.existsSync(path.join(HOME, linkPath))) {
    fs.mkdirSync(path.join(HOME, linkPath), { recursive: true }, (err) => {
      if (err) throw err;
      console.log(`created directory: - ${HOME}/${linkPath}`);
    });
  }
  const fullFilePath = linkPath
    ? path.join(HOME, linkPath, file)
    : path.join(HOME, file);

  // check if file exists and remove if it does
  const fileExists = fs.existsSync(fullFilePath);
  if (fileExists) fs.unlinkSync(fullFilePath);

  // create the symlink
  fs.symlinkSync(path.join(HOME, "dotfiles", target), fullFilePath);
});

console.log("Sym links created!");
