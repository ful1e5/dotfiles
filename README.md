# dotfiles

My Minimal Configuration for Archlinux, neovim, fish-shell and more.

![screenshot](https://imgur.com/WAg4xDf.png)

## Tools that I use

- [Arch Linux](https://archlinux.org/) - Operating System
- [KDE plasma desktop](https://kde.org/plasma-desktop/) - Desktop Environment
- Wallpaper - Plain Color `#141618`
- [Konsole](https://konsole.kde.org/) - Terminal
- [fish](https://fishshell.com/) + [custom fish prompt](./fish/.config/fish/functions/) +
  [fisher](https://github.com/jorgebucaran/fisher) and various [other plugins](./fish/.config/fish/fish_plugins)
- [wl-clipboard-manager](https://github.com/bugaevc/wl-clipboard) - clipboard manager for Wayland.
- [Neovim](https://github.com/neovim/neovim) - Text Editor
- [Firefox Developer Edition](https://www.mozilla.org/en-US/firefox/developer/) - Browser
- [Kdenlive](https://kdenlive.org/en/) - Video Editor
- [KeePassXC](https://keepassxc.org/) - Password Manager
- [Paru](https://github.com/Morganamilo/paru) - Package Manager
- [Figma](https://www.figma.com) - Vector Designs tool (Web App)

## Usage

```bash
git clone https://github.com/ful1e5/dotfiles.git ~/.dotfiles
stow -S <dir>
```

## Remove Config

```bash
stow -D <dir>
```

## Pacman packages

```bash
pacman -Qqen > pkglist.txt  # save
pacman -S - < pkglist.txt   # install
```
