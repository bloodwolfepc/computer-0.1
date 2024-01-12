#!/bin/bash

#album_art=$(playerctl -p firefox metadata mpris:artUrl)
#album_art=$(playerctl -p spotify metadata mpris:artUrl)
#
#have a funny idea to add a test card when art is absent
#
#
player="spotify"


if ! command -v playerctl &> /dev/null; then
   exit
fi

check_song_change() {
   current_song=$(playerctl -p $player metadata album)
   if [ "$current_song" != "$previous_song" ]; then
      previous_song="$current_song"
      return 0
   else
      return 1 #nonzero means false
   fi
}

change_album_art() {
   if check_song_change; then
      album_art=$(playerctl -p $player metadata mpris:artUrl)
      curl -s  "$album_art" --output "/tmp/cover.jpeg"
   fi
}

while true; do
   change_album_art
   sleep 3
done
