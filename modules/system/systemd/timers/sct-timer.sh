#!/usr/bin/env sh

current_hour=$(date +"%H")
current_minute=$(date +"%M")

if [ "$current_hour" -ge 21 ]; then
  sct 1600
else
    sct
fi
