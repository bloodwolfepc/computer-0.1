#!/bin/bash

# Get the list of game names
game_names=$(ls -d /mnt/ssd2/SteamLibrary/steamapps/common/* | awk -F/ '{print $NF}' | sed -e '1s/^/|/' -e '$s/$/|/' | paste -sd "|")

# Create a temporary script to generate and run for_window rules
temp_script=$(mktemp)
echo "#!/bin/bash" > "$temp_script"

IFS="|" read -ra games <<< "$game_names"
for game in "${games[@]}"; do
    echo "for_window [title=\"$game\"] move container to workspace 7" >> "$temp_script"
done | swaymsg

# Make the script executable and run it
chmod +x "$temp_script"
"$temp_script"

cp "$temp_script" "/tmp/inspect.sh"
# Remove the temporary script
rm -f "$temp_script"

#you can't get em' all :<
swaymsg "for_window [title=PizzaTower.exe] move container to workspace 7"
