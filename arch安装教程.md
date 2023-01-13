# 本地化

sudo nvim /etc/locale.gen 【移除对应的注释】

```sh
en_US.UTF-8 UTF-8
zh_CN.UTF-8 UTF-8
zh_SG.UTF-8 UTF-8
```

执行命令

```sh
sudo locale-gen
```

`~/.xinitrc` 或 `~/.xprofile` 中设置【.xprofile，dm启动桌面时候会执行】

> cp /etc/X11/xinit/xinitrc ~/.xinitrc
>
> 环境变量设置要在启动窗口管理器之前设置

```sh
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US
```



fcitx5输入法环境变量

sudo nvim /etc/environment

```sh
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
SDL_IM_MODULE=fcitx
GLFW_IM_MODULE=ibus
```



创建默认的用户目录

```sh
xdg-user-dirs-update
```

切换shell

```sh
chsh -s /usr/bin/zsh
```





# 换源

sudo nvim /etc/pacman.d/mirrorlist ，在文件的最顶端添加

```sh
Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch
```



sudo vim /etc/pacman.conf ,aur cn源【在最末添加】

```sh
[archlinuxcn] 
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
```

安装paru

```
sudo pacamn -Sy archlinuxcn-keyring
sudo pacamn -S paru
```



安装软件

```sh
yay -S wqy-zenhei fcitx5-im fcitx5-chinese-addons fcitx5-pinyin-zhwiki xdg-user-dirs bluez bluez-utils blueman zsh base-devel go clang nodejs npm python wezterm microsoft-edge-stable-bin yay lazygit ranger unzip input-remapper-git wqy-zenhei thunar betterlockscreen xautolock flameshot copyq input-remapper-control ueberzug

yay -S awesome-git picom-git alacritty mpc playerctl ncmpcpp mpd xdg-utils \
pipewire pipewire-pulse pipewire-alsa alsa-utils feh rofi maim \
xclip jq pamixer colord mpdris2 imagemagick inotify-tools --needed
```



启用登录和蓝牙

```sh
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service

# 登陆管理器
sudo systemctl enable slim
```


# 个人配置

```sh
git clone git@github.com:j2501987804/dotfiles.git
cd dotfiles
./install
cp -rf misc/fonts ~/.local/share/
```





# 美化

```sh
yay -S picom-git nerd-fonts-fira-code catppuccin-gtk-theme-mocha tela-circle-icon-theme-git 
```

