#!/bin/bash

# 通过 rofi 输入搜索关键词
query=$(rofi -dmenu -p "   Search:")

# 检查用户是否输入了内容
if [ -n "$query" ]; then
  # 使用浏览器打开 Google 搜索
  xdg-open "https://www.google.com/search?q=$(echo $query | sed 's/ /+/g')"

fi
