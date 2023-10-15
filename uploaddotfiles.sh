host="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo -v

dotfiles=(
    "$HOME/.config/nvim/init.lua"
    "/etc/pipewire"
    "$HOME/.config/sway/config"
    "$HOME/.config/sway/monitor-config"
    "$HOME/.config/sway/style-config"
    "$HOME/.config/swaync/config.json"
    "$HOME/.config/swaync/style.css"
    "$HOME/.config/waybar/config"
    "$HOME/.config/waybar/style.css"
    "$HOME/.config/kitty/kitty.conf"
    "$HOME/.config/ranger/rc.conf"
    "$HOME/.config/ranger/rifle.conf"
    "$HOME/.config/ranger/scope.sh"
    "$HOME/.config/ranger/commands.py"
    "$HOME/.config/ranger/commands_full.py"
    "$HOME/.config/rofi/config.rasi"
    "$HOME/.config/neofetch/config.conf"
    "/usr/bin/neofetch"
    #"$HOME/.config/khal/config"
    #"$HOME/.config/vdirsyncer/config"
    #"/bin/custom/floatingkitty.sh"
    #"/bin/custom/steamgamename.sh"
    #"/bin/custom/albumart.sh"
    "$HOME/.config/gtk-3.0/settings.ini"
)

destination="$host/dotfiles/"
sudo mkdir -p "$destination"

for file in "${dotfiles[@]}"; do 
    filename=$(basename "$file")

    subdirectory=$(basename "$(dirname "$file")")
    destination_with_subdirectory="$destination$subdirectory/"
    sudo mkdir -p "$destination_with_subdirectory"



    echo "copying $file to $destination_with_subdirectory$filename"
    sudo cp -r "$file" "$destination_with_subdirectory$filename"
done


sudo mkdir -p $host/dotfiles/custom
sudo cp -r /bin/custom/* $host/dotfiles/custom/

sudo mkdir -p $host/dotfiles/home
sudo cp -r $HOME/.custom/* $host/dotfiles/home/.custom/

sudo mkdir -p $host/dotfiles/gtk2
sudo cp $HOME/.gtkrc-2.0 $host/dotfiles/gtk2/

sudo mkdir -p $host/dotfiles/alsa
sudo cp $HOME/.asoundrc $host/dotfiles/alsa/


sudo mkdir -p $host/dotfiles/zsh
sudo cp $HOME/.zshrc $host/dotfiles/zsh/
sudo cp $HOME/.zprofile $host/dotfiles/zsh/
suco cp $HOME/.zshenv $host/dotfiles/zsh/



echo "stealing alsa, stealing bashrc"

echo "process finish"

sudo -k
