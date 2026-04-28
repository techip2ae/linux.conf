
# BEGINING 

> Для применения конфигов  
> `mv ~/linux.conf/dotfiles`
> `stow -t ~ --adopt .`



# Programs 

GNU file manager:   `sudo pacman -S thunar`
TUI file manager:   `sudo pacman -S yazi` 
gvim:               `sudo pacman -S gvim`
louncher:           `sudo pacman -S rofi`
bluetooth:          `sudo pacman -S bluez bluez-utils`
clipboard:          `pacman -S wl-clipboard cliphist wl-clip-persist wtype`

## Install theme tools
`sudo pacman -S nwg-look kvantum qt6ct adwaita-theme catppuccin-gtk-theme-mocha kvantum-theme-catppuccin`

# Yay
install: 

```
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

## shell
- `sudo pacman -S zsh`
- install:
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
```

# Fonts

`woff2-font-awesome otf-font-awesome noto-fonts-emoji noto-fonts noto-fonts-cjk`
