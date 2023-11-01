#!/bin/bash

host="$HOME/computer-0.1"
#host="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
dotfiles="$host/dotfiles"
pkg="$host/packages"
faillog="$HOME/.custom/faillog.txt"


path_list=(
    "$HOME/.config/nvim/init.lua"
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
    "$HOME/.config/gtk-3.0/settings.ini"
    "$HOME/.custom"
    "$HOME/.gtkrc-2.0"
    #"$HOME/.asoundrc"
    "$HOME/.zshrc"
    "$HOME/.zprofile"
    "$HOME/.zshenv"
    "$HOME/.wallpapers"
    "/usr/share/icons/Qogir-Recolored-Dracula-Purple"
    #"/usr/share/icons/"
    "$HOME/.config/qutebrowser/config.py"
    "$HOME/.config/qutebrowser/quickmarks"
)

upload-dotfiles() {
sudo -v
sudo mkdir -p "$dotfiles"
for filepath in "${path_list[@]}"; do
    directory=$(dirname "$filepath")
    base=$(basename "$filepath")
     #change $HOME to 'user' if $HOME exists in filepath
    first_two=$(echo "$directory" | awk -F'/' '{print "/" $2 "/" $3}' )
        if [ "$first_two" = "$HOME" ]; then
            directory_fixed_name="/$(echo $directory | sed 's|/home/[^/]*|user|')"
            sudo mkdir -p "$dotfiles$directory_fixed_name"
            sudo cp -r "$directory/$base" "$dotfiles$directory_fixed_name"
            echo "copying $directory/$base to $dotfiles$directory_fixed_name"
        else
            sudo mkdir -p "$dotfiles$directory"
            sudo cp -r "$directory/$base" "$dotfiles$directory"
            echo "copying $directory/$base to $dotfiles$directory"
        fi
echo "-------------"
done
echo "process finish"
sudo -k
}

migrate-dotfiles() {
sudo -v
        echo -n "are you sure you want to migrate dotfiles? This will overwrite existing dotfiles (Y/N): "
        read answer

    if [[ "$answer" =~ ^[Yy]$ ]]; then
        for filepath in "${path_list[@]}"; do 
            non_home_dir=$(echo "$filepath" | sed "s|$HOME||")
            filepath_no_base=$(dirname "$filepath")
            usr="/user"
                if [[ $filepath == $HOME* ]]; then
                    echo "copying $dotfiles$usr$non_home_dir to $filepath_no_base"
                    sudo cp -r "$dotfiles$usr$non_home_dir" "$filepath_no_base"
                else
                    echo "copying $dotfiles$non_home_dir to $filepath_no_base"
                    sudo cp -r "$dotfiles$non_home_dir" "$filepath_no_base"
                fi
            echo "-------------"
        done
    else
        echo "migrate dotfiles canceled"
    fi
echo "precoess finish"
sudo -k
}
#first_one=$(echo "$directory" | awk -F'/' '{print "/" $2}')

install-packages() { 
    mkdir -p $HOME/.custom
    local manager="$1"
    local packagelist="$2"
    if [ -f "$packagelist" ]; then
        case "$manager" in 
            "pac")
                while IFS= read -r package; do 
                    if [ -n "$package" ]; then
                        sudo pacman -S --needed --noconfirm "$package" || echo "pac package not found: $package" >> $faillog
                    fi 
                done <"$packagelist"
                ;;
            "aur")
                while IFS= read -r package; do 
                    if [ -n "$package" ]; then 
                        yay -S --needed --noconfirm "$package" || echo "aur package not found: $package" >> $faillog
                    fi 
                done < "$packagelist"
                ;;
            *)
                echo "package manager unrecognized: $manager" >> $faillog
                ;;
        esac
    else 
            echo "packagelist not found: $packagelist" >> $faillog
    fi 
}


enable-services() {
sudo systemctl start sshd.service
sudo systemctl enable sshd.service

sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service
#remember ssh commands ssh-keygen and ssh-copy-id
   echo "services enabled"
}

home-permissions() {
sudo chmod -R u+rwX $HOME
sudo chown -R $USER:$USER $HOME
}

install-laptop-specifics() {
git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq && sudo ./auto-cpufreq-installer
sudo auto-cpufreq --install
cd ..
}

use-zsh() {
chsh -l 
chsh -s /bin/zsh
sudo mkdir -p ~/.zshhplug
echo "for adding plugins for zsh run 'install-git-packages'"
}


install-git-packages() {
mkdir -p ~/.zshplug
cd ~/.zshplug
git clone https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search
git clone https://github.com/fdw/ranger-autojump
mkdir -p ~/.config/ranger
mkdir -p ~/.config/ranger/plugins
cd ~/.config/ranger/plugins
git clone https://github.com/alexanderjeurissen/ranger_devicons
git clone https://github.com/maximtrp/ranger-archives.git
git clone https://github.com/fdw/ranger-autojump
git clone https://github.com/MuXiu1997/ranger-fzf-filter

cp ~/.config/ranger/plugins/ranger-autojump/autojump.py ~/.config/ranger/plugins/
} 

install-discord-screenaudio() {
    cd $HOME
    git clone https://github.com/maltejur/discord-screenaudio.git
    cd discord-screenaudio
    cmake -B build
    cmake --build build --config Release
    cd ..
}

install-yay() {
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
}

install-bottles() {
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	flatpak install bottles
}
install-ableton() {
        #installer zip must be downloaded inside of ~/Downloads

	flatpak run --command=bottles-cli com.usebottles.bottles new --bottle-name ableton --environment application
        cp $host/dotfiles/ableton/ableton.desktop $HOME/.local/share/applications/ableton.desktop
        update-desktop-database $HOME/.local/share/applications/
}

