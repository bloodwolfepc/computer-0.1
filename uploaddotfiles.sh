sudo -v

dotfiles=(
    "$HOME/.config/nvim/init.lua"
    "/etc/pipewire"
    "$HOME/.config/sway/config"
    "$HOME/.config/swaync/config.json"
    "$HOME/.config/swaync/style.css"
    "$HOME/.config/waybar/config"
    "$HOME/.config/kitty/kitty.conf"
    "$HOME/.config/ranger/rc.conf"
    "$HOME/.config/ranger/rifle.conf"
    "$HOME/.config/ranger/scope.sh"
    "$HOME/.config/ranger/commands.py"
    "$HOME/.config/ranger/commands_full.py"
    "$HOME/.config/rofi/config.rasi"
    "$HOME/.config/neofetch/config.conf"
    "/usr/bin/neofetch"
    "$HOME/.config/khal/config"
    "$HOME/.config/vdirsyncer/config"
    "/bin/custom/steamgamename.sh"
    "/bin/custom/albumart.sh"
)

destination="$HOME/import/dotfiles/"
sudo mkdir -p "$destination"

for file in "${dotfiles[@]}"; do 
    filename=$(basename "$file")

    subdirectory=$(basename "$(dirname "$file")")
    destination_with_subdirectory="$destination$subdirectory/"
    sudo mkdir -p "$destination_with_subdirectory"



    echo "copying $file to $destination_with_subdirectory$filename"
    sudo cp -r "$file" "$destination_with_subdirectory$filename"
done

sudo mkdir -p $HOME/import/dotfiles/alsa
sudo cp $HOME/.asoundrc $HOME/import/dotfiles/alsa/
sudo mkdir -p $HOME/import/dotfiles/bashrc
sudo cp $HOME/.bashrc $HOME/import/dotfiles/bashrc/
echo "stealing alsa, stealing bashrc"

echo "process finish"

sudo -k
