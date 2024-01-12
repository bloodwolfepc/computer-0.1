spotpid=$(cat "/tmp/spotify.pid")
swaymsg "[pid=$spotpid] swap container with mark spot"
swaymsg "mode register"
