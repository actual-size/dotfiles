#! /usr/bin/env sh

current_space_index="$(yabai -m query --spaces --space | jq .index)"
if yabai -m query --windows --space "${current_space_index}" |
  jq -er 'length == 0'
then
  yabai -m space "${current_space_index}" --destroy
  yabai -m space --focus "${current_space_index - 1}"
fi

