#kitty --start-as=minimized disable_startup_id &
kitty --title "floatingkitty"
#swaymsg [title="floatingkitty"] focus
#swaymsg mark --add floatingkitty
#swaymsg [class="kitty"] focus
#swaymsg [class="kitty"] move position 1920 1080
#swaymsg '[con_mark="kitty"]' move scratchpad
#swaymsg mark --add kitty
#
#ydotool key 126:1 33:1 49:1 49:0 33:0 126:0

