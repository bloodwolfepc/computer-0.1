#!/bin/bash

host="$HOME/computer-0.1"
dotfiles="$host/dotfiles"
#host="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#dotfiles="$host/dotfiles"
faillog="$HOME/.faillog.txt"
source "$host/pkglist.sh"
cfg="$HOME/.config"
baseprofiles=( #dotfile_array
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
    #"$HOME/.wallpapers"
    "/usr/share/icons/Qogir-Recolored-Dracula-Purple"
    #"/usr/share/icons/"
    "$HOME/.config/qutebrowser/config.py"
    #"$HOME/.config/qutebrowser/quickmarks"
    "$HOME/.config/qutebrowser/greasemonkey"
    "$HOME/.config/mpv/mpv.conf"
    "$HOME/.config/xdg-desktop-portal/portals.conf"
    "$HOME/.asoundrc"
    "$cfg/spotify-tui/config.yml"
    "$cfg/imv/config.ini"
    "/etc/keyd/default.conf" #gotta think of a modding thing for load to here

)

depath="/usr/share/applications"
de=(
    "$depath/cockos-reaper.desktop"
    "$depath/climp.desktop"
    "$depath/steam.desktop"
)

sparkle=(
    "$HOME/.config/sway/style-config"
)
blackout=(
    "$HOME/.config/sway/style-config"
)




#todo add backup and deletion system
profile() {

backup_cache="$HOME/.cache"
function=$1
profile_name=$2
eval "specified_array=(\$${profile_name})"

destination="$host/dotfiles/$profile_name"

if [ -z "$profile_name" ] || [ ! -v "$profile_name[@]" ]; then
    echo "no such profile recognised"
    return 1
fi

if [ "$function" = "save" ]; then
sudo -v
sudo mkdir -p "$destination"
for filepath in "${specified_array[@]}"; do
    directory=$(dirname "$filepath")
    base=$(basename "$filepath")
     #change $HOME to 'user' if $HOME exists in filepath
    first_two=$(echo "$directory" | awk -F'/' '{print "/" $2 "/" $3}' )
        if [ "$first_two" = "$HOME" ]; then
            directory_fixed_name="/$(echo $directory | sed 's|/home/[^/]*|user|')"
            sudo mkdir -p "$destination$directory_fixed_name"
            sudo cp -r "$filepath" "$destination$directory_fixed_name"
            echo "copying $filepath to $destination$directory_fixed_name"
        else
            sudo mkdir -p "$destination$directory"
            sudo cp -r "$filepath" "$destination$directory"
            echo "copying $filepath to $destination$directory"
        fi
echo "-------------"
done
echo "process finish"
echo "computersave specified directores to $destination"
sudo -k


#else
elif [ "$function" = "load" ]; then
       loadbu="$backup_cache/load"

    #if [[ "$answer" =~ ^[Yy]$ ]]; then
        for filepath in  "${specified_array[@]}"; do
            non_home_dir=$(echo "$filepath" | sed "s|$HOME||")
            filepath_no_base=$(dirname "$filepath")/
            usr="/user"
            profilename="/$profile_name"
                if [[ $filepath == $HOME* ]]; then
                    echo "copying $dotfiles$profilename$usr$non_home_dir to $filepath_no_base"
                    mkdir -p "$filepath_no_base"
                    mkdir -p "$loadbu"
                    cp -r "$filepath" "$loadbu"
                    cp -r "$dotfiles$profilename$usr$non_home_dir" "$filepath_no_base"
                else
                    mkdir -p "$filepath_no_base"
                    mkdir -p "$loadbu"
                    echo "copying $dotfiles$profilename$non_home_dir to $filepath_no_base"
                    cp -r "$filepath" "$loadbu"
                    cp -r "$dotfiles$profilename$non_home_dir" "$filepath_no_base"

                fi
            echo "-------------"
        done
        echo "process finished"
    fi 
}

#first_one=$(echo "$directory" | awk -F'/' '{print "/" $2}')

