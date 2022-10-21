# 
# install
```sh 
git clone https://github.com/j2501987804/dotfiles
./install
```

nvim .xinitrc

``` sh
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US
export LC_CTYPE=en_US.UTF-8

xrdb -merge ~/.Xresources


# autostart
exec fcitx5 &
exec dwm
```

sudo nvim /etc/environment
``` sh
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
SDL_IM_MODULE=fcitx
GLFW_IM_MODULE=ibus
```

# 安装软件
``` sh
# 安装输入法
paru -S fcitx5-im fcitx5-chinese-addons fcitx5-qt fcitx5-gtk fcitx5-pinyin-zhwiki fcitx5-pinyin-sougou fcitx5-skin-material

# 字体
paru -S ttf-fira-code noto-fonts-emoji wqy-microhei ttf-symbola nerd-fonts-fira-code

# 
paru -S clash-for-windows-chinese everforest-gtk-theme-git lx-music-desktop-bin ly microsoft-edge-stable-bin picom-jonaburg-git telegram-desktop-bin rofi 
wezterm wqy-microhei lazygit nitrogen neovim autojump betterlockscreen alsa-utils 
```
