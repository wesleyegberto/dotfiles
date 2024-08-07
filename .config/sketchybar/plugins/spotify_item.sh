#!/usr/bin/env sh

sketchybar -m --add    event           spotify_change "com.spotify.client.PlaybackStateChanged" \
           --add       item            spotify.name right \
           --set       spotify.name    icon="" \
                                       icon.color=$LABEL_COLOR \
                                       label.color=$LABEL_COLOR \
                                       label.drawing=off \
                                       background.color=$BACKGROUND_COLOR \
                                       popup.align=center \
                                       popup.horizontal=on \
                                       popup.blur_radius=10 \
                                       popup.height=25 \
                                       popup.background.border_width=2 \
                                       popup.background.border_color=$LABEL_COLOR \
                                       popup.background.color=$BACKGROUND_COLOR \
                                       popup.background.corner_radius=5 \
                                       popup.background.padding_left=4 \
                                       popup.background.padding_right=4 \
                                       click_script="osascript -e 'tell application \"Spotify\" to playpause'" \
           \
           --add       item            spotify.back popup.spotify.name \
           --set       spotify.back    icon=󰒮 \
                                       icon.font.size=25 \
                                       icon.padding_left=5 \
                                       icon.padding_right=5 \
                                       icon.color=$LABEL_COLOR \
                                       script="$PLUGIN_DIR/spotify.sh" \
                                       label.drawing=off \
           --subscribe spotify.back    mouse.clicked \
           \
           --add       item            spotify.play popup.spotify.name \
           --set       spotify.play    icon= \
                                       icon.font.size=25 \
                                       icon.padding_left=5 \
                                       icon.padding_right=5 \
                                       icon.color=$LABEL_COLOR \
                                       updates=on \
                                       label.drawing=off \
                                       script="$PLUGIN_DIR/spotify.sh" \
           --subscribe spotify.play    mouse.clicked spotify_change \
           \
           --add       item            spotify.next popup.spotify.name \
           --set       spotify.next    icon=󰒭 \
                                       icon.font.size=25 \
                                       icon.padding_left=5 \
                                       icon.padding_right=5 \
                                       icon.color=$LABEL_COLOR \
                                       label.drawing=off \
                                       script="$PLUGIN_DIR/spotify.sh" \
           --subscribe spotify.next    mouse.clicked \
           \
           --add       item            spotify.shuffle popup.spotify.name \
           --set       spotify.shuffle icon= \
                                       icon.highlight_color=0xff1DB954 \
                                       icon.padding_left=5 \
                                       icon.padding_right=5 \
                                       icon.color=$LABEL_COLOR \
                                       label.drawing=off \
                                       script="$PLUGIN_DIR/spotify.sh" \
           --subscribe spotify.shuffle mouse.clicked \
           \
           --add       item            spotify.repeat popup.spotify.name \
           --set       spotify.repeat  icon= \
                                       icon.highlight_color=0xff1DB954 \
                                       icon.padding_left=5 \
                                       icon.padding_right=5 \
                                       icon.color=$LABEL_COLOR \
                                       label.drawing=off \
                                       script="$PLUGIN_DIR/spotify.sh" \
           --subscribe spotify.repeat  mouse.clicked

