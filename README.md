# Dotfiles

Inspired by the [dotfiles](https://github.com/frankebel/dotfiles) and
[Arch install script](https://github.com/frankebel/archinstall) created by the mighty
@frankebel and this wonderful
[guide](https://gist.github.com/mjkstra/96ce7a5689d753e7a6bdd92cdc169bae).

## Software

| Type                  | Name                                                                            |
| :-------------------- | :------------------------------------------------------------------------------ |
| OS                    | [Arch Linux](https://archlinux.org/)                                            |
| Filesystem            | [BTRFS](https://btrfs.readthedocs.io/en/latest/#)                               |
| Bootloader            | [Grub](https://www.gnu.org/software/grub/)                                      |
| Backups               | [btrbk](https://github.com/digint/btrbk)                                        |
| Display Manager       | [ReGreet](https://github.com/rharish101/ReGreet/)                               |
| Compositor            | [Hyprland](https://hyprland.org/)                                               |
| Font                  | [DejaVu](https://dejavu-fonts.github.io/)                                       |
| Notification Daemon   | [Dunst](https://dunst-project.org/)                                             |
| Status Bar            | [Waybar](https://github.com/Alexays/Waybar)                                     |
| Application Launcher  | [Wofi](https://hg.sr.ht/~scoopta/wofi)                                          |
| Clipboard             | [wl-clipboard](https://github.com/bugaevc/wl-clipboard)                         |
| Clipboard Manager     | [cliphist](https://github.com/sentriz/cliphist)                                 |
| Shell                 | [Bash](https://www.gnu.org/software/bash/)                                      |
| Terminal Emulator     | [Kitty](https://sw.kovidgoyal.net/kitty/)                                       |
| Shell Prompt          | [Starship](https://starship.rs)                                                 |
| Text Editor           | [Neovim](https://neovim.io/)                                                    |
| Network Control GUI   | [Network-Manager-Applet](https://gitlab.gnome.org/GNOME/network-manager-applet) |
| Bluetooth Control GUI | [Blueman](https://github.com/blueman-project/blueman)                           |
| PDF Viewer            | [Zathura](https://pwmt.org/projects/zathura/)                                   |
| Browser               | [Firefox](https://www.mozilla.org/en-US/firefox/)                               |
| E-Mail                | [Thunderbird](https://www.thunderbird.net/en-US/)                               |

## Installation

1. Clone this repository
2. `cd archinstall`
3. Edit `install.sh` to set the desired configuration.
4. Run `./install.sh`
5. Reboot and log into the new system.
6. Run `./setup.sh`
7. Reboot and enjoy!

Optional:

- Generate new ssh-key for remote connectivity.

## To-Do

- [x] Persistent clipboard
- [x] Nvidia graphics driver
- [x] Set up [Bluetooth](https://wiki.archlinux.org/title/Bluetooth)
- [ ] Set up password manager
- [x] Set up shell prompt
- [ ] Style shell prompt
- [ ] Change to zsh?
- [ ] Set up SSD trim
- [ ] Set up AUR
- [ ] Fix rendering of italics
- [ ] Style display manger
- [ ] Set up firewall?
