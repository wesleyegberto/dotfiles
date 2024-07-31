#!/usr/bin/env sh

POPUP_SCRIPT="sketchybar -m --set \$NAME popup.drawing=toggle"

next() {
  osascript -e 'tell application "Spotify" to play next track'
}

back() {
  osascript -e 'tell application "Spotify" to play previous track'
}

play() {
  osascript -e 'tell application "Spotify" to playpause'
}

repeat() {
  REPEAT=$(osascript -e 'tell application "Spotify" to get repeating')
  if [ "$REPEAT" = "false" ]; then
    sketchybar -m --set spotify.repeat icon.highlight=on
    osascript -e 'tell application "Spotify" to set repeating to true'
  else
    sketchybar -m --set spotify.repeat icon.highlight=off
    osascript -e 'tell application "Spotify" to set repeating to false'
  fi
}

shuffle() {
  SHUFFLE=$(osascript -e 'tell application "Spotify" to get shuffling')
  if [ "$SHUFFLE" = "false" ]; then
    sketchybar -m --set spotify.shuffle icon.highlight=on
    osascript -e 'tell application "Spotify" to set shuffling to true'
  else
    sketchybar -m --set spotify.shuffle icon.highlight=off
    osascript -e 'tell application "Spotify" to set shuffling to false'
  fi
}

update() {
  PLAYING=1
  if [ "$(echo "$INFO" | jq -r '.["Player State"]')" = "Playing" ]; then
    PLAYING=0
    TRACK="$(echo "$INFO" | jq -r .Name | cut -c1-20)"
    ARTIST="$(echo "$INFO" | jq -r .Artist | cut -c1-20)"
    ALBUM="$(echo "$INFO" | jq -r .Album | cut -c1-20)"
    SHUFFLE=$(osascript -e 'tell application "Spotify" to get shuffling')
    REPEAT=$(osascript -e 'tell application "Spotify" to get repeating')
  fi

  args=()
  if [ $PLAYING -eq 0 ]; then
    if [ "$ARTIST" == "" ]; then
      args+=(--set spotify.name label="$TRACK 󰠃 $ALBUM" label.drawing=on click_script="$POPUP_SCRIPT")
    else
      args+=(--set spotify.name label="$TRACK 󰠃 $ARTIST" label.drawing=on click_script="$POPUP_SCRIPT")
    fi

    args+=(--set spotify.play icon=󰏤 \
           --set spotify.shuffle icon.highlight=$SHUFFLE \
           --set spotify.repeat icon.highlight=$REPEAT)
  else
    args+=(--set spotify.name label.drawing=off \
                              popup.drawing=off \
                              click_script="osascript -e 'tell application \"Spotify\" to playpause'" \
           --set spotify.play icon=)
  fi
  sketchybar -m "${args[@]}"
}

mouse_clicked() {
  case "$NAME" in
    "spotify.next") next
    ;;
    "spotify.back") back
    ;;
    "spotify.play") play
    ;;
    "spotify.shuffle") shuffle
    ;;
    "spotify.repeat") repeat
    ;;
    *) exit
    ;;
  esac
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  "forced") exit
  ;;
  *) update
  ;;
esac
