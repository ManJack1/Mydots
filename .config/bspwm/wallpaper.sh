#!/bin/bash

# 壁纸目录（使用安装的 Nordic Wallpapers 路径）
WALLPAPER_DIR="/usr/share/backgrounds/nordic-wallpapers"

# 随机选择一个壁纸
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# 使用 feh 设置壁纸
feh --bg-scale "$WALLPAPER"
