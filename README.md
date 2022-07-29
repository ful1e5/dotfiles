# dotfiles

My Minimal Configuration for Archlinux, neovim, fish-shell and more.

![screenshot](screenshot.png)

## Tools that I use

- [Arch Linux](https://archlinux.org/) - Operating System
- [KDE plasma desktop](https://kde.org/plasma-desktop/) (desktop environment)
- [Hack Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack) - Font
- [The Field](https://www.reddit.com/r/wallpaper/comments/vmc9fw/the_field_3840x2160/) - Wallpaper
- [Konsole](https://konsole.kde.org/) - Terminal
- [fish](https://fishshell.com/) + [fisher](https://github.com/jorgebucaran/fisher) and various other plugins
- [wl-clipboard-manager](https://github.com/bugaevc/wl-clipboard) - clipboard manager for Wayland.
- [Neovim](https://github.com/neovim/neovim) - Text Editor
- [Firefox Developer Edition](https://www.mozilla.org/en-US/firefox/developer/) - Browser
- [Kdenlive](https://kdenlive.org/en/) - Video Editor
- [KeePassXC](https://keepassxc.org/) - Password Manager
- [Paru](https://github.com/Morganamilo/paru) - Package Manager
- [Figma](https://www.figma.com) - Vector Designs (Web App)

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
