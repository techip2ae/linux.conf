
# BEGINING 

> Для применения конфигов  
> `mv ~/linux.conf/dotfiles`
> `stow -t ~ --adopt .`



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
