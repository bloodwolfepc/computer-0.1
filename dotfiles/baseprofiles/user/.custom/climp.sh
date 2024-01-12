
cp $HOME/.custom/wallpapers/Untitled.png /tmp/cover.jpeg


kitty --title spot --class spot spt &
sleep 0.5
imv -w imvalbumart /tmp/cover.jpeg &
sleep 0.5
swaymsg "[title=imvalbumart] splitv"
kitty --title lyr --class lyr lyricstify start --sync-type balance &
sleep 0.5
swaymsg "[app_id=lyr] move right"
swaymsg "[app_id=spot] splitv, mark --add spot"
kitty --title vis --class vis vis &
sleep 0.5
swaymsg "[app_id=vis] move left, resize set height 20ppt"


$HOME/.custom/app/spotify.sh &
sleep 3
spotpid=$(cat "/tmp/spotify.pid")

sleep 3
swaymsg "[pid=$spotpid] mark --add spotify"
sleep 0.5
swaymsg "[pid=$spotpid] move container to workspace number 19"


