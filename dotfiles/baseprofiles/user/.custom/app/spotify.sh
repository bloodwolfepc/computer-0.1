pkill spotify
rm "/tmp/spotify.pid"
spotify --uri%U

# WAYLAND FEATURE --enable-features=UseOzonePlatform --ozone-platform=wayland &
sleep 1
echo $! > "/tmp/spotify.pid"
