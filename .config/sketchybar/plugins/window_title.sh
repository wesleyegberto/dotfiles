#!/bin/bash

local yabai_info
local window_title

yabai_info=$(yabai -m query --windows --window)

if [[ ! -z "$yabai_info" ]]; then
  local app_title
  app_title=$(echo $yabai_info | jq -r '.app')
  window_title="$app_title  $(echo $yabai_info | jq -r '.title')"

elif [ "$SENDER" = "front_app_switched" ]; then
  window_title="$INFO"
fi

if [[ ${#window_title} -eq 0 ]]; then
  exit 0
elif [[ ${#window_title} -gt 50 ]]; then
  window_title=$(echo "$window_title" | cut -c 1-60)
  sketchybar -m --set title label="$window_title"…
  exit 0
fi

sketchybar -m --set title label="$window_title"
