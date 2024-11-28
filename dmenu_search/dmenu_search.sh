#!/bin/sh

SEARCH_TERM=""
#dmenu -p "Wikipedia Search:" -fn "monospace:size=20"
SEARCH_TERM=$(tac search_history.txt | dmenu -p "Wikipedia Search:" -fn "monospace:size=20")

SEARCH_TERM=$(echo "$SEARCH_TERM" | tr ' ' '_')

echo "$SEARCH_TERM" >> search_history.txt

xdg-open "https://en.wikipedia.org/wiki/$SEARCH_TERM"