pkginst() {
sudo -v
local manager="$1"
local pkglist="$2"
#write for every name of array in pkglist
#match is with $pkglist
eval specified_pkglist="$pkglist"[@]
#bash (\${$pkglist[@]})
#zsh (\$${pkglist}[@])
#this causes some sort of discrepency with bash 


    if [ "${#specified_pkglist[@]}" -gt 0 ]; then
        case "$manager" in 
            "pac")
                for package in "${specified_pkglist[@]}"; do 
                    if [ -n "$package" ]; then
                        sudo pacman -S --needed --noconfirm "$package" || echo "pac package not found: $package" >> $faillog
                    fi 
                done 
                ;;
            "aur")
                for package in "${specified_pkglist[@]}"; do 
                    if [ -n "$package" ]; then 
                        yay -S --needed --noconfirm "$package" || echo "aur package not found: $package" >> $faillog
                    fi 
                done
                ;;
            "flat")
                for package in "${specified_pkglist[@]}"; do
                    if [ -n "$package" ]; then
                        flatpak install --if-not-exists flathub "$package"
                    fi
                done
                ;;
            *)
                echo "package manager unrecognized: $manager" >> $faillog
                ;;
        esac
    else 
            echo "packagelist not found: $packagelist" >> $faillog
    fi
sudo -k
}

enable_services() {
suod -v
sudo systemctl enable sshd.service
sudo systemctl start sshd.service
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
sudo systemctl enable cpupower.service
sudo systemctl start cpupower.service
systemctl --user enable spotifyd.service
systemctl --user start spotifyd.service
echo "services enabled"
sudo -k
}

setup_vpn() {
groupadd -r nordvpn
sudo gpasswd -a $USER nordvpn
sudo usermod -aG nordvpn $USER
sudo systemctl enable nordvpnd.service
sudo systemctl start nordvpnd.service
}

home_permissions() {
sudo chmod -R u+rwX $HOME
sudo chown -R $USER:$USER $HOME
}

: 'install_laptop_specifics() { #dont use it
git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq && sudo ./auto-cpufreq-installer
sudo auto-cpufreq --install
cd ..
}
'

use_zsh() {
sudo -v
sudo pacman -S zsh --needed -noconfirm
chsh -l 
chsh -s /bin/zsh
sudo mkdir -p ~/.zshplug
echo "for adding plugins for zsh run 'install-git-packages'"
sudo -k
}


install_git_packages() {
#zsh plugin
mkdir -p ~/.zshplug
cd ~/.zshplug
git clone https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search
git clone https://github.com/fdw/ranger-autojump
#ranger plugins
mkdir -p ~/.config/ranger
mkdir -p ~/.config/ranger/plugins
cd ~/.config/ranger/plugins
git clone https://github.com/alexanderjeurissen/ranger_devicons
git clone https://github.com/maximtrp/ranger-archives.git
git clone https://github.com/fdw/ranger-autojump
git clone https://github.com/MuXiu1997/ranger-fzf-filter
#zsh/ranger
cp ~/.config/ranger/plugins/ranger-autojump/autojump.py ~/.config/ranger/plugins/
#TODO:add the one reaper
} 

: '
install-discord-screenaudio() {
    cd $HOME
    git clone https://github.com/maltejur/discord-screenaudio.git
    cd discord-screenaudio
    cmake -B build
    cmake --build build --config Release
    cd ..
}
'

install_yay() {
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
}

install_flathub() {
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

: ' #probably not going to bother
install-ableton() {
        #installer zip must be downloaded inside of ~/Downloads

	flatpak run --command=bottles-cli com.usebottles.bottles new --bottle-name ableton --environment application
        cp $host/dotfiles/ableton/ableton.desktop $HOME/.local/share/applications/ableton.desktop
        update-desktop-database $HOME/.local/share/applications/
}
'
remove_amdvlk() {
sudo pacman -R amdvlk lib32-amdvlk --noconfirm
}

utilize_var_sh() {
echo "#testinput" >> $HOME/.var.sh
}

wineasio_setup() {
sudo usermod -aG realtime $(whoami)
}

symlink_custom() {
sudo ln -s $HOME/.custom /usr/local/bin/.custom
}
