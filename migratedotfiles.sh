host="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
dotfiles="$host/dotfiles"
sudo -v

migrate-dot-files() {
    mkdir -p $HOME/.config/nvim
    cp $dotfiles/nvim/init.lua $HOME/.config/nvim/init.lua
    #cp -r $dotfiles/etc/pipewire /etc/pipewire
    mkdir -p $HOME/.config/sway
    sudo cp $dotfiles/sway/* $HOME/.config/sway/
    mkdir -p $HOME/.config/swaync
    cp $dotfiles/swaync/config.json $HOME/.config/swaync/config.json
    cp $dotfiles/swaync/style.css $HOME/.config/swaync/style.css
    mkdir -p $HOME/.config/waybar
    cp $dotfiles/waybar/config $HOME/.config/waybar/config
    cp $dotfiles/waybar/style.css $HOME/.config/waybar/style.css
    mkdir -p $HOME/.config/kitty
    cp $dotfiles/kitty/kitty.conf $HOME/.config/kitty/kitty.conf
    mkdir -p $HOME/.config/ranger
    cp -r $dotfiles/ranger/* $HOME/.config/ranger/
    mkdir -p $HOME/.config/rofi
    cp $dotfiles/rofi/config.rasi $HOME/.config/rofi/config.rasi
    mkdir -p $HOME/.config/neofetch
    cp $dotfiles/neofetch/config.conf $HOME/.config/neofetch/config.conf
    mkdir -p $HOME/.config/gtk-3.0
    cp $dotfiles/gtk-3.0/settings.ini $HOME/.config/gtk-3.0/settings.ini
    sudo cp $dotfiles/gtk2/.gtk2rc-2.0 $HOME/.gtkrc-2.0
    sudo cp $dotfiles/bin/neofetch /usr/bin/neofetch
    sudo mkdir -p /bin/custom
    sudo cp -r $dotfiles/custom/* /bin/custom/
    sudo cp $dotfiles/bashrc/.bashrc $HOME/.bashrc
    mkdir $HOME/.custom/pipewire
    sudo cp -r $dotfiles/pipewire/* $HOME/.custom/pipewire/

    echo "dotfiles migrated"
}

allocate-assets() {
sudo mkdir -p $HOME/.wallpapers
sudo cp -r $host/assets/wallpapers/* $HOME/.wallpapers/

sudo mkdir -p $HOME/.icons
sudo cp -r $host/assets/cursors/* /usr/share/icons/
    echo "assets allocated"

}

sudo -k

enable-services() {
sudo systemctl start sshd.service
sudo systemctl enable sshd.service

sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service

systemctl --user enable --now syncthing.service
systemctl --user start --now syncthing.service
#remember ssh commands ssh-keygen and ssh-copy-id
    "services enabled"
}

laptop-specifics() {
git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq && sudo ./auto-cpufreq-installer
sudo auto-cpufreq --install
cd ..
}
