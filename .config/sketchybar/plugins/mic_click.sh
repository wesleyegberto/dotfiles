#!/bin/bash

MIC_VOLUME=$(osascript -e 'input volume of (get volume settings)')

if [[ $MIC_VOLUME -eq 0 ]]; then
    osascript -e 'set volume input volume 100'
    sketchybar -m --set mic icon= icon.color=0xff010101

elif [[ $MIC_VOLUME -gt 0 ]]; then
    osascript -e 'set volume input volume 0'
    sketchybar -m --set mic icon= icon.color=0xffff0000
fi
