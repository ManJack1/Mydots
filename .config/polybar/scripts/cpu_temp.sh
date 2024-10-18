#!/bin/bash

# 获取 CPU 温度
temperature=$(sensors | grep 'Tctl' | awk '{print $2}' | sed 's/+//g' | sed 's/°C//g')

# 根据温度设置图标和颜色
if (($(echo "$temperature < 40" | bc -l))); then
  icon=""
  color="#8FBCBB" # Nord7 冰蓝色（低温）
elif (($(echo "$temperature >= 40 && $temperature < 60" | bc -l))); then
  icon=""
  color="#88C0D0" # Nord8 青色（中等温度）
elif (($(echo "$temperature >= 60 && $temperature < 80" | bc -l))); then
  icon=""
  color="#EBCB8B" # Nord13 淡黄色（较高温度）
else
  icon=""
  color="#BF616A" # Nord11 红色（高温警告）
fi

# 输出带颜色的图标和温度
echo "%{F$color}$icon $temperature°C%{F-}"
