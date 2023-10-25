#!/bin/bash
album_art=$(playerctl -p tidal-hifi metadata mpris:artUrl)
#album_art=$(playerctl metadata mpris:artUrl)
if [[ -z $album_art ]]
then
   # tidal is dead, we should die to.
   exit
fi
curl -s  "${album_art}" --output "/tmp/cover.jpeg"
echo "/tmp/cover.jpeg"
